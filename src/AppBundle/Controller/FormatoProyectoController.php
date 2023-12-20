<?php

namespace AppBundle\Controller;

use Symfony\Bundle\FrameworkBundle\Controller\Controller;
use Sensio\Bundle\FrameworkExtraBundle\Configuration\Route;
use Symfony\Component\HttpFoundation\Request;
use Symfony\Component\HttpFoundation\Response;

class FormatoProyectoController extends Controller
{
    /**
     * @Route("/gestionarFormatos", name="gestionarFormatos")
     */
    public function gestionarFormatosAction()
    {
        $em = $this->getDoctrine()->getManager();
        $formatos  = $em->getRepository('AppBundle:FormatoProyecto')->findAll();

        return $this->render('Nomencladores/GestionarFormatos/formatos.html.twig', array(
            'formatos' => $formatos
        ));
    }

    /**
     * @Route("/insertFormato", name="insertFormato")
     */
    public function insertFormatoAction()
    {
        $peticion = Request::createFromGlobals();
        $em = $this->getDoctrine()->getManager();
        $user = $this->getUser();

        $data = array(
            'nombre' => $peticion->request->get('nombre')
        );

        $resp = $em->getRepository('AppBundle:FormatoProyecto')->agregarFormato($data);

        if(is_string($resp)) {
            return new Response($resp);
        }

        $this->forward('AppBundle:Traza:insertTraza' , array(
            'username' => $user->getUsername(),
            'nombre' => $user->getNombre(),
            'operacion' => 'Insertar Formato',
            'descripcion' => 'Se insertó una nuevo formato con el nombre: '.$data['nombre']
        ));
        return new Response('ok');
    }

    /**
     * @Route("/updateFormato", name="updateFormato")
     */
    public function updateFormatoAction()
    {
        $peticion = Request::createFromGlobals();
        $em = $this->getDoctrine()->getManager();
        $user = $this->getUser();

        $data = array(
            'idFormato' => $peticion->request->get('idFormato'),
            'nombre' => $peticion->request->get('nombre')
        );

        $resp = $em->getRepository('AppBundle:FormatoProyecto')->modificarFormato($data);

        if(is_string($resp)) return new Response($resp);
        else{
            $this->forward('AppBundle:Traza:insertTraza' , array(
                'username' => $user->getUsername(),
                'nombre' => $user->getNombre(),
                'operacion' => 'Modificar el formato',
                'descripcion' => 'Se modificó el formato con el nombre:  '.$data['nombre']
            ));
            return new Response('ok');
        }
    }

    /**
     * @Route("/deleteFormato", name="deleteFormato")
     */
    public function deleteFormatoAction()
    {
        $peticion = Request::createFromGlobals();
        $idFormato = $peticion->request->get('idFormato');
        $em = $this->getDoctrine()->getManager();
        $user = $this->getUser();

        $resp  = $em->getRepository('AppBundle:FormatoProyecto')->eliminarFormato($idFormato);

        if(is_string($resp)) return new Response($resp);
        else{
            $this->forward('AppBundle:Traza:insertTraza' , array(
                'username' => $user->getUsername(),
                'nombre' => $user->getNombre(),
                'operacion' => 'Eliminar el formato',
                'descripcion' => 'Se eliminó el formato con el nombre: '.$resp->getNombre()
            ));
            return new Response('ok');
        }
    }

}
