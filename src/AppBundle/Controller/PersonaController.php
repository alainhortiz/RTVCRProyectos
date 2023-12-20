<?php

namespace AppBundle\Controller;

use Symfony\Bundle\FrameworkBundle\Controller\Controller;
use Sensio\Bundle\FrameworkExtraBundle\Configuration\Route;
use Symfony\Component\HttpFoundation\Request;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\HttpFoundation\Session\Session;

class PersonaController extends Controller
{
    /**
     * @Route("/gestionarPersonas", name="gestionarPersonas")
     */
    public function gestionarPersonasAction()
    {
        $em = $this->getDoctrine()->getManager();

        $session = new Session();
        $session->set('noCarnet', '');
        $sexos  = $em->getRepository('AppBundle:Sexo')->findAll();
        $categorias  = $em->getRepository('AppBundle:CategoriaPersona')->findAll();
        $profesiones  = $em->getRepository('AppBundle:Profesion')->findAll();
        $bancos  = $em->getRepository('AppBundle:Banco')->findAll();
        $ciudadanias  = $em->getRepository('AppBundle:Ciudadania')->findAll();
        $cargos  = $em->getRepository('AppBundle:Cargo')->findAll();

        return $this->render('Personas/personas.html.twig', array(
                'sexos' => $sexos,
                'categorias' => $categorias,
                'profesiones' => $profesiones,
                'ciudadanias' => $ciudadanias,
                'bancos' => $bancos,
                'cargos' => $cargos)
        );
    }

    /**
     * @Route("/localizarPersona", name="localizarPersona")
     */
    public function localizarPersonaAction()
    {
        $peticion = Request::createFromGlobals();
        $em = $this->getDoctrine()->getManager();

        $session = new Session();
        $session->set('noCarnet', '');

        $data = array(
            'carnetIdentidad' => $peticion->request->get('carnetIdentidad')
        );

        $personas = $em->getRepository('AppBundle:Persona')->localizarPersona($data);

        if(is_string($personas)) {
            return new Response($personas);
        }

        return new Response($this->renderView('Personas/tablaPersonasEncontradas.html.twig', array(
            'personas' => $personas
        )));
    }

    /**
     * @Route("/cancelarEditPersona/{noCarnetIdentidad}", name="cancelarEditPersona")
     */
    public function cancelarEditPersonaAction($noCarnetIdentidad)
    {
        $em = $this->getDoctrine()->getManager();

        $sexos  = $em->getRepository('AppBundle:Sexo')->findAll();
        $categorias  = $em->getRepository('AppBundle:CategoriaPersona')->findAll();
        $profesiones  = $em->getRepository('AppBundle:Profesion')->findAll();
        $ciudadanias  = $em->getRepository('AppBundle:Ciudadania')->findAll();
        $cargos  = $em->getRepository('AppBundle:Cargo')->findAll();
        $bancos  = $em->getRepository('AppBundle:Banco')->findAll();

        $session = new Session();
        $session->set('noCarnet', $noCarnetIdentidad);

        return $this->render('Personas/personas.html.twig', array(
                'sexos' => $sexos,
                'categorias' => $categorias,
                'profesiones' => $profesiones,
                'ciudadanias' => $ciudadanias,
                'bancos' => $bancos,
                'cargos' => $cargos)
        );
    }

    /**
     * @Route("/insertPersona", name="insertPersona")
     */
    public function insertPersonaAction()
    {
        $peticion = Request::createFromGlobals();
        $em = $this->getDoctrine()->getManager();
        $user = $this->getUser();

        $session = new Session();
        $session->set('noCarnet', '');

        $data = array(
            'cI' => $peticion->request->get('cI'),
            'nombre' => $peticion->request->get('nombre'),
            'primerApellido' => $peticion->request->get('primerApellido'),
            'segundoApellido' => $peticion->request->get('segundoApellido'),
            'profesion' => $peticion->request->get('profesion'),
            'ciudadania' => $peticion->request->get('ciudadania'),
            'direccion' => $peticion->request->get('direccion'),
            'alias' => $peticion->request->get('alias'),
            'sexo' => $peticion->request->get('sexo'),
            'telefono' => $peticion->request->get('telefono'),
            'cargos' => $peticion->request->get('cargos'),
            'servicios' => $peticion->request->get('servicios'),
            'nit' => $peticion->request->get('nit'),
            'noRegistro' => $peticion->request->get('noRegistro'),
            'noLicencia' => $peticion->request->get('noLicencia'),
            'tituloLicencia' => $peticion->request->get('tituloLicencia'),
            'noCuentaCUP' => $peticion->request->get('noCuentaCUP'),
            'noCuentaCUC' => $peticion->request->get('noCuentaCUC'),
            'banco' => $peticion->request->get('banco'),
            'noSucursal' => $peticion->request->get('noSucursal'),
            'noLicenciaSanitaria' => $peticion->request->get('noLicenciaSanitaria'),
            'isPA' => $peticion->request->get('isPA'),
            'isTCP' => $peticion->request->get('isTCP')
        );

        $personas = $em->getRepository('AppBundle:Persona')->agregarPersona($data);

        if (is_string($personas)) {
            return new Response($personas);
        }

        $dataTraza = array(
            'username' => $user->getUsername(),
            'nombre' => $user->getNombre(),
            'operacion' => 'Insertar Persona',
            'descripcion' => 'Se insertó la persona: ' . $data['nombre'] . ' ' . $data['primerApellido'] . ' ' . $data['segundoApellido']
        );

        $traza = $em->getRepository('AppBundle:Traza')->guardarTraza($dataTraza);

        if ($traza !== 'ok') {
            return new Response($traza);
        }

        return new Response($this->renderView('Personas/tablaPersonasEncontradas.html.twig', array('personas' => array($personas))));
    }

