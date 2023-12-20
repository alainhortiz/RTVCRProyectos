<?php

namespace AppBundle\Controller;

use Symfony\Bundle\FrameworkBundle\Controller\Controller;
use Sensio\Bundle\FrameworkExtraBundle\Configuration\Route;
use Symfony\Component\HttpFoundation\JsonResponse;
use Symfony\Component\HttpFoundation\Request;
use Symfony\Component\HttpFoundation\Response;

class ProyectoController extends Controller
{
    /**
     * @Route("/gestionarProyectos", name="gestionarProyectos")
     */
    public function gestionarProyectosAction()
    {
        $em = $this->getDoctrine()->getManager();
        $proyectos  = $em->getRepository('AppBundle:Proyecto')->findAll();
        $presupuestoPagado = $em->getRepository('AppBundle:ProyectoPersonaCargo')->totalPresupuestoPagado();
        $presupuestoPorPagar = $em->getRepository('AppBundle:ProyectoPersonaCargo')->totalPresupuestoPorPagar();

        return $this->render('Proyectos/proyectos.html.twig', array(
            'proyectos' => $proyectos,
            'presupuestoPagado' => $presupuestoPagado,
            'presupuestoPorPagar' => $presupuestoPorPagar
        ));
    }

    /**
     * @Route("/localizarDirector", name="localizarDirector")
     */
    public function localizarDirectorAction()
    {
        $peticion = Request::createFromGlobals();
        $em = $this->getDoctrine()->getManager();

        $carnetIdentidad = $peticion->request->get('carnetIdentidad');


        $director = $em->getRepository('AppBundle:Persona')->localizarDirector($carnetIdentidad);

        return new Response($director);

    }

    /**
     * @Route("/localizarPersonaConceptos", name="localizarPersonaConceptos")
     */
    public function localizarPersonaConceptosAction()
    {
        $peticion = Request::createFromGlobals();
        $em = $this->getDoctrine()->getManager();

        $carnetIdentidad = $peticion->request->get('carnetIdentidad');

        $nombrePersona = $em->getRepository('AppBundle:Persona')->localizarPersonaSelect($carnetIdentidad);
        $cargos = $em->getRepository('AppBundle:Persona')->personaConceptos($carnetIdentidad);

        $resp = array(
            'nombre' => $nombrePersona,
            'cargo' => $cargos
        );


        if (is_string($nombrePersona)) {
            return new Response($nombrePersona);
        }

        $result = json_encode($resp);
        return new JsonResponse($result);

    }

    /**
     * @Route("/localizarPersonaServicios", name="localizarPersonaServicios")
     */
    public function localizarPersonaServiciosAction()
    {
        $peticion = Request::createFromGlobals();
        $em = $this->getDoctrine()->getManager();

        $carnetIdentidad = $peticion->request->get('carnetIdentidad');

        $nombrePersona = $em->getRepository('AppBundle:Persona')->localizarPersonaSelect($carnetIdentidad);
        $cargos = $em->getRepository('AppBundle:Persona')->personaServicios($carnetIdentidad);

        $resp = array(
            'nombre' => $nombrePersona,
            'cargo' => $cargos
        );


        if (is_string($nombrePersona)) {
            return new Response($nombrePersona);
        }

        $result = json_encode($resp);
        return new JsonResponse($result);

    }

    /**
     * @Route("/addProyecto", name="addProyecto")
     */
    public function addProyectoAction()
    {
        $em = $this->getDoctrine()->getManager();
        $formatosProyectos  = $em->getRepository('AppBundle:FormatoProyecto')->findAll();
        $tiposProyectos  = $em->getRepository('AppBundle:TipoProyecto')->findAll();
        $cargos  = $em->getRepository('AppBundle:Cargo')->findAll();

        return $this->render('Proyectos/addProyecto.html.twig' , array(
            'tiposProyectos' => $tiposProyectos,
            'formatosProyectos' => $formatosProyectos,
            'cargos' => $cargos
        ));
    }

    /**
     * @Route("/editProyecto/{idProyecto}", name="editProyecto")
     */
    public function editProyectoAction($idProyecto)
    {
        $em = $this->getDoctrine()->getManager();
        $proyecto = $em->getRepository('AppBundle:Proyecto')->find($idProyecto);
        $formatosProyectos  = $em->getRepository('AppBundle:FormatoProyecto')->findAll();
        $tiposProyectos  = $em->getRepository('AppBundle:TipoProyecto')->findAll();
        $cargos  = $em->getRepository('AppBundle:Cargo')->findAll();

        return $this->render('Proyectos/editProyecto.html.twig' , array(
            'proyecto' => $proyecto,
            'tiposProyectos' => $tiposProyectos,
            'formatosProyectos' => $formatosProyectos,
            'cargos' => $cargos
        ));
    }

