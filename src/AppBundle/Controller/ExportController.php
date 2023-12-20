<?php

namespace AppBundle\Controller;

use AppBundle\ExportacionExcel\ExportadorExcel;
use AppBundle\ExportacionWord\ExportadorWord;
use Doctrine\Common\Collections\ArrayCollection;
use Symfony\Bundle\FrameworkBundle\Controller\Controller;
use Sensio\Bundle\FrameworkExtraBundle\Configuration\Route;

class ExportController extends Controller
{
    /**
     * @Route("/exportarContrato/{idProyectoCargo}", name="exportarContrato")
     */
    public function exportarContratoAction($idProyectoCargo)
    {
        $em = $this->getDoctrine()->getManager();

        $proyecto = $em->getRepository('AppBundle:ProyectoPersonaCargo')->find($idProyectoCargo);
        $actual = $proyecto->getProyecto()->getFechaInicio();
        $dia = $actual->format('j');
        $mes = $actual->format('F');
        $mes = $this->mesEspanol($mes);

        $tipoContrato = $proyecto->getCargo()->getTipoContrato()->getId();

        if ($tipoContrato !== 1  && $tipoContrato !== 3 && $tipoContrato !== 8) {
            $conceptos = $em->getRepository('AppBundle:ProyectoPersonaCargo')->conceptosPersona($proyecto->getPersona()->getCarnetIdentidad(), $proyecto->getProyecto()->getId());
            $presupuestoTotal = 0;
            if (count($conceptos) > 1 ) {
                foreach ($conceptos as $persona) {
                    $presupuestoTotal += $persona['presupuestoCargo'];
                }
                $tipoContrato = 'conceptos';
            }
        }

        $word = new ExportadorWord();

        switch ($tipoContrato) {
            case '1':
                $word->exportarDirector($dia, $mes, $proyecto);
                break;
            case '2':
                $word->exportarProductor($dia, $mes, $proyecto);
                break;
            case '3':
                $word->exportarGuionista($dia, $mes, $proyecto);
                break;
            case '7':
                $word->exportarTCPAlimentacion($dia, $mes, $proyecto);
                break;
            case '8':
                $word->exportarActor($dia, $mes, $proyecto);
                break;
            case '9':
                $word->exportarAsistenteAlAProduccion($dia, $mes, $proyecto);
                break;
            case '10':
                $word->exportarTCPTransportacion($dia, $mes, $proyecto);
                break;
            case 'conceptos':
                $word->exportarConceptos($dia, $mes,$proyecto, $presupuestoTotal, $conceptos);
                break;
            default:
                $word->exportarGeneral($dia, $mes, $proyecto);
                break;
            /*case 'Contrato General':
                $word->exportarProductor($dia, $mes,$proyecto);
                break;
            case 'Contrato Trabajador por Cuenta Propia':
                $word->exportarProductor($dia, $mes,$proyecto);
                break;*/
        }


    }

    /**
     * @Route("/exportarProyecto/{idProyecto}", name="exportarProyecto")
     */
    public function exportarProyectoAction($idProyecto)
    {

        $em = $this->getDoctrine()->getManager();
        $user = $this->getUser();
        $proyecto = $em->getRepository('AppBundle:Proyecto')->find($idProyecto);
        $actual = $proyecto->getFechaInicio();
        $mes = $actual->format('F');
        $mes = $this->mesEspanol($mes);
        $year = $actual->format('Y');
        $personasProyectos = $em->getRepository('AppBundle:ProyectoPersonaCargo')->findBy(array('proyecto' => $proyecto));
        $titulo = $proyecto->getTitulo();
        $datosContratados = new ArrayCollection();
        foreach ($personasProyectos as $persona) {
            $datosContratados->add(array(
                'noContrato' => $persona->getNoContrato(),
                'nombres' => $persona->getPersona()->nombreCompleto(),
                'CI' => $persona->getPersona()->getCarnetIdentidad(),
                'direccion' => $persona->getPersona()->getDireccion(),
                'registroCreador' => $persona->getPersona()->getNoRegistroCreador(),
                'concepto' => $persona->getCargo()->getNombre(),
                'porCargo' => $persona->getPresupuestoCargo(),
                'otroIngreso' => $persona->getPresupuestoOtroIngreso(),
                'totalCobrar' => $persona->getPresupuestoTotal(),
                'valorPrograma' => $persona->getValorPrograma()
            ));
        }

        $excel = new ExportadorExcel();
        $excel->exportarProyecto($user->getUsername(), $titulo, $mes, $year, $proyecto, $datosContratados);
    }

