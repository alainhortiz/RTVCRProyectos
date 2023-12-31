<?php

namespace AppBundle\Repository;

use AppBundle\Entity\Proyecto;
use AppBundle\Entity\ProyectoPersonaCargo;
use DateTime;
use Doctrine\ORM\EntityRepository;
use Exception;

/**
 * ProyectoRepository
 *
 * This class was generated by the Doctrine ORM. Add your own custom
 * repository methods below.
 */
class ProyectoRepository extends EntityRepository
{
    public function masterAgregarProyecto($data, $user, $contratosPA, $contratosTCP)
    {
        $em = $this->getEntityManager();
        $em->beginTransaction();
        try {

            //agregar las generales de un proyecto
            $proyectoGeneral = $this->agregarProyectoGenerales($data);

            if (is_string($proyectoGeneral)) {
                $em->rollback();
                return $proyectoGeneral;
            }

            //se crea la traza
            $dataTraza = array(
                'username' => $user->getUsername(),
                'nombre' => $user->getNombre(),
                'operacion' => 'Agregar los datos generales de un proyecto',
                'descripcion' => 'Se agregó los datos generales del proyecto: ' . $proyectoGeneral->getTitulo()
            );
            $em->getRepository('AppBundle:Traza')->guardarTraza($dataTraza);

            if ($contratosPA) {
                $contratacionesPA = $this->agregarContratosPA($proyectoGeneral, $contratosPA);
                if (is_string($contratacionesPA)) {
                    $em->rollback();
                    return $contratacionesPA;
                }

                //se crea la traza
                $dataTraza = array(
                    'username' => $user->getUsername(),
                    'nombre' => $user->getNombre(),
                    'operacion' => 'Agregar las contrataciones del personal artístico de un proyecto',
                    'descripcion' => 'Se agregaron las contrataciones del personal artístico del proyecto: ' . $proyectoGeneral->getTitulo()
                );
                $em->getRepository('AppBundle:Traza')->guardarTraza($dataTraza);
            }

            if ($contratosTCP) {
                $contratacionesTCP = $this->agregarContratosTCP($proyectoGeneral, $contratosTCP);
                if (is_string($contratacionesTCP)) {
                    $em->rollback();
                    return $contratacionesTCP;
                }

                //se crea la traza
                $dataTraza = array(
                    'username' => $user->getUsername(),
                    'nombre' => $user->getNombre(),
                    'operacion' => 'Agregar las contrataciones de los trabajadores por cuenta propia de un proyecto',
                    'descripcion' => 'Se agregaron las contrataciones de los trabajadores por cuenta propia del proyecto: ' . $proyectoGeneral->getTitulo()
                );
                $em->getRepository('AppBundle:Traza')->guardarTraza($dataTraza);
            }

            $em->commit();
            $msg = 'ok';


        } catch (Exception $e) {

            $em->rollback();
            $msg = 'Se produjo un error al registrar el proyecto';
        }
        return $msg;
    }

    public function agregarProyectoGenerales($data)
    {
        try {
            $em = $this->getEntityManager();
            $proyecto = new Proyecto();
            $proyecto->setNoContratoCanal($data['noContratoCanal']);
            $proyecto->setNombresDirectorGeneral($data['nombreDirector']);
            $proyecto->setNombresProductorGeneral($data['nombreProductor']);
            $proyecto->setTitulo($data['titulo']);
            $proyecto->setEmisiones($data['cantEmisiones']);
            $proyecto->setTiempoPantalla($data['tiempoPantalla']);
            $proyecto->setEtapaPreFilmacion($data['preFilmacion']);
            $proyecto->setEtapaFilmacion($data['filmacion']);
            $proyecto->setEtapaPostFilmacion($data['postFilmacion']);
            $proyecto->setDescripcion($data['descripcion']);
            $proyecto->setFechaInicio(new DateTime($data['fechaInicio']));
            $proyecto->setFechaTerminacion(new DateTime($data['fechaFinal']));

            $categoria = $em->getRepository('AppBundle:TipoProyecto')->find($data['categoria']);
            $proyecto->setTipo($categoria);

            $formato = $em->getRepository('AppBundle:FormatoProyecto')->find($data['formato']);
            $proyecto->setFormato($formato);

            $em->persist($proyecto);
            $em->flush();
            $msg = $proyecto;

        } catch (Exception $e) {
            if (strpos($e->getMessage(), 'Duplicate entry') > 0) {
                $msg = 'El proyecto ya existe, no se puede agregar';
            } else {
                $msg = 'Se produjo un error al registrar los datos generales del proyecto';
            }
        }
        return $msg;
    }