    /**
     * @Route("/insertProyecto", name="insertProyecto")
     */
    public function insertProyectoAction()
    {
        $peticion = Request::createFromGlobals();
        $em = $this->getDoctrine()->getManager();
        $user = $this->getUser();

        $data = array(
            'noContratoCanal' => $peticion->request->get('noContratoCanal'),
            'nombreDirector' => $peticion->request->get('nombreDirector'),
            'nombreProductor' => $peticion->request->get('nombreProductor'),
            'titulo' => $peticion->request->get('titulo'),
            'formato' => $peticion->request->get('formato'),
            'cantEmisiones' => $peticion->request->get('cantEmisiones'),
            'tiempoPantalla' => $peticion->request->get('tiempoPantalla'),
            'categoria' => $peticion->request->get('categoria'),
            'fechaInicio' => $peticion->request->get('fechaInicio'),
            'fechaFinal' => $peticion->request->get('fechaFinal'),
            'preFilmacion' => $peticion->request->get('preFilmacion'),
            'filmacion' => $peticion->request->get('filmacion'),
            'postFilmacion' => $peticion->request->get('postFilmacion'),
            'descripcion' => $peticion->request->get('descripcion')
        );

        $contratosPA  = $peticion->request->get('contratados');
        $contratosTCP  = $peticion->request->get('contratadosTCP');

        $resp = $em->getRepository('AppBundle:Proyecto')->masterAgregarProyecto($data,$user,$contratosPA,$contratosTCP);

        return new Response($resp);
    }

    /**
     * @Route("/updateProyecto", name="updateProyecto")
     */
    public function updateProyectoAction()
    {
        $peticion = Request::createFromGlobals();
        $em = $this->getDoctrine()->getManager();
        $user = $this->getUser();

        $data = array(
            'idProyecto' => $peticion->request->get('idProyecto'),
            'noContratoCanal' => $peticion->request->get('noContratoCanal'),
            'nombreDirector' => $peticion->request->get('nombreDirector'),
            'nombreProductor' => $peticion->request->get('nombreProductor'),
            'titulo' => $peticion->request->get('titulo'),
            'formato' => $peticion->request->get('formato'),
            'cantEmisiones' => $peticion->request->get('cantEmisiones'),
            'tiempoPantalla' => $peticion->request->get('tiempoPantalla'),
            'categoria' => $peticion->request->get('categoria'),
            'fechaInicio' => $peticion->request->get('fechaInicio'),
            'fechaFinal' => $peticion->request->get('fechaFinal'),
            'preFilmacion' => $peticion->request->get('preFilmacion'),
            'filmacion' => $peticion->request->get('filmacion'),
            'postFilmacion' => $peticion->request->get('postFilmacion'),
            'descripcion' => $peticion->request->get('descripcion')
        );

        $contratos = $peticion->request->get('contratados');

        $resp = $em->getRepository('AppBundle:Proyecto')->masterModificarProyecto($data,$user,$contratos);

        return new Response($resp);
    }

    /**
     * @Route("/concluirProyecto", name="concluirProyecto")
     */
    public function concluirProyectoAction()
    {
        $peticion = Request::createFromGlobals();
        $idProyecto = $peticion->request->get('idProyecto');
        $em = $this->getDoctrine()->getManager();
        $user = $this->getUser();

        $resp  = $em->getRepository('AppBundle:Proyecto')->masterConcluirProyecto($user,$idProyecto);

        return new Response($resp);
    }

    /**
     * @Route("/verProyecto/{idProyecto}", name="verProyecto")
     */
    public function verProyectoAction($idProyecto)
    {
        $em = $this->getDoctrine()->getManager();
        $proyecto = $em->getRepository('AppBundle:Proyecto')->find($idProyecto);
        $formatosProyectos  = $em->getRepository('AppBundle:FormatoProyecto')->findAll();
        $tiposProyectos  = $em->getRepository('AppBundle:TipoProyecto')->findAll();
        $cargos  = $em->getRepository('AppBundle:Cargo')->findAll();

        return $this->render('Proyectos/verProyecto.html.twig' , array(
            'proyecto' => $proyecto,
            'tiposProyectos' => $tiposProyectos,
            'formatosProyectos' => $formatosProyectos,
            'cargos' => $cargos
        ));
    }

}
