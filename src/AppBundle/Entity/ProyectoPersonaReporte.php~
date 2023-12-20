<?php

namespace AppBundle\Entity;

use DateTime;
use Doctrine\ORM\Mapping as ORM;

/**
 * ProyectoPersonaReporte
 *
 * @ORM\Table(name="proyecto_persona_reporte")
 * @ORM\Entity(repositoryClass="AppBundle\Repository\ProyectoPersonaReporteRepository")
 */
class ProyectoPersonaReporte
{
    /**
     * @var int
     *
     * @ORM\Column(name="id", type="integer")
     * @ORM\Id
     * @ORM\GeneratedValue(strategy="AUTO")
     */
    private $id;

    /**
     * @var int
     *
     * @ORM\Column(name="noSuplemento", type="integer", nullable=false)
     */
    private $noSuplemento;

    /**
     * @var int
     *
     * @ORM\Column(name="cantidadProgramas", type="integer", nullable=false)
     */
    private $cantidadProgramas;

    /**
     * @var int
     *
     * @ORM\Column(name="ingreso", type="decimal", precision=18, scale=2, nullable=false)
     */
    private $ingreso;

    /**
     * @var int
     *
     * @ORM\Column(name="porciento", type="decimal", precision=18, scale=2, nullable=false)
     */
    private $porciento;

    /**
     * @var int
     *
     * @ORM\Column(name="presupuestoACobrar", type="decimal", precision=18, scale=2, nullable=false)
     */
    private $presupuestoACobrar;

    /**
     * @var int
     *
     * @ORM\Column(name="presupuestoRestante", type="decimal", precision=18, scale=2, nullable=false)
     */
    private $presupuestoRestante;

    /**
     * @ORM\ManyToOne(targetEntity="ProyectoPersonaCargo",inversedBy="proyectosPersonasReportes")
     */
    protected $proyectoPersonaCargo;

    /**
     * @ORM\ManyToOne(targetEntity="Reporte",inversedBy="proyectosPersonasReportes")
     */
    protected $reporte;

    /**
     * Get id
     *
     * @return int
     */
    public function getId()
    {
        return $this->id;
    }

    /**
     * Set cantidadProgramas
     *
     * @param integer $cantidadProgramas
     *
     * @return ProyectoPersonaReporte
     */
    public function setCantidadProgramas($cantidadProgramas)
    {
        $this->cantidadProgramas = $cantidadProgramas;

        return $this;
    }

    /**
     * Get cantidadProgramas
     *
     * @return integer
     */
    public function getCantidadProgramas()
    {
        return $this->cantidadProgramas;
    }

    /**
     * Set proyectoPersonaCargo
     *
     * @param \AppBundle\Entity\ProyectoPersonaCargo $proyectoPersonaCargo
     *
     * @return ProyectoPersonaReporte
     */
    public function setProyectoPersonaCargo(\AppBundle\Entity\ProyectoPersonaCargo $proyectoPersonaCargo = null)
    {
        $this->proyectoPersonaCargo = $proyectoPersonaCargo;

        return $this;
    }

    /**
     * Get proyectoPersonaCargo
     *
     * @return \AppBundle\Entity\ProyectoPersonaCargo
     */
    public function getProyectoPersonaCargo()
    {
        return $this->proyectoPersonaCargo;
    }

    /**
     * Set reporte
     *
     * @param \AppBundle\Entity\Reporte $reporte
     *
     * @return ProyectoPersonaReporte
     */
    public function setReporte(\AppBundle\Entity\Reporte $reporte = null)
    {
        $this->reporte = $reporte;

        return $this;
    }

    /**
     * Get reporte
     *
     * @return \AppBundle\Entity\Reporte
     */
    public function getReporte()
    {
        return $this->reporte;
    }

    /**
     * Set presupuestoACobrar
     *
     * @param string $presupuestoACobrar
     *
     * @return ProyectoPersonaReporte
     */
    public function setPresupuestoACobrar($presupuestoACobrar)
    {
        $this->presupuestoACobrar = $presupuestoACobrar;

        return $this;
    }

    /**
     * Get presupuestoACobrar
     *
     * @return string
     */
    public function getPresupuestoACobrar()
    {
        return $this->presupuestoACobrar;
    }

    /**
     * Set presupuestoRestante
     *
     * @param string $presupuestoRestante
     *
     * @return ProyectoPersonaReporte
     */
    public function setPresupuestoRestante($presupuestoRestante)
    {
        $this->presupuestoRestante = $presupuestoRestante;

        return $this;
    }

    /**
     * Get presupuestoRestante
     *
     * @return string
     */
    public function getPresupuestoRestante()
    {
        return $this->presupuestoRestante;
    }


    /**
     * Set ingreso
     *
     * @param string $ingreso
     *
     * @return ProyectoPersonaReporte
     */
    public function setIngreso($ingreso)
    {
        $this->ingreso = $ingreso;

        return $this;
    }

    /**
     * Get ingreso
     *
     * @return string
     */
    public function getIngreso()
    {
        return $this->ingreso;
    }

    /**
     * Set porciento
     *
     * @param string $porciento
     *
     * @return ProyectoPersonaReporte
     */
    public function setPorciento($porciento)
    {
        $this->porciento = $porciento;

        return $this;
    }

    /**
     * Get porciento
     *
     * @return string
     */
    public function getPorciento()
    {
        return $this->porciento;
    }

    /**
     * Set noSuplemento
     *
     * @param integer $noSuplemento
     *
     * @return ProyectoPersonaReporte
     */
    public function setNoSuplemento($noSuplemento)
    {
        $this->noSuplemento = $noSuplemento;

        return $this;
    }

    /**
     * Get noSuplemento
     *
     * @return integer
     */
    public function getNoSuplemento()
    {
        return $this->noSuplemento;
    }
}
