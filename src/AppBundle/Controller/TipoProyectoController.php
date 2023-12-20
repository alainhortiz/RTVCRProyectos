<?php

namespace AppBundle\Controller;

use Symfony\Bundle\FrameworkBundle\Controller\Controller;
use Sensio\Bundle\FrameworkExtraBundle\Configuration\Route;
use Symfony\Component\HttpFoundation\Request;
use Symfony\Component\HttpFoundation\Response;

class TipoProyectoController extends Controller
{
    /**
     * @Route("/gestionarTipos", name="gestionarTipos")
     */
    public function gestionarTiposAction()
    {
        $em = $this->getDoctrine()->getManager();
        $tipos  = $em->getRepository('AppBundle:TipoProyecto')->findAll();

        return $this->render('Nomencladores/GestionarTipos/tipos.html.twig', array(
            'tipos' => $tipos
        ));
    }

    /**
     * @Route("/insertTipo", name="insertTipo")
     */
    public function insertTipoAction()
    {
        $peticion = Request::createFromGlobals();
        $em = $this->getDoctrine()->getManager();
        $user = $this->getUser();

        $data = array(
            'nombre' => $peticion->request->get('nombre')
        );


        $resp = $em->getRepository('AppBundle:TipoProyecto')->agregarTipo($data);

        if(is_string($resp)) {
            return new Response($resp);
        }

        $this->forward('AppBundle:Traza:insertTraza' , array(
            'username' => $user->getUsername(),
            'nombre' => $user->getNombre(),
            'operacion' => 'Insertar Tipo de Proyecto',
            'descripcion' => 'Se insertó una nuevo tipo de proyecto con el nombre: '.$data['nombre']
        ));
        return new Response('ok');
    }

    /**
     * @Route("/updateTipo", name="updateTipo")
     */
    public function updateTipoAction()
    {
        $peticion = Request::createFromGlobals();
        $em = $this->getDoctrine()->getManager();
        $user = $this->getUser();

        $data = array(
            'idTipo' => $peticion->request->get('idTipo'),
            'nombre' => $peticion->request->get('nombre')
        );

        $resp = $em->getRepository('AppBundle:TipoProyecto')->modificarTipo($data);

        if(is_string($resp)) return new Response($resp);
        else{
            $this->forward('AppBundle:Traza:insertTraza' , array(
                'username' => $user->getUsername(),
                'nombre' => $user->getNombre(),
                'operacion' => 'Modificar tipo de proyecto',
                'descripcion' => 'Se modificó el tipo de proyecto con el nombre:  '.$data['nombre']
            ));
            return new Response('ok');
        }
    }

    /**
     * @Route("/deleteTipo", name="deleteTipo")
     */
    public function deleteTipoAction()
    {
        $peticion = Request::createFromGlobals();
        $idTipo = $peticion->request->get('idTipo');
        $em = $this->getDoctrine()->getManager();
        $user = $this->getUser();

        $resp  = $em->getRepository('AppBundle:TipoProyecto')->eliminarTipo($idTipo);

        if(is_string($resp)) return new Response($resp);
        else{
            $this->forward('AppBundle:Traza:insertTraza' , array(
                'username' => $user->getUsername(),
                'nombre' => $user->getNombre(),
                'operacion' => 'Eliminar tipo de proyecto',
                'descripcion' => 'Se eliminó el tipo de proyecto con el nombre: '.$resp->getNombre()
            ));
            return new Response('ok');
        }
    }

}