    /**
     * @Route("/editPersona/{noCarnetIdentidad}", name="editPersona")
     */
    public function editPersonaAction($noCarnetIdentidad)
    {
        $em = $this->getDoctrine()->getManager();

        $session = new Session();
        $session->set('noCarnet', '');

        $persona = $em->getRepository('AppBundle:Persona')->findOneBy(array('carnetIdentidad' => $noCarnetIdentidad));
        $sexos  = $em->getRepository('AppBundle:Sexo')->findAll();
        $categorias  = $em->getRepository('AppBundle:CategoriaPersona')->findAll();
        $profesiones  = $em->getRepository('AppBundle:Profesion')->findAll();
        $ciudadanias  = $em->getRepository('AppBundle:Ciudadania')->findAll();
        $cargos  = $em->getRepository('AppBundle:Cargo')->findAll();
        $bancos  = $em->getRepository('AppBundle:Banco')->findAll();


        return $this->render('Personas/editPersona.html.twig', array(
                'persona' => $persona,
                'sexos' => $sexos,
                'categorias' => $categorias,
                'profesiones' => $profesiones,
                'ciudadanias' => $ciudadanias,
                'bancos' => $bancos,
                'cargos' => $cargos)
        );
    }

    /**
     * @Route("/updatePersona", name="updatePersona")
     */
    public function updatePersonaAction()
    {
        $peticion = Request::createFromGlobals();
        $em = $this->getDoctrine()->getManager();
        $user = $this->getUser();

        $data = array(
            'cI' => $peticion->request->get('cI'),
            'nombre' => $peticion->request->get('nombre'),
            'primerApellido' => $peticion->request->get('primerApellido'),
            'segundoApellido' => $peticion->request->get('segundoApellido'),
            'profesion' => $peticion->request->get('profesion'),
            'ciudadania' => $peticion->request->get('ciudadania'),
            'direccion' => $peticion->request->get('direccion'),
            'alias' => $peticion->request->get('alias'),
            'sexo' => $peticion->request->get('sexo'),
            'telefono' => $peticion->request->get('telefono'),
            'cargos' => $peticion->request->get('cargos'),
            'servicios' => $peticion->request->get('servicios'),
            'nit' => $peticion->request->get('nit'),
            'noRegistro' => $peticion->request->get('noRegistro'),
            'noLicencia' => $peticion->request->get('noLicencia'),
            'tituloLicencia' => $peticion->request->get('tituloLicencia'),
            'noCuentaCUP' => $peticion->request->get('noCuentaCUP'),
            'noCuentaCUC' => $peticion->request->get('noCuentaCUC'),
            'banco' => $peticion->request->get('banco'),
            'noSucursal' => $peticion->request->get('noSucursal'),
            'noLicenciaSanitaria' => $peticion->request->get('noLicenciaSanitaria'),
            'isPA' => $peticion->request->get('isPA'),
            'isTCP' => $peticion->request->get('isTCP')
        );

        $resp = $em->getRepository('AppBundle:Persona')->modificarPersona($data);

        if (is_string($resp)) {
            return new Response($resp);
        }

        $dataTraza = array(
            'username' => $user->getUsername(),
            'nombre' => $user->getNombre(),
            'operacion' => 'Modificar Persona',
            'descripcion' => 'Se modificó la persona: ' . $data['nombre'] . ' ' . $data['primerApellido'] . ' ' . $data['segundoApellido']
        );
        $traza = $em->getRepository('AppBundle:Traza')->guardarTraza($dataTraza);
        if ($traza !== 'ok') {
            return new Response($traza);
        }
        return new Response('ok');
    }

    /**
     * @Route("/verPersona/{noCarnetIdentidad}", name="verPersona")
     */
    public function verPersonaAction($noCarnetIdentidad)
    {
        $em = $this->getDoctrine()->getManager();

        $session = new Session();
        $session->set('noCarnet', '');

        $persona = $em->getRepository('AppBundle:Persona')->findOneBy(array('carnetIdentidad' => $noCarnetIdentidad));
        $sexos  = $em->getRepository('AppBundle:Sexo')->findAll();
        $categorias  = $em->getRepository('AppBundle:CategoriaPersona')->findAll();
        $profesiones  = $em->getRepository('AppBundle:Profesion')->findAll();
        $ciudadanias  = $em->getRepository('AppBundle:Ciudadania')->findAll();
        $cargos  = $em->getRepository('AppBundle:Cargo')->findAll();


        return $this->render('Personas/verPersona.html.twig', array(
                'persona' => $persona,
                'sexos' => $sexos,
                'categorias' => $categorias,
                'profesiones' => $profesiones,
                'ciudadanias' => $ciudadanias,
                'cargos' => $cargos)
        );
    }

    /**
     * @Route("/deletePersona", name="deletePersona")
     */
    public function deletePersonaAction()
    {
        $peticion = Request::createFromGlobals();
        $idPersona = $peticion->request->get('idPersona');
        $em = $this->getDoctrine()->getManager();
        $user = $this->getUser();

        $resp  = $em->getRepository('AppBundle:Persona')->masterDeletePersona($user,$idPersona);

        return new Response($resp);
    }

}
