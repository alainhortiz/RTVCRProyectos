<?php

namespace AppBundle\Controller;

use DateTime;
use Exception;
use Symfony\Bundle\FrameworkBundle\Controller\Controller;
use Sensio\Bundle\FrameworkExtraBundle\Configuration\Route;
use Symfony\Component\HttpFoundation\Request;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\HttpFoundation\Session\Session;

class SecurityController extends Controller
{
    /**
     * @Route("/login", name="login")
     */
    public function loginAction()
    {
        $authUtils = $this->get('security.authentication_utils');
        $error = $authUtils->getLastAuthenticationError();
        $lastUsername = $authUtils->getLastUsername();

        return $this->render('Inicio/login.html.twig',
            array(
                'last_username' => $lastUsername,
                'error' => $error,
            ));
    }

    /**
     * @Route("/login_check", name="login_check")
     */
    public function login_checkAction()
    {
    }

    /**
     * @Route("/logout", name="logout")
     */
    public function logoutAction()
    {
    }

    /**
     * @Route("/inicio", name="inicio")
     * @throws Exception
     */
    public function inicioAction()
    {
        $hoy = new DateTime('now');
        $em = $this->getDoctrine()->getManager();
        $user = $this->getUser();

        $tiempoClave = $em->getRepository('AppBundle:Usuario')->verificarTiempoPassword($user->getId());

        $session = new Session();
        $session->set('comprobacion', false);

        if (!$session->get('comprobacion') && count($tiempoClave) !== 0) {
            $fechaFinal = new DateTime($tiempoClave[0]['fechaFinClave']->format('Y-m-d'));
            $cantDias = date_diff($hoy, $fechaFinal);
            if ($hoy <= $fechaFinal) {
                if ($cantDias->days >= 0 && $cantDias->days <= 5) {
                    return $this->render('Inicio/claveAlerta.html.twig', array(
                        'cantDias' => $cantDias->days
                    ));
                }
            } else {
                return $this->render('Inicio/claveVencida.html.twig');
            }
            $session->set('comprobacion', true);
        }

        $presupuestoPagado = $em->getRepository('AppBundle:ProyectoPersonaCargo')->totalPresupuestoPagado();
        $presupuestoPorPagar = $em->getRepository('AppBundle:ProyectoPersonaCargo')->totalPresupuestoPorPagar();
        $graficosTotalesCargosContratos  = $em->getRepository('AppBundle:ProyectoPersonaCargo')->graficoTotalesCargosContratos();
        $graficosTotalCategoriasProyecto  = $em->getRepository('AppBundle:Proyecto')->graficoTotalesCategoriasProyecto();

        return $this->render('Inicio/inicio.html.twig', array(
            'presupuestoPagado' => $presupuestoPagado,
            'presupuestoPorPagar' => $presupuestoPorPagar,
            'graficosTotalesCargosContratos' => $graficosTotalesCargosContratos,
            'graficosTotalCategoriasProyecto' => $graficosTotalCategoriasProyecto
        ));

    }

    /**
     * @Route("/inicio2", name="inicio2")
     */
    public function inicio2Action()
    {
        $em = $this->getDoctrine()->getManager();

        $presupuestoPagado = $em->getRepository('AppBundle:ProyectoPersonaCargo')->totalPresupuestoPagado();
        $presupuestoPorPagar = $em->getRepository('AppBundle:ProyectoPersonaCargo')->totalPresupuestoPorPagar();
        $graficosTotalesCargosContratos  = $em->getRepository('AppBundle:ProyectoPersonaCargo')->graficoTotalesCargosContratos();
        $graficosTotalCategoriasProyecto  = $em->getRepository('AppBundle:Proyecto')->graficoTotalesCategoriasProyecto();

        return $this->render('Inicio/inicio.html.twig', array(
            'presupuestoPagado' => $presupuestoPagado,
            'presupuestoPorPagar' => $presupuestoPorPagar,
            'graficosTotalesCargosContratos' => $graficosTotalesCargosContratos,
            'graficosTotalCategoriasProyecto' => $graficosTotalCategoriasProyecto
        ));

    }

    /**
     * @Route("/passwordForm", name="passwordForm")
     */
    public function passwordFormAction()
    {
        return $this->render('Nomencladores/GestionUsuario/cambiarPassword.html.twig');
    }

    /**
     * @Route("/passwordFormVencida", name="passwordFormVencida")
     */
    public function passwordFormVencidaAction()
    {
        return $this->render('Nomencladores/GestionUsuario/cambiarPasswordVencida.html.twig');
    }

    /**
     * @Route("/changePassword", name="changePassword")
     */
    public function changePasswordAction()
    {
        $peticion = Request::createFromGlobals();
        $idUsuario = $peticion->request->get('idUsuario');
        $username = $peticion->request->get('username');
        $passAnt = $peticion->request->get('passAnt');
        $passNew = $peticion->request->get('passNew');
        $user = $this->getUser();

        $encoder = $this->container->get('security.password_encoder');

        $em = $this->getDoctrine()->getManager();
        $repository = $em->getRepository('AppBundle:Usuario');
        $usuario = $repository->findOneBy(array('username' => $username));
        $valid = $encoder->isPasswordValid($usuario, $passAnt);

        if (!$valid) {
            return new Response('Error: Contraseña actual errónea');
        }

        $resp = $em->getRepository('AppBundle:Usuario')->verificarPassword($passNew);
        if ($resp !== 'ok') {
            return new Response($resp);
        }

        $resp = $em->getRepository('AppBundle:Usuario')->verificarPasswordAnterior($idUsuario, $passNew);
        if ($resp) {
            return new Response('Error: No se puede utilizar la contraseña anterior');
        }

        $resp = $em->getRepository('AppBundle:Usuario')->cambiarPassword($idUsuario, $passNew);
        if (is_string($resp)) return new Response($resp);
        else {
            $dataTraza = array(
                'username' => $user->getUsername(),
                'nombre' => $user->getNombre(),
                'operacion' => 'Cambio de contraseña de Usuario',
                'descripcion' => 'Se cambió la contraseña del usuario: ' . $user->getNombre() . ' ' . $user->getPrimerApellido() . ' ' . $user->getSegundoApellido()
            );
            $traza = $em->getRepository('AppBundle:Traza')->guardarTraza($dataTraza);
            if ($traza !== 'ok') return new Response($traza);
            return new Response('ok');
        }
    }

    //metodo para mostrar pantalla de bloqueo

    /**
     * @Route("/lock", name="lock")
     */
    public function lockAction()
    {
        return $this->render('Inicio/lock.html.twig');
    }

    //metodo para desbloquear el sistema

    /**
     * @Route("/confirmPassword", name="confirmPassword")
     */
    public function confirmPasswordAction()
    {
        $peticion = Request::createFromGlobals();
        $password = $peticion->request->get('password');
        $user = $this->getUser();

        $encoder = $this->container->get('security.password_encoder');

        /*$em = $this->getDoctrine()->getManager();
        $repository = $em->getRepository('AppBundle:Usuario');
        $user = $repository->findOneBy(array('username' => $username));*/
        $valid = $encoder->isPasswordValid($user, $password);

        if ($valid === 1) {
            return new Response('ok');
        } else {
            return new Response('Error: Contraseña  errónea');
        }
    }
}