    public function agregarContratosPA($proyectoGeneral, $contratosPA)
    {
        try {
            $em = $this->getEntityManager();

            foreach ($contratosPA as $contrato) {

                $presupuestoCargo = str_replace(',', '', $contrato['presupuestoCargo']);
                $presupuestoOtroIngreso = str_replace(',', '', $contrato['presupuestoOtroIngreso']);
                $totalPagar = str_replace(',', '', $contrato['totalPagar']);
                $valorPrograma = str_replace(',', '', $contrato['valorPrograma']);

                $contratoPA = new ProyectoPersonaCargo();
                $contratoPA->setProyecto($proyectoGeneral);
                $contratoPA->setNoContrato($contrato['noContrato']);
                $contratoPA->setPresupuestoCargo($presupuestoCargo);
                $contratoPA->setPresupuestoOtroIngreso($presupuestoOtroIngreso);
                $contratoPA->setPresupuestoTotal($totalPagar);
                $contratoPA->setValorPrograma($valorPrograma);
                $contratoPA->setIsPA(true);

                $persona = $em->getRepository('AppBundle:Persona')->findOneBy(array('carnetIdentidad' => $contrato['carnetIdentidad']));
                $contratoPA->setPersona($persona);

                $concepto = $em->getRepository('AppBundle:Cargo')->findOneBy(array('nombre' => $contrato['concepto']));
                $contratoPA->setCargo($concepto);
                $em->persist($contratoPA);

            }
            $em->flush();
            $msg = $contratoPA;

        } catch (Exception $e) {

            $msg = 'Se produjo un error al insertar las contrataciones del personal artístico.';
        }
        return $msg;
    }

    public function agregarContratosTCP($proyectoGeneral, $contratosTCP)
    {
        try {
            $em = $this->getEntityManager();

            foreach ($contratosTCP as $contrato) {

                $presupuestoCargo = str_replace(',', '', $contrato['presupuestoCargo']);
                $totalPagar = str_replace(',', '', $contrato['totalPagar']);
                $valorPrograma = str_replace(',', '', $contrato['valorPrograma']);

                $contratoTCP = new ProyectoPersonaCargo();
                $contratoTCP->setProyecto($proyectoGeneral);
                $contratoTCP->setNoContrato($contrato['noContrato']);
                $contratoTCP->setPresupuestoCargo($presupuestoCargo);
                $contratoTCP->setPresupuestoTotal($totalPagar);
                $contratoTCP->setValorPrograma($valorPrograma);
                $contratoTCP->setIsTCP(true);

                $persona = $em->getRepository('AppBundle:Persona')->findOneBy(array('carnetIdentidad' => $contrato['carnetIdentidad']));
                $contratoTCP->setPersona($persona);

                $servicio = $em->getRepository('AppBundle:Cargo')->findOneBy(array('nombre' => $contrato['servicio']));
                $contratoTCP->setCargo($servicio);

                $em->persist($contratoTCP);

            }
            $em->flush();
            $msg = $contratoTCP;


        } catch (Exception $e) {

            $msg = 'Se produjo un error al insertar las contrataciones de los trabajadores por cuenta propia.';
        }
        return $msg;
    }