    /**
     * @Route("/exportarReporte/{idReporte}", name="exportarReporte")
     */
    public function exportarReporteAction($idReporte)
    {

        $em = $this->getDoctrine()->getManager();
        $user = $this->getUser();
        $reporte = $em->getRepository('AppBundle:Reporte')->find($idReporte);
        $actual = $reporte->getFechaReporte();
        $mes = $actual->format('F');
        $mes = $this->mesEspanol($mes);
        $year = $actual->format('Y');
        $personasReportes = $em->getRepository('AppBundle:ProyectoPersonaReporte')->findBy(array('reporte' => $reporte));
        $titulo = $reporte->getProyecto()->getTitulo();
        $datosTrabajaron = new ArrayCollection();
        foreach ($personasReportes as $persona) {
            $datosTrabajaron->add(array(
                'noContrato' => $persona->getProyectoPersonaCargo()->getNoContrato(),
                'nombres' => $persona->getProyectoPersonaCargo()->getPersona()->nombreCompleto(),
                'concepto' => $persona->getProyectoPersonaCargo()->getCargo()->getNombre(),
                'valorPrograma' => $persona->getProyectoPersonaCargo()->getValorPrograma(),
                'cantPrograma' => $persona->getCantidadProgramas(),
                'ingreso' => $persona->getIngreso(),
                'porciento' => $persona->getPorciento(),
                'aCobrar' => $persona->getPresupuestoACobrar(),
                'CI' => $persona->getProyectoPersonaCargo()->getPersona()->getCarnetIdentidad(),
                'direccion' => $persona->getProyectoPersonaCargo()->getPersona()->getDireccion()
            ));
        }

        $excel = new ExportadorExcel();
        $excel->exportarPrenominaReporte($user->getUsername(), $titulo, $mes, $year, $reporte, $datosTrabajaron);
    }

    /**
     * @Route("/exportarSuplemento/{idPersona}", name="exportarSuplemento")
     */
    public function exportarSuplementoAction($idPersona)
    {
        $em = $this->getDoctrine()->getManager();

        $personaReporte = $em->getRepository('AppBundle:ProyectoPersonaReporte')->find($idPersona);
        $actual = $personaReporte->getReporte()->getFechaReporte();
        $dia = $actual->format('d');
        $mes = $actual->format('F');
        $mes = $this->mesEspanol($mes);

        $word = new ExportadorWord();
        $word->exportarSuplemento($dia, $mes, $personaReporte);

    }

    private function mesEspanol($mesIngles)
    {
        $mes = '';
        if ($mesIngles === 'January') {
            $mes = 'Enero';
        } else if ($mesIngles === 'February') {
            $mes = 'Febrero';
        } else if ($mesIngles === 'March') {
            $mes = 'Marzo';
        } else if ($mesIngles === 'April') {
            $mes = 'Abril';
        } else if ($mesIngles === 'May') {
            $mes = 'Mayo';
        } else if ($mesIngles === 'June') {
            $mes = 'Junio';
        } else if ($mesIngles === 'July') {
            $mes = 'Julio';
        } else if ($mesIngles === 'August') {
            $mes = 'Agosto';
        } else if ($mesIngles === 'September') {
            $mes = 'Septiembre';
        } else if ($mesIngles === 'October') {
            $mes = 'Octubre';
        } else if ($mesIngles === 'November') {
            $mes = 'Noviembre';
        } else if ($mesIngles === 'December') {
            $mes = 'Diciembre';
        }

        return $mes;
    }

}
