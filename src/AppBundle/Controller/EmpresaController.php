<?php

namespace AppBundle\Controller;

use Symfony\Bundle\FrameworkBundle\Controller\Controller;
use Sensio\Bundle\FrameworkExtraBundle\Configuration\Route;
use Symfony\Component\HttpFoundation\Request;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\HttpFoundation\Session\Session;

class EmpresaController extends Controller
{
    /**
     * @Route("/gestionarEmpresas", name="gestionarEmpresas")
     */
    public function gestionarEmpresasAction()
    {
        $em = $this->getDoctrine()->getManager();

        $session = new Session();
        $session->set('nombreEmpresa', '');
        $tiposEmpresas  = $em->getRepository('AppBundle:TipoEmpresa')->findAll();
        $bancos  = $em->getRepository('AppBundle:Banco')->findAll();
        $cargos  = $em->getRepository('AppBundle:Cargo')->findBy(array(),array('nombre' => 'ASC'));

        return $this->render('Empresas/empresas.html.twig', array(
                'tiposEmpresas' => $tiposEmpresas,
                'bancos' => $bancos,
                'cargos' => $cargos)
        );
    }

    /**
     * @Route("/localizarEmpresa", name="localizarEmpresa")
     */
    public function localizarEmpresaAction()
    {
        $peticion = Request::createFromGlobals();
        $em = $this->getDoctrine()->getManager();

        $session = new Session();
        $session->set('nombreEmpresa', '');

        $data = array(
            'nombreEmpresa' => $peticion->request->get('nombreEmpresa')
        );

        $empresas = $em->getRepository('AppBundle:Empresa')->localizarEmpresa($data);

        if(is_string($empresas)) {
            return new Response($empresas);
        }

        return new Response($this->renderView('Empresas/tablaEmpresasEncontradas.html.twig', array('empresas' => $empresas)));
    }

    /**
     * @Route("/cancelarEditEmpresa/{id}", name="cancelarEditEmpresa")
     */
    public function cancelarEditEmpresaAction($id)
    {
        $em = $this->getDoctrine()->getManager();

        $tiposEmpresas  = $em->getRepository('AppBundle:TipoEmpresa')->findAll();
        $bancos  = $em->getRepository('AppBundle:Banco')->findAll();
        $cargos  = $em->getRepository('AppBundle:Cargo')->findBy(array(),array('nombre' => 'ASC'));
        $nombreEmpresa  = $em->getRepository('AppBundle:Empresa')->find($id);

        $session = new Session();
        $session->set('nombreEmpresa', $nombreEmpresa->getNombre());

        return $this->render('Empresas/empresas.html.twig', array(
                'tiposEmpresas' => $tiposEmpresas,
                'bancos' => $bancos,
                'cargos' => $cargos)
        );
    }

    /**
     * @Route("/insertEmpresa", name="insertEmpresa")
     */
    public function insertEmpresaAction()
    {
        $peticion = Request::createFromGlobals();
        $em = $this->getDoctrine()->getManager();
        $user = $this->getUser();

        $session = new Session();
        $session->set('nombreEmpresa', '');

        $data = array(
            'nombre' => $peticion->request->get('nombre'),
            'tipoEmpresa' => $peticion->request->get('tipoEmpresa'),
            'nit' => $peticion->request->get('nit'),
            'noAutorizada' => $peticion->request->get('noAutorizada'),
            'fechaAutorizada' => $peticion->request->get('fechaAutorizada'),
            'cargoAutorizada' => $peticion->request->get('cargoAutorizada'),
            'noConstituida' => $peticion->request->get('noConstituida'),
            'fechaConstituida' => $peticion->request->get('fechaConstituida'),
            'cargoConstituida' => $peticion->request->get('cargoConstituida'),
            'noCuentaCUC' => $peticion->request->get('noCuentaCUC'),
            'bancoCUC' => $peticion->request->get('bancoCUC'),
            'noSucursalCUC' => $peticion->request->get('noSucursalCUC'),
            'noCuentaCUP' => $peticion->request->get('noCuentaCUP'),
            'bancoCUP' => $peticion->request->get('bancoCUP'),
            'noSucursalCUP' => $peticion->request->get('noSucursalCUP'),
            'nombreRepresentante' => $peticion->request->get('nombreRepresentante'),
            'cargoRepresentante' => $peticion->request->get('cargoRepresentante'),
            'direccion' => $peticion->request->get('direccion'),
            'cargos' => $peticion->request->get('cargos'),
            'servicios' => $peticion->request->get('servicios'),
            'isConcepto' => $peticion->request->get('isConcepto'),
            'isServicio' => $peticion->request->get('isServicio'),
        );

        $empresas = $em->getRepository('AppBundle:Empresa')->agregarEmpresa($data);

        if (is_string($empresas)) {
            return new Response($empresas);
        }

        $dataTraza = array(
            'username' => $user->getUsername(),
            'nombre' => $user->getNombre(),
            'operacion' => 'Insertar Empresa',
            'descripcion' => 'Se insertó la empresa: ' . $data['nombre']
        );

        $traza = $em->getRepository('AppBundle:Traza')->guardarTraza($dataTraza);

        if ($traza !== 'ok') {
            return new Response($traza);
        }

        return new Response($this->renderView('Empresas/tablaEmpresasEncontradas.html.twig', array('empresas' => array($empresas))));

    }

