<?php

namespace AppBundle\Controller;

use Symfony\Bundle\FrameworkBundle\Controller\Controller;
use Sensio\Bundle\FrameworkExtraBundle\Configuration\Route;
use Symfony\Component\HttpFoundation\Request;
use Symfony\Component\HttpFoundation\Response;

class TipoContratoController extends Controller
{
    /**
     * @Route("/gestionarTiposContratos", name="gestionarTiposContratos")
     */
    public function gestionarTiposContratosAction()
    {
        $em = $this->getDoctrine()->getManager();
        $tiposContratos  = $em->getRepository('AppBundle:TipoContrato')->findAll();

        return $this->render('Nomencladores/GestionarTiposContratos/tiposContratos.html.twig', array(
            'tiposContratos' => $tiposContratos
        ));
    }

    /**
     * @Route("/insertTipoContrato", name="insertTipoContrato")
     */
    public function insertTipoContratoAction()
    {
        $peticion = Request::createFromGlobals();
        $em = $this->getDoctrine()->getManager();
        $user = $this->getUser();

        $data = array(
            'nombre' => $peticion->request->get('nombre')
        );

        $resp = $em->getRepository('AppBundle:TipoContrato')->agregarTipoContrato($data);

        if(is_string($resp)) {
            return new Response($resp);
        }

        $this->forward('AppBundle:Traza:insertTraza' , array(
            'username' => $user->getUsername(),
            'nombre' => $user->getNombre(),
            'operacion' => 'Insertar Tipo de Contrato',
            'descripcion' => 'Se insertó una nuevo tipo de contrato con el nombre: '.$data['nombre']
        ));
        return new Response('ok');
    }

    /**
     * @Route("/updateTipoContrato", name="updateTipoContrato")
     */
    public function updateTipoContratoAction()
    {
        $peticion = Request::createFromGlobals();
        $em = $this->getDoctrine()->getManager();
        $user = $this->getUser();

        $data = array(
            'idTipoContrato' => $peticion->request->get('idTipoContrato'),
            'nombre' => $peticion->request->get('nombre')
        );

        $resp = $em->getRepository('AppBundle:TipoContrato')->modificarTipoContrato($data);

        if(is_string($resp)) {
            return new Response($resp);
        }

        $this->forward('AppBundle:Traza:insertTraza' , array(
            'username' => $user->getUsername(),
            'nombre' => $user->getNombre(),
            'operacion' => 'Modificar el Tipo de Contrato',
            'descripcion' => 'Se modificó el tipo de contrato con el nombre:  '.$data['nombre']
        ));
        return new Response('ok');
    }

    /**
     * @Route("/deleteTipoContrato", name="deleteTipoContrato")
     */
    public function deleteTipoContratoAction()
    {
        $peticion = Request::createFromGlobals();
        $idTipoContrato = $peticion->request->get('idTipoContrato');
        $em = $this->getDoctrine()->getManager();
        $user = $this->getUser();

        $resp  = $em->getRepository('AppBundle:TipoContrato')->eliminarTipoContrato($idTipoContrato);

        if(is_string($resp)) {
            return new Response($resp);
        }

        $this->forward('AppBundle:Traza:insertTraza' , array(
            'username' => $user->getUsername(),
            'nombre' => $user->getNombre(),
            'operacion' => 'Eliminar el tipo de contrato',
            'descripcion' => 'Se eliminó el tipo de contrato con el nombre: '.$resp->getNombre()
        ));
        return new Response('ok');
    }
}
