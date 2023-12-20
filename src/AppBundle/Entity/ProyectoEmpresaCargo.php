<?php

namespace AppBundle\Entity;

use Doctrine\Common\Collections\ArrayCollection;
use Doctrine\ORM\Mapping as ORM;

/**
 * ProyectoEmpresaCargo
 *
 * @ORM\Table(name="proyecto_empresa_cargo")
 * @ORM\Entity(repositoryClass="AppBundle\Repository\ProyectoEmpresaCargoRepository")
 */
class ProyectoEmpresaCargo
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
     * @var string
     *
     * @ORM\Column(name="noContrato", type="string", length=10, nullable=false)
     */
    private $noContrato;

    /**
     * @var bool
     *
     * @ORM\Column(name="isTCP", type="boolean", nullable=true)
     */
    private $isTCP = false;

    /**
     * @var bool
     *
     * @ORM\Column(name="isPA", type="boolean", nullable=true)
     */
    private $isPA = false;

    /**
     * @var int
     *
     * @ORM\Column(name="presupuestoCargo", type="decimal", precision=18, scale=2, nullable=false)
     */
    private $presupuestoCargo;

    /**
     * @var int
     *
     * @ORM\Column(name="presupuestoOtroIngreso", type="decimal", precision=18, scale=2, nullable=true)
     */
    private $presupuestoOtroIngreso;

    /**
     * @var int
     *
     * @ORM\Column(name="presupuestoTotal", type="decimal", precision=18, scale=2, nullable=false)
     */
    private $presupuestoTotal;

    /**
     * @var int
     *
     * @ORM\Column(name="valorPrograma", type="decimal", precision=18, scale=2, nullable=false)
     */
    private $valorPrograma;

    /**
     * @var int
     *
     * @ORM\Column(name="presupuestoRestante", type="decimal", precision=18, scale=2, nullable=true)
     */
    private $presupuestoRestante;

    /**
     * @ORM\ManyToOne(targetEntity="Proyecto",inversedBy="proyectosEmpresasCargos")
     */
    protected $proyecto;

    /**
     * @ORM\ManyToOne(targetEntity="Empresa",inversedBy="proyectosEmpresasCargos")
     */
    protected $empresa;

    /**
     * @ORM\ManyToOne(targetEntity="Cargo",inversedBy="proyectosEmpresasCargos")
     */
    protected $cargo;

    /**
     * @ORM\OneToMany(targetEntity="AppBundle\Entity\ProyectoEmpresaReporte", mappedBy="proyectoEmpresaCargo")
     */
    private $proyectosEmpresasReportes;

    /**
     * Constructor.
     */
    public function __construct()
    {
        $this->proyectosEmpresasReportes = new ArrayCollection();
    }

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
     * Set noContrato
     *
     * @param string $noContrato
     *
     * @return ProyectoEmpresaCargo
     */
    public function setNoContrato($noContrato)
    {
        $this->noContrato = $noContrato;

        return $this;
    }

    /**
     * Get noContrato
     *
     * @return string
     */
    public function getNoContrato()
    {
        return $this->noContrato;
    }

    /**
     * Set isTCP
     *
     * @param boolean $isTCP
     *
     * @return ProyectoEmpresaCargo
     */
    public function setIsTCP($isTCP)
    {
        $this->isTCP = $isTCP;

        return $this;
    }

    /**
     * Get isTCP
     *
     * @return boolean
     */
    public function getIsTCP()
    {
        return $this->isTCP;
    }

    /**
     * Set isPA
     *
     * @param boolean $isPA
     *
     * @return ProyectoEmpresaCargo
     */
    public function setIsPA($isPA)
    {
        $this->isPA = $isPA;

        return $this;
    }

    /**
     * Get isPA
     *
     * @return boolean
     */
    public function getIsPA()
    {
        return $this->isPA;
    }

    /**
     * Set presupuestoCargo
     *
     * @param string $presupuestoCargo
     *
     * @return ProyectoEmpresaCargo
     */
    public function setPresupuestoCargo($presupuestoCargo)
    {
        $this->presupuestoCargo = $presupuestoCargo;

        return $this;
    }

    /**
     * Get presupuestoCargo
     *
     * @return string
     */
    public function getPresupuestoCargo()
    {
        return $this->presupuestoCargo;
    }

    /**
     * Set presupuestoOtroIngreso
     *
     * @param string $presupuestoOtroIngreso
     *
     * @return ProyectoEmpresaCargo
     */
    public function setPresupuestoOtroIngreso($presupuestoOtroIngreso)
    {
        $this->presupuestoOtroIngreso = $presupuestoOtroIngreso;

        return $this;
    }

    /**
     * Get presupuestoOtroIngreso
     *
     * @return string
     */
    public function getPresupuestoOtroIngreso()
    {
        return $this->presupuestoOtroIngreso;
    }

    /**
     * Set presupuestoTotal
     *
     * @param string $presupuestoTotal
     *
     * @return ProyectoEmpresaCargo
     */
    public function setPresupuestoTotal($presupuestoTotal)
    {
        $this->presupuestoTotal = $presupuestoTotal;

        return $this;
    }

    /**
     * Get presupuestoTotal
     *
     * @return string
     */
    public function getPresupuestoTotal()
    {
        return $this->presupuestoTotal;
    }

    /**
     * Set valorPrograma
     *
     * @param string $valorPrograma
     *
     * @return ProyectoEmpresaCargo
     */
    public function setValorPrograma($valorPrograma)
    {
        $this->valorPrograma = $valorPrograma;

        return $this;
    }

    /**
     * Get valorPrograma
     *
     * @return string
     */
    public function getValorPrograma()
    {
        return $this->valorPrograma;
    }

    /**
     * Set presupuestoRestante
     *
     * @param string $presupuestoRestante
     *
     * @return ProyectoEmpresaCargo
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
     * Set proyecto
     *
     * @param \AppBundle\Entity\Proyecto $proyecto
     *
     * @return ProyectoEmpresaCargo
     */
    public function setProyecto(\AppBundle\Entity\Proyecto $proyecto = null)
    {
        $this->proyecto = $proyecto;

        return $this;
    }

    /**
     * Get proyecto
     *
     * @return \AppBundle\Entity\Proyecto
     */
    public function getProyecto()
    {
        return $this->proyecto;
    }

    /**
     * Set empresa
     *
     * @param \AppBundle\Entity\Empresa $empresa
     *
     * @return ProyectoEmpresaCargo
     */
    public function setEmpresa(\AppBundle\Entity\Empresa $empresa = null)
    {
        $this->empresa = $empresa;

        return $this;
    }

    /**
     * Get empresa
     *
     * @return \AppBundle\Entity\Empresa
     */
    public function getEmpresa()
    {
        return $this->empresa;
    }

    /**
     * Set cargo
     *
     * @param \AppBundle\Entity\Cargo $cargo
     *
     * @return ProyectoEmpresaCargo
     */
    public function setCargo(\AppBundle\Entity\Cargo $cargo = null)
    {
        $this->cargo = $cargo;

        return $this;
    }

    /**
     * Get cargo
     *
     * @return \AppBundle\Entity\Cargo
     */
    public function getCargo()
    {
        return $this->cargo;
    }

    /**
     * Add proyectosEmpresasReporte
     *
     * @param \AppBundle\Entity\ProyectoEmpresaReporte $proyectosEmpresasReporte
     *
     * @return ProyectoEmpresaCargo
     */
    public function addProyectosEmpresasReporte(\AppBundle\Entity\ProyectoEmpresaReporte $proyectosEmpresasReporte)
    {
        $this->proyectosEmpresasReportes[] = $proyectosEmpresasReporte;

        return $this;
    }

    /**
     * Remove proyectosEmpresasReporte
     *
     * @param \AppBundle\Entity\ProyectoEmpresaReporte $proyectosEmpresasReporte
     */
    public function removeProyectosEmpresasReporte(\AppBundle\Entity\ProyectoEmpresaReporte $proyectosEmpresasReporte)
    {
        $this->proyectosEmpresasReportes->removeElement($proyectosEmpresasReporte);
    }

    /**
     * Get proyectosEmpresasReportes
     *
     * @return \Doctrine\Common\Collections\Collection
     */
    public function getProyectosEmpresasReportes()
    {
        return $this->proyectosEmpresasReportes;
    }
}
