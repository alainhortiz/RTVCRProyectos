<?php

namespace AppBundle\Controller;

use Symfony\Bundle\FrameworkBundle\Controller\Controller;
use Sensio\Bundle\FrameworkExtraBundle\Configuration\Route;
use Symfony\Component\HttpFoundation\Request;
use Symfony\Component\HttpFoundation\Response;

class BancoController extends Controller
{
    /**
     * @Route("/gestionarBancos", name="gestionarBancos")
     */
    public function gestionarBancosAction()
    {
        $em = $this->getDoctrine()->getManager();
        $bancos  = $em->getRepository('AppBundle:Banco')->findAll();

        return $this->render('Nomencladores/GestionarBancos/bancos.html.twig', array(
            'bancos' => $bancos
        ));
    }

    /**
     * @Route("/insertBanco", name="insertBanco")
     */
    public function insertBancoAction()
    {
        $peticion = Request::createFromGlobals();
        $em = $this->getDoctrine()->getManager();
        $user = $this->getUser();

        $data = array(
            'nombre' => $peticion->request->get('nombre')
        );


        $resp = $em->getRepository('AppBundle:Banco')->agregarBanco($data);

        if(is_string($resp)) {
            return new Response($resp);
        }

        $this->forward('AppBundle:Traza:insertTraza' , array(
            'username' => $user->getUsername(),
            'nombre' => $user->getNombre(),
            'operacion' => 'Insertar Banco',
            'descripcion' => 'Se insertó una nuevo banco con el nombre: '.$data['nombre']
        ));
        return new Response('ok');
    }

    /**
     * @Route("/updateBanco", name="updateBanco")
     */
    public function updateBancoAction()
    {
        $peticion = Request::createFromGlobals();
        $em = $this->getDoctrine()->getManager();
        $user = $this->getUser();

        $data = array(
            'idBanco' => $peticion->request->get('idBanco'),
            'nombre' => $peticion->request->get('nombre')
        );

        $resp = $em->getRepository('AppBundle:Banco')->modificarBanco($data);

        if(is_string($resp)) return new Response($resp);
        else{
            $this->forward('AppBundle:Traza:insertTraza' , array(
                'username' => $user->getUsername(),
                'nombre' => $user->getNombre(),
                'operacion' => 'Modificar banco',
                'descripcion' => 'Se modificó el banco con el nombre:  '.$data['nombre']
            ));
            return new Response('ok');
        }
    }

    /**
     * @Route("/deleteBanco", name="deleteBanco")
     */
    public function deleteBancoAction()
    {
        $peticion = Request::createFromGlobals();
        $idBanco = $peticion->request->get('idBanco');
        $em = $this->getDoctrine()->getManager();
        $user = $this->getUser();

        $resp  = $em->getRepository('AppBundle:Banco')->eliminarBanco($idBanco);

        if(is_string($resp)) return new Response($resp);
        else{
            $this->forward('AppBundle:Traza:insertTraza' , array(
                'username' => $user->getUsername(),
                'nombre' => $user->getNombre(),
                'operacion' => 'Eliminar banco',
                'descripcion' => 'Se eliminó el banco con el nombre: '.$resp->getNombre()
            ));
            return new Response('ok');
        }
    }

}
