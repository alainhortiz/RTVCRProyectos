<?php

namespace AppBundle\Controller;

use Symfony\Bundle\FrameworkBundle\Controller\Controller;
use Sensio\Bundle\FrameworkExtraBundle\Configuration\Route;
use Symfony\Component\HttpFoundation\Request;
use Symfony\Component\HttpFoundation\Response;

class CargoController extends Controller
{
    /**
     * @Route("/gestionarCargos", name="gestionarCargos")
     */
    public function gestionarCargosAction()
    {
        $em = $this->getDoctrine()->getManager();
        $cargos  = $em->getRepository('AppBundle:Cargo')->findAll();
        $tiposContratos  = $em->getRepository('AppBundle:TipoContrato')->findAll();

        return $this->render('Nomencladores/GestionarCargos/cargos.html.twig', array(
            'cargos' => $cargos,
            'tiposContratos' => $tiposContratos

        ));
    }

    /**
     * @Route("/insertCargo", name="insertCargo")
     */
    public function insertCargoAction()
    {
        $peticion = Request::createFromGlobals();
        $em = $this->getDoctrine()->getManager();
        $user = $this->getUser();

        $data = array(
            'nombre' => $peticion->request->get('nombre'),
            'funcion' => $peticion->request->get('funcion'),
            'servicio' => $peticion->request->get('servicio'),
            'tipoContrato' => $peticion->request->get('tipoContrato')
        );


        $resp = $em->getRepository('AppBundle:Cargo')->agregarCargo($data);

        if(is_string($resp)) {
            return new Response($resp);
        }

        $this->forward('AppBundle:Traza:insertTraza' , array(
            'username' => $user->getUsername(),
            'nombre' => $user->getNombre(),
            'operacion' => 'Insertar concepto',
            'descripcion' => 'Se insertó una nuevo concepto con el nombre: '.$data['nombre']
        ));
        return new Response('ok');
    }

    /**
     * @Route("/updateCargo", name="updateCargo")
     */
    public function updateCargoAction()
    {
        $peticion = Request::createFromGlobals();
        $em = $this->getDoctrine()->getManager();
        $user = $this->getUser();

        $data = array(
            'idCargo' => $peticion->request->get('idCargo'),
            'nombre' => $peticion->request->get('nombre'),
            'funcion' => $peticion->request->get('funcion'),
            'servicio' => $peticion->request->get('servicio'),
            'tipoContrato' => $peticion->request->get('tipoContrato')
        );

        $resp = $em->getRepository('AppBundle:Cargo')->modificarCargo($data);

        if(is_string($resp)) return new Response($resp);
        else{
            $this->forward('AppBundle:Traza:insertTraza' , array(
                'username' => $user->getUsername(),
                'nombre' => $user->getNombre(),
                'operacion' => 'Modificar el concepto',
                'descripcion' => 'Se modificó el concepto con el nombre:  '.$data['nombre']
            ));
            return new Response('ok');
        }
    }

    /**
     * @Route("/deleteCargo", name="deleteCargo")
     */
    public function deleteCargoAction()
    {
        $peticion = Request::createFromGlobals();
        $idCargo = $peticion->request->get('idCargo');
        $em = $this->getDoctrine()->getManager();
        $user = $this->getUser();

        $resp  = $em->getRepository('AppBundle:Cargo')->eliminarCargo($idCargo);

        if(is_string($resp)) return new Response($resp);
        else{
            $this->forward('AppBundle:Traza:insertTraza' , array(
                'username' => $user->getUsername(),
                'nombre' => $user->getNombre(),
                'operacion' => 'Eliminar el concepto',
                'descripcion' => 'Se eliminó el concepto con el nombre: '.$resp->getNombre()
            ));
            return new Response('ok');
        }
    }
}