    public function masterModificarProyecto($data, $user, $contratos)
    {
        $em = $this->getEntityManager();
        $em->beginTransaction();
        try {

            //agregar las generales de un proyecto
            $proyectoGeneral = $this->modificarProyectoGenerales($data);

            if (is_string($proyectoGeneral)) {
                $em->rollback();
                return $proyectoGeneral;
            }

            //se crea la traza
            $dataTraza = array(
                'username' => $user->getUsername(),
                'nombre' => $user->getNombre(),
                'operacion' => 'Modificar los datos generales de un proyecto',
                'descripcion' => 'Se modificó los datos generales del proyecto: ' . $proyectoGeneral->getTitulo()
            );
            $em->getRepository('AppBundle:Traza')->guardarTraza($dataTraza);

            if ($contratos) {
                $contrataciones = $this->modificarContratos($proyectoGeneral, $contratos);
            } else {
                $contrataciones = $this->eliminarContratos($proyectoGeneral, $contratos);
            }

            if (is_string($contrataciones)) {
                $em->rollback();
                return $contrataciones;
            }

            //se crea la traza
            $dataTraza = array(
                'username' => $user->getUsername(),
                'nombre' => $user->getNombre(),
                'operacion' => 'Modificación de las contrataciones de un proyecto',
                'descripcion' => 'Se modificaron las contrataciones del proyecto: ' . $proyectoGeneral->getTitulo()
            );
            $em->getRepository('AppBundle:Traza')->guardarTraza($dataTraza);


            $em->commit();
            $msg = 'ok';


        } catch (Exception $e) {

            $em->rollback();
            $msg = 'Se produjo un error al modificar el proyecto';
        }
        return $msg;
    }

    public function modificarProyectoGenerales($data)
    {
        try {
            $em = $this->getEntityManager();
            $proyecto = $em->getRepository('AppBundle:Proyecto')->find($data['idProyecto']);

            if (!empty($proyecto)) {

                $proyecto->setNoContratoCanal($data['noContratoCanal']);
                $proyecto->setNombresDirectorGeneral($data['nombreDirector']);
                $proyecto->setNombresProductorGeneral($data['nombreProductor']);
                $proyecto->setTitulo($data['titulo']);
                $proyecto->setEmisiones($data['cantEmisiones']);
                $proyecto->setTiempoPantalla($data['tiempoPantalla']);
                $proyecto->setEtapaPreFilmacion($data['preFilmacion']);
                $proyecto->setEtapaFilmacion($data['filmacion']);
                $proyecto->setEtapaPostFilmacion($data['postFilmacion']);
                $proyecto->setDescripcion($data['descripcion']);
                $proyecto->setFechaInicio(new DateTime($data['fechaInicio']));
                $proyecto->setFechaTerminacion(new DateTime($data['fechaFinal']));

                $categoria = $em->getRepository('AppBundle:TipoProyecto')->find($data['categoria']);
                $proyecto->setTipo($categoria);

                $formato = $em->getRepository('AppBundle:FormatoProyecto')->find($data['formato']);
                $proyecto->setFormato($formato);


                $em->flush();
                $msg = $proyecto;
            } else {
                $msg = $proyecto;
            }

        } catch (Exception $e) {

            $msg = 'Se produjo un error al modificar los datos generales del proyecto';

        }
        return $msg;
    }

