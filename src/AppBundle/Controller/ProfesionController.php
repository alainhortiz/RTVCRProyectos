<?php

namespace AppBundle\Controller;

use Symfony\Bundle\FrameworkBundle\Controller\Controller;
use Sensio\Bundle\FrameworkExtraBundle\Configuration\Route;
use Symfony\Component\HttpFoundation\Request;
use Symfony\Component\HttpFoundation\Response;

class ProfesionController extends Controller
{
    /**
     * @Route("/gestionarProfesiones", name="gestionarProfesiones")
     */
    public function gestionarProfesionesAction()
    {
        $em = $this->getDoctrine()->getManager();
        $profesiones  = $em->getRepository('AppBundle:Profesion')->findAll();

        return $this->render('Nomencladores/GestionarProfesiones/profesiones.html.twig', array(
            'profesiones' => $profesiones
        ));
    }

    /**
     * @Route("/insertProfesion", name="insertProfesion")
     */
    public function insertProfesionAction()
    {
        $peticion = Request::createFromGlobals();
        $em = $this->getDoctrine()->getManager();
        $user = $this->getUser();

        $data = array(
            'nombre' => $peticion->request->get('nombre')
        );


        $resp = $em->getRepository('AppBundle:Profesion')->agregarProfesion($data);

        if(is_string($resp)) {
            return new Response($resp);
        }

        $this->forward('AppBundle:Traza:insertTraza' , array(
            'username' => $user->getUsername(),
            'nombre' => $user->getNombre(),
            'operacion' => 'Insertar Profesión',
            'descripcion' => 'Se insertó una nueva profesión con el nombre: '.$data['nombre']
        ));
        return new Response('ok');
    }

    /**
     * @Route("/updateProfesion", name="updateProfesion")
     */
    public function updateProfesionAction()
    {
        $peticion = Request::createFromGlobals();
        $em = $this->getDoctrine()->getManager();
        $user = $this->getUser();

        $data = array(
            'idProfesion' => $peticion->request->get('idProfesion'),
            'nombre' => $peticion->request->get('nombre')
        );

        $resp = $em->getRepository('AppBundle:Profesion')->modificarProfesion($data);

        if(is_string($resp)) return new Response($resp);
        else{
            $this->forward('AppBundle:Traza:insertTraza' , array(
                'username' => $user->getUsername(),
                'nombre' => $user->getNombre(),
                'operacion' => 'Modificar profesión',
                'descripcion' => 'Se modificó la profesión con el nombre:  '.$data['nombre']
            ));
            return new Response('ok');
        }
    }

    /**
     * @Route("/deleteProfesion", name="deleteProfesion")
     */
    public function deleteProfesionAction()
    {
        $peticion = Request::createFromGlobals();
        $idCargo = $peticion->request->get('idProfesion');
        $em = $this->getDoctrine()->getManager();
        $user = $this->getUser();

        $resp  = $em->getRepository('AppBundle:Profesion')->eliminarProfesion($idCargo);

        if(is_string($resp)) return new Response($resp);
        else{
            $this->forward('AppBundle:Traza:insertTraza' , array(
                'username' => $user->getUsername(),
                'nombre' => $user->getNombre(),
                'operacion' => 'Eliminar profesión',
                'descripcion' => 'Se eliminó la profesión con el nombre: '.$resp->getNombre()
            ));
            return new Response('ok');
        }
    }
}