    /**
     * @Route("/editEmpresa/{id}", name="editEmpresa")
     */
    public function editEmpresaAction($id)
    {
        $em = $this->getDoctrine()->getManager();

        $session = new Session();
        $session->set('nombreEmpresa', '');

        $empresa = $em->getRepository('AppBundle:Empresa')->find($id);
        $tiposEmpresas  = $em->getRepository('AppBundle:TipoEmpresa')->findAll();
        $bancos  = $em->getRepository('AppBundle:Banco')->findAll();
        $cargos  = $em->getRepository('AppBundle:Cargo')->findBy(array(),array('nombre' => 'ASC'));

        return $this->render('Empresas/editEmpresa.html.twig', array(
                'empresa' => $empresa,
                'tiposEmpresas' => $tiposEmpresas,
                'bancos' => $bancos,
                'cargos' => $cargos)
        );
    }

    /**
     * @Route("/updateEmpresa", name="updateEmpresa")
     */
    public function updateEmpresaAction()
    {
        $peticion = Request::createFromGlobals();
        $em = $this->getDoctrine()->getManager();
        $user = $this->getUser();

        $data = array(
            'idEmpresa' => $peticion->request->get('idEmpresa'),
            'nombre' => $peticion->request->get('nombre'),
            'tipoEmpresa' => $peticion->request->get('tipoEmpresa'),
            'nit' => $peticion->request->get('nit'),
            'noAutorizada' => $peticion->request->get('noAutorizada'),
            'fechaAutorizada' => $peticion->request->get('fechaAutorizada'),
            'cargoAutorizada' => $peticion->request->get('cargoAutorizada'),
            'noConstituida' => $peticion->request->get('noConstituida'),
            'fechaConstituida' => $peticion->request->get('fechaConstituida'),
            'cargoConstituida' => $peticion->request->get('cargoConstituida'),
            'noCuentaCUC' => $peticion->request->get('noCuentaCUC'),
            'bancoCUC' => $peticion->request->get('bancoCUC'),
            'noSucursalCUC' => $peticion->request->get('noSucursalCUC'),
            'noCuentaCUP' => $peticion->request->get('noCuentaCUP'),
            'bancoCUP' => $peticion->request->get('bancoCUP'),
            'noSucursalCUP' => $peticion->request->get('noSucursalCUP'),
            'nombreRepresentante' => $peticion->request->get('nombreRepresentante'),
            'cargoRepresentante' => $peticion->request->get('cargoRepresentante'),
            'direccion' => $peticion->request->get('direccion'),
            'cargos' => $peticion->request->get('cargos'),
            'servicios' => $peticion->request->get('servicios'),
            'isConcepto' => $peticion->request->get('isPA'),
            'isServicio' => $peticion->request->get('isTCP')
        );

        $resp = $em->getRepository('AppBundle:Empresa')->modificarEmpresa($data);

        if (is_string($resp)) {
            return new Response($resp);
        }

        $dataTraza = array(
            'username' => $user->getUsername(),
            'nombre' => $user->getNombre(),
            'operacion' => 'Modificar Empresa',
            'descripcion' => 'Se modificó la empresa: ' . $data['nombre']
        );
        $traza = $em->getRepository('AppBundle:Traza')->guardarTraza($dataTraza);
        if ($traza !== 'ok') {
            return new Response($traza);
        }
        return new Response('ok');
    }

    /**
     * @Route("/verEmpresa/{id}", name="verEmpresa")
     */
    public function verEmpresaAction($id)
    {
        $em = $this->getDoctrine()->getManager();

        $session = new Session();
        $session->set('nombreEmpresa', '');

        $empresa = $em->getRepository('AppBundle:Empresa')->find($id);
        $tiposEmpresas  = $em->getRepository('AppBundle:TipoEmpresa')->findAll();
        $bancos  = $em->getRepository('AppBundle:Banco')->findAll();
        $cargos  = $em->getRepository('AppBundle:Cargo')->findBy(array(),array('nombre' => 'ASC'));

        return $this->render('Empresas/verEmpresa.html.twig', array(
                'empresa' => $empresa,
                'tiposEmpresas' => $tiposEmpresas,
                'bancos' => $bancos,
                'cargos' => $cargos)
        );
    }

    /**
     * @Route("/deleteEmpresa", name="deleteEmpresa")
     */
    public function deleteEmpresaAction()
    {
        $peticion = Request::createFromGlobals();
        $idEmpresa = $peticion->request->get('idEmpresa');
        $em = $this->getDoctrine()->getManager();
        $user = $this->getUser();

        $resp  = $em->getRepository('AppBundle:Empresa')->masterDeleteEmpresa($user,$idEmpresa);

        return new Response($resp);
    }

}
