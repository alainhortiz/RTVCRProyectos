<?php

namespace AppBundle\Entity;

use Doctrine\ORM\Mapping as ORM;

/**
 * ProyectoEmpresaReporte
 *
 * @ORM\Table(name="proyecto_empresa_reporte")
 * @ORM\Entity(repositoryClass="AppBundle\Repository\ProyectoEmpresaReporteRepository")
 */
class ProyectoEmpresaReporte
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
     * @ORM\ManyToOne(targetEntity="AppBundle\Entity\ProyectoEmpresaCargo",inversedBy="proyectosEmpresasReportes")
     */
    protected $proyectoEmpresaCargo;

    /**
     * @ORM\ManyToOne(targetEntity="Reporte",inversedBy="proyectosEmpresasReportes")
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
     * Set noSuplemento
     *
     * @param integer $noSuplemento
     *
     * @return ProyectoEmpresaReporte
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

    /**
     * Set cantidadProgramas
     *
     * @param integer $cantidadProgramas
     *
     * @return ProyectoEmpresaReporte
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
     * Set ingreso
     *
     * @param string $ingreso
     *
     * @return ProyectoEmpresaReporte
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
     * @return ProyectoEmpresaReporte
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
     * Set presupuestoACobrar
     *
     * @param string $presupuestoACobrar
     *
     * @return ProyectoEmpresaReporte
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
     * @return ProyectoEmpresaReporte
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
     * Set proyectoEmpresaCargo
     *
     * @param \AppBundle\Entity\ProyectoEmpresaCargo $proyectoEmpresaCargo
     *
     * @return ProyectoEmpresaReporte
     */
    public function setProyectoEmpresaCargo(\AppBundle\Entity\ProyectoEmpresaCargo $proyectoEmpresaCargo = null)
    {
        $this->proyectoEmpresaCargo = $proyectoEmpresaCargo;

        return $this;
    }

    /**
     * Get proyectoEmpresaCargo
     *
     * @return \AppBundle\Entity\ProyectoEmpresaCargo
     */
    public function getProyectoEmpresaCargo()
    {
        return $this->proyectoEmpresaCargo;
    }

    /**
     * Set reporte
     *
     * @param \AppBundle\Entity\Reporte $reporte
     *
     * @return ProyectoEmpresaReporte
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
}
