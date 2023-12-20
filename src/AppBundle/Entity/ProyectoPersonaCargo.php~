<?php

namespace AppBundle\Entity;

use Doctrine\Common\Collections\ArrayCollection;
use Doctrine\ORM\Mapping as ORM;

/**
 * ProyectoPersonaCargo
 *
 * @ORM\Table(name="proyecto_persona_cargo")
 * @ORM\Entity(repositoryClass="AppBundle\Repository\ProyectoPersonaCargoRepository")
 * @ORM\HasLifecycleCallbacks()
 */
class ProyectoPersonaCargo
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
     * @ORM\ManyToOne(targetEntity="Proyecto",inversedBy="proyectosPersonasCargos")
     */
    protected $proyecto;

    /**
     * @ORM\ManyToOne(targetEntity="Persona",inversedBy="proyectosPersonasCargos")
     */
    protected $persona;

    /**
     * @ORM\ManyToOne(targetEntity="Cargo",inversedBy="proyectosPersonasCargos")
     */
    protected $cargo;

    /**
     * @ORM\OneToMany(targetEntity="ProyectoPersonaReporte", mappedBy="proyectoPersonaCargo")
     */
    private $proyectosPersonasReportes;

    /**
     * Constructor.
     */
    public function __construct()
    {
        $this->proyectosPersonasReportes = new ArrayCollection();
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
     * Set proyecto
     *
     * @param \AppBundle\Entity\Proyecto $proyecto
     *
     * @return ProyectoPersonaCargo
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
     * Set persona
     *
     * @param \AppBundle\Entity\Persona $persona
     *
     * @return ProyectoPersonaCargo
     */
    public function setPersona(\AppBundle\Entity\Persona $persona = null)
    {
        $this->persona = $persona;

        return $this;
    }

    /**
     * Get persona
     *
     * @return \AppBundle\Entity\Persona
     */
    public function getPersona()
    {
        return $this->persona;
    }

    /**
     * Set cargo
     *
     * @param \AppBundle\Entity\Cargo $cargo
     *
     * @return ProyectoPersonaCargo
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
     * Set presupuestoCargo
     *
     * @param integer $presupuestoCargo
     *
     * @return ProyectoPersonaCargo
     */
    public function setPresupuestoCargo($presupuestoCargo)
    {
        $this->presupuestoCargo = $presupuestoCargo;

        return $this;
    }

    /**
     * Get presupuestoCargo
     *
     * @return integer
     */
    public function getPresupuestoCargo()
    {
        return $this->presupuestoCargo;
    }

    /**
     * Set presupuestoOtroIngreso
     *
     * @param integer $presupuestoOtroIngreso
     *
     * @return ProyectoPersonaCargo
     */
    public function setPresupuestoOtroIngreso($presupuestoOtroIngreso)
    {
        $this->presupuestoOtroIngreso = $presupuestoOtroIngreso;

        return $this;
    }

    /**
     * Get presupuestoOtroIngreso
     *
     * @return integer
     */
    public function getPresupuestoOtroIngreso()
    {
        return $this->presupuestoOtroIngreso;
    }

    /**
     * Set presupuestoTotal
     *
     * @param integer $presupuestoTotal
     *
     * @return ProyectoPersonaCargo
     */
    public function setPresupuestoTotal($presupuestoTotal)
    {
        $this->presupuestoTotal = $presupuestoTotal;

        return $this;
    }

    /**
     * Get presupuestoTotal
     *
     * @return integer
     */
    public function getPresupuestoTotal()
    {
        return $this->presupuestoTotal;
    }

    /**
     * Set valorPrograma
     *
     * @param integer $valorPrograma
     *
     * @return ProyectoPersonaCargo
     */
    public function setValorPrograma($valorPrograma)
    {
        $this->valorPrograma = $valorPrograma;

        return $this;
    }

    /**
     * Get valorPrograma
     *
     * @return integer
     */
    public function getValorPrograma()
    {
        return $this->valorPrograma;
    }

    /**
     * Set noContrato
     *
     * @param string $noContrato
     *
     * @return ProyectoPersonaCargo
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
     * @return ProyectoPersonaCargo
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
     * @return ProyectoPersonaCargo
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
     * Add proyectosPersonasReporte
     *
     * @param \AppBundle\Entity\ProyectoPersonaReporte $proyectosPersonasReporte
     *
     * @return ProyectoPersonaCargo
     */
    public function addProyectosPersonasReporte(\AppBundle\Entity\ProyectoPersonaReporte $proyectosPersonasReporte)
    {
        $this->proyectosPersonasReportes[] = $proyectosPersonasReporte;

        return $this;
    }

    /**
     * Remove proyectosPersonasReporte
     *
     * @param \AppBundle\Entity\ProyectoPersonaReporte $proyectosPersonasReporte
     */
    public function removeProyectosPersonasReporte(\AppBundle\Entity\ProyectoPersonaReporte $proyectosPersonasReporte)
    {
        $this->proyectosPersonasReportes->removeElement($proyectosPersonasReporte);
    }

    /**
     * Get proyectosPersonasReportes
     *
     * @return \Doctrine\Common\Collections\Collection
     */
    public function getProyectosPersonasReportes()
    {
        return $this->proyectosPersonasReportes;
    }

    public function cantidadReportes()
    {
        return count($this->proyectosPersonasReportes);
    }

    /**
     * Set presupuestoRestante
     *
     * @param string $presupuestoRestante
     *
     * @return ProyectoPersonaCargo
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
     * @ORM\PrePersist
     */
    public function setPresupuestoRestanteValue()
    {
        $this->presupuestoRestante = $this->presupuestoTotal;
    }
}