    public function modificarContratos($proyectoGeneral, $contratos)
    {
        try {
            $em = $this->getEntityManager();

            $contratacion = $em->getRepository('AppBundle:ProyectoPersonaCargo')->findBy(array('proyecto' => $proyectoGeneral));
            foreach ($contratacion as $persona) {
                $posicion = -1;
                foreach ($contratos as $contrato) {
                    if ($persona->getPersona()->getCarnetIdentidad() === $contrato['carnetIdentidad'] && $persona->getCargo()->getNombre() === $contrato['concepto']){
                        $posicion = 1;
                    }
                }
                if( $posicion === -1 ) {
                    $em->remove($persona);
                }
            }

            $em->flush();

            foreach ($contratos as $contrato) {

                $presupuestoCargo = str_replace(',', '', $contrato['presupuestoCargo']);
                $presupuestoOtroIngreso = str_replace(',', '', $contrato['presupuestoOtroIngreso']);
                $totalPagar = str_replace(',', '', $contrato['totalPagar']);
                $valorPrograma = str_replace(',', '', $contrato['valorPrograma']);

                $concepto = $em->getRepository('AppBundle:Cargo')->findOneBy(array('nombre' => $contrato['concepto']));
                $persona = $em->getRepository('AppBundle:Persona')->findOneBy(array('carnetIdentidad' => $contrato['carnetIdentidad']));

                $personaContratada = $em->getRepository('AppBundle:ProyectoPersonaCargo')->findOneBy(array('proyecto' => $proyectoGeneral, 'persona' => $persona, 'cargo' => $concepto));

                if (!empty($personaContratada)) {
                    $personaContratada->setNoContrato($contrato['noContrato']);
                    $personaContratada->setPresupuestoCargo($presupuestoCargo);
                    $personaContratada->setPresupuestoOtroIngreso($presupuestoOtroIngreso);
                    $personaContratada->setPresupuestoTotal($totalPagar);
                    $personaContratada->setValorPrograma($valorPrograma);
                    $personaContratada->setIsPA($contrato['isPA']);
                    $personaContratada->setIsTCP($contrato['isTCP']);
                } else {
                    $personaContratada = new ProyectoPersonaCargo();
                    $personaContratada->setProyecto($proyectoGeneral);
                    $personaContratada->setNoContrato($contrato['noContrato']);
                    $personaContratada->setPresupuestoCargo($presupuestoCargo);
                    $personaContratada->setPresupuestoOtroIngreso($presupuestoOtroIngreso);
                    $personaContratada->setPresupuestoTotal($totalPagar);
                    $personaContratada->setValorPrograma($valorPrograma);
                    $personaContratada->setIsPA($contrato['isPA']);
                    $personaContratada->setIsTCP($contrato['isTCP']);
                    $personaContratada->setCargo($concepto);
                    $personaContratada->setPersona($persona);
                    $em->persist($personaContratada);
                }
            }
            $em->flush();
            $msg = $personaContratada;


        } catch (Exception $e) {

            $msg = 'Se produjo un error al modificar las contrataciones del proyecto.';
        }
        return $msg;
    }

    public function eliminarContratos($proyectoGeneral, $contratos)
    {
        try {
            $em = $this->getEntityManager();

            $contratacion = $em->getRepository('AppBundle:ProyectoPersonaCargo')->findBy(array('proyecto' => $proyectoGeneral));

            if (!empty($contratacion)) {

                foreach ($contratacion as $persona) {
                    $em->remove($persona);
                }

                $em->flush();
                $msg = $contratacion;
            }

        } catch (Exception $e) {

            $msg = 'Se produjo un error al modificar las contrataciones del proyecto.';
        }
        return $msg;
    }

    public function masterConcluirProyecto($user, $idProyecto)
    {
        $em = $this->getEntityManager();
        $em->beginTransaction();
        try {

            //agregar las generales de un proyecto
            $proyecto = $this->concluirProyecto($idProyecto);

            if (is_string($proyecto)) {
                $em->rollback();
                return $proyecto;
            }

            //se crea la traza
            $dataTraza = array(
                'username' => $user->getUsername(),
                'nombre' => $user->getNombre(),
                'operacion' => 'Concluir un proyecto',
                'descripcion' => 'Se concluyó el proyecto: ' . $proyecto->getTitulo()
            );
            $em->getRepository('AppBundle:Traza')->guardarTraza($dataTraza);

            $em->commit();
            $msg = 'ok';


        } catch (Exception $e) {

            $em->rollback();
            $msg = 'Se produjo un error al concluir el proyecto';
        }
        return $msg;
    }

    public function concluirProyecto($idProyecto)
    {
        try {
            $em = $this->getEntityManager();

            $concluir = $em->getRepository('AppBundle:Proyecto')->find($idProyecto);

            if (!empty($concluir)) {

                $concluir->setIsConcluido(true);
                $em->flush();
                $msg = $concluir;

            }

        } catch (Exception $e) {

            $msg = 'Se produjo un error al concluir el proyecto.';
        }
        return $msg;
    }

    public function graficoTotalesCategoriasProyecto()
    {
        $em = $this->getEntityManager();

        $dql = 'SELECT t.nombre, COUNT(e) as cant
                FROM AppBundle:Proyecto e
                JOIN e.tipo t
                GROUP BY t.nombre
                ORDER BY cant DESC';

        $query = $em->createQuery($dql);

        return $query->getResult();

    }

}
