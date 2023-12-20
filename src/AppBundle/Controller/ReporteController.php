<?php

namespace AppBundle\Controller;

use Symfony\Bundle\FrameworkBundle\Controller\Controller;
use Sensio\Bundle\FrameworkExtraBundle\Configuration\Route;
use Symfony\Component\HttpFoundation\Request;
use Symfony\Component\HttpFoundation\Response;

class ReporteController extends Controller
{
    /**
     * @Route("/gestionarReportes/{idProyecto}", name="gestionarReportes")
     */
    public function gestionarReportesAction($idProyecto)
    {
        $em = $this->getDoctrine()->getManager();
        $proyecto = $em->getRepository('AppBundle:Proyecto')->find($idProyecto);
        $reportes = $em->getRepository('AppBundle:Reporte')->findBy(array('proyecto' => $proyecto));

        $presupuestoPagado = $em->getRepository('AppBundle:ProyectoPersonaReporte')->totalPresupuestoPagadoReportado($idProyecto);
        $presupuestoPorPagar = $em->getRepository('AppBundle:ProyectoPersonaReporte')->totalPresupuestoPorPagarReportado($idProyecto);
        $programasReportados = $em->getRepository('AppBundle:Reporte')->programasRestantes($idProyecto);

        $programasRestantes = $proyecto->getEmisiones();

        if (!empty($programasReportados)) {
            $programasRestantes = $proyecto->getEmisiones() - $programasReportados[0]['cantidadProgramas'];
        }

        return $this->render('Reportes/reportes.html.twig' , array(
            'proyecto' => $proyecto,
            'reportes' => $reportes,
            'presupuestoPagado' => $presupuestoPagado,
            'presupuestoPorPagar' => $presupuestoPorPagar,
            'programasRestantes' => $programasRestantes
        ));
    }

    /**
     * @Route("/addReporte/{idProyecto}", name="addReporte")
     */
    public function addReporteAction($idProyecto)
    {
        $em = $this->getDoctrine()->getManager();
        $proyecto = $em->getRepository('AppBundle:Proyecto')->find($idProyecto);
        $proyectoPersonas = $em->getRepository('AppBundle:ProyectoPersonaCargo')->findBy(array('proyecto' => $proyecto));
        $lastNoReporte = $em->getRepository('AppBundle:Reporte')->lastNoReporte($idProyecto);

        $lastDate = '01-01-0001';

        if ($lastNoReporte !== null) {
            $lastDate = $em->getRepository('AppBundle:Reporte')->lastDateReporte($idProyecto,$lastNoReporte);
        }

        $programasReportados = $em->getRepository('AppBundle:Reporte')->programasRestantes($idProyecto);

        $programasRestantes = $proyecto->getEmisiones();

        if (!empty($programasReportados)) {
            $programasRestantes = $proyecto->getEmisiones() - $programasReportados[0]['cantidadProgramas'];
        }

        return $this->render('Reportes/addReporte.html.twig' , array(
            'proyecto' => $proyecto,
            'proyectoPersonas' => $proyectoPersonas,
            'lastDate' => $lastDate,
            'programasRestantes' => $programasRestantes
        ));
    }

    /**
     * @Route("/insertReporte", name="insertReporte")
     */
    public function insertReporteAction()
    {
        $peticion = Request::createFromGlobals();
        $em = $this->getDoctrine()->getManager();
        $user = $this->getUser();

        $data = array(
            'idProyecto' => $peticion->request->get('idProyecto'),
            'fecha' => $peticion->request->get('fecha'),
            'totalProgramas' => $peticion->request->get('totalProgramas')
        );

        $reportados  = $peticion->request->get('reportados');

        $resp = $em->getRepository('AppBundle:Reporte')->masterAgregarReporte($data,$user,$reportados);

        return new Response($resp);
    }

    /**
     * @Route("/editReporte/{idReporte}", name="editReporte")
     */
    public function editReporteAction($idReporte)
    {
        $em = $this->getDoctrine()->getManager();
        $reporte = $em->getRepository('AppBundle:Reporte')->find($idReporte);
        $personasReportes = $em->getRepository('AppBundle:ProyectoPersonaReporte')->findBy(array('reporte' => $reporte));
        $proyectoPersonas = $em->getRepository('AppBundle:ProyectoPersonaCargo')->findBy(array('proyecto' => $reporte->getProyecto()));

        $programasReportados = $em->getRepository('AppBundle:Reporte')->programasRestantes($reporte->getProyecto()->getId());

        $programasRestantes = $reporte->getProyecto()->getEmisiones();

        if (!empty($programasReportados)) {
            $programasRestantes = $reporte->getProyecto()->getEmisiones() - $programasReportados[0]['cantidadProgramas'];
        }

        return $this->render('Reportes/editReporte.html.twig' , array(
            'reporte' => $reporte,
            'proyectoPersonas' => $proyectoPersonas,
            'personasReportes' => $personasReportes,
            'programasRestantes' => $programasRestantes

        ));
    }

    /**
     * @Route("/updateReporte", name="updateReporte")
     */
    public function updateReporteAction()
    {
        $peticion = Request::createFromGlobals();
        $em = $this->getDoctrine()->getManager();
        $user = $this->getUser();

        $data = array(
            'idProyecto' => $peticion->request->get('idProyecto'),
            'idReporte' => $peticion->request->get('idReporte'),
            'fecha' => $peticion->request->get('fecha'),
            'totalProgramas' => $peticion->request->get('totalProgramas')
        );

        $reportados  = $peticion->request->get('reportados');

        $resp = $em->getRepository('AppBundle:Reporte')->masterModificarReporte($data,$user,$reportados);

        return new Response($resp);
    }

    /**
     * @Route("/verReporte/{idReporte}", name="verReporte")
     */
    public function verReporteAction($idReporte)
    {
        $em = $this->getDoctrine()->getManager();
        $reporte = $em->getRepository('AppBundle:Reporte')->find($idReporte);
        $personasReportes = $em->getRepository('AppBundle:ProyectoPersonaReporte')->findBy(array('reporte' => $reporte));
        $proyectoPersonas = $em->getRepository('AppBundle:ProyectoPersonaCargo')->findBy(array('proyecto' => $reporte->getProyecto()));
        $proyecto = $em->getRepository('AppBundle:Proyecto')->find($reporte->getProyecto());

        return $this->render('Reportes/verReporte.html.twig' , array(
            'reporte' => $reporte,
            'proyecto' => $proyecto,
            'proyectoPersonas' => $proyectoPersonas,
            'personasReportes' => $personasReportes

        ));
    }

}
