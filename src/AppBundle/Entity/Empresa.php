<?php

namespace AppBundle\Entity;

use Doctrine\Common\Collections\ArrayCollection;
use Doctrine\ORM\Mapping as ORM;

/**
 * Empresa
 *
 * @ORM\Table(name="empresa")
 * @ORM\Entity(repositoryClass="AppBundle\Repository\EmpresaRepository")
 * @ORM\HasLifecycleCallbacks()
 */
class Empresa
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
     * @ORM\Column(name="nombre", type="string", length=150, nullable=false, unique=true)
     */
    private $nombre;

    /**
     * @var string
     *
     * @ORM\Column(name="nit", type="string", length=50, nullable=true)
     */
    private $nit;

    /**
     * @var string
     *
     * @ORM\Column(name="noAutorizadaResolucion", type="string", length=10, nullable=true)
     */
    private $noAutorizadaResolucion;

    /**
     * @var DateTime
     *
     * @ORM\Column(name="fechaNoAutorizadaResolucion", type="date")
     */
    private $fechaNoAutorizadaResolucion;

    /**
     * @var string
     *
     * @ORM\Column(name="cargoNoAutorizadaResolucion", type="string", length=50, nullable=true)
     */
    private $cargoNoAutorizadaResolucion;

    /**
     * @var string
     *
     * @ORM\Column(name="noConstituidaResolucion", type="string", length=10, nullable=true)
     */
    private $noConstituidaResolucion;

    /**
     * @var DateTime
     *
     * @ORM\Column(name="fechaNoConstituidaResolucion", type="date")
     */
    private $fechaNoConstituidaResolucion;

    /**
     * @var string
     *
     * @ORM\Column(name="cargoNoConstituidaResolucion", type="string", length=50, nullable=true)
     */
    private $cargoNoConstituidaResolucion;

    /**
     * @var string
     *
     * @ORM\Column(name="direccion", type="string", length=255, nullable=false)
     */
    private $direccion;

    /**
     * @var string
     *
     * @ORM\Column(name="noCuentaCUP", type="string", length=50, nullable=true)
     */
    private $noCuentaCUP;

    /**
     * @var string
     *
     * @ORM\Column(name="noSucursalCUP", type="string", length=50, nullable=true)
     */
    private $noSucursalCUP;

    /**
     * @var string
     *
     * @ORM\Column(name="noCuentaCUC", type="string", length=50, nullable=true)
     */
    private $noCuentaCUC;

    /**
     * @var string
     *
     * @ORM\Column(name="noSucursalCUC", type="string", length=50, nullable=true)
     */
    private $noSucursalCUC;

    /**
     * @var string
     *
     * @ORM\Column(name="fonNombre", type="string", length=100)
     */
    private $fonNombre;

    /**
     * @ORM\ManyToOne(targetEntity="TipoEmpresa",inversedBy="empresas")
     */
    protected $tipoEmpresa;

    /**
     * @ORM\ManyToOne(targetEntity="Banco",inversedBy="empresas")
     */
    protected $bancoCUP;

    /**
     * @ORM\ManyToOne(targetEntity="Banco",inversedBy="empresas")
     */
    protected $bancoCUC;

    /**
     * @var string
     *
     * @ORM\Column(name="nombreRepresentante", type="string", length=100)
     */
    private $nombreRepresentante;

    /**
     * @var string
     *
     * @ORM\Column(name="cargoRepresentante", type="string", length=100)
     */
    protected $cargoRepresentante;

    /**
     * @ORM\OneToMany(targetEntity="ProyectoEmpresaCargo", mappedBy="empresa")
     */
    private $proyectosEmpresasCargos;

    /**
     * @ORM\ManyToMany(targetEntity="Cargo")
     * @ORM\JoinTable(name="empresa_cargo",
     *     joinColumns={@ORM\JoinColumn(name="empresa_id", referencedColumnName="id")},
     *     inverseJoinColumns={@ORM\JoinColumn(name="cargo_id", referencedColumnName="id")}
     * )
     */
    private $empresaCargos;

    /**
     * @ORM\ManyToMany(targetEntity="Cargo")
     * @ORM\JoinTable(name="empresa_servicio",
     *     joinColumns={@ORM\JoinColumn(name="empresa_id", referencedColumnName="id")},
     *     inverseJoinColumns={@ORM\JoinColumn(name="servicio_id", referencedColumnName="id")}
     * )
     */
    private $empresaServicios;

    /**
     * Constructor.
     */
    public function __construct()
    {
        $this->proyectosEmpresasCargos = new ArrayCollection();
        $this->empresaCargos = new ArrayCollection();
        $this->empresaServicios = new ArrayCollection();
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
     * Set nombre
     *
     * @param string $nombre
     *
     * @return Empresa
     */
    public function setNombre($nombre)
    {
        $this->nombre = $nombre;

        return $this;
    }

    /**
     * Get nombre
     *
     * @return string
     */
    public function getNombre()
    {
        return $this->nombre;
    }

    /**
     * Set fonNombre
     *
     * @param string $fonNombre
     *
     * @return Empresa
     */
    public function setFonNombre($fonNombre)
    {
        $this->fonNombre = $fonNombre;

        return $this;
    }

    /**
     * Get fonNombre
     *
     * @return string
     */
    public function getFonNombre()
    {
        return $this->fonNombre;
    }

    /**
     * Set tipoEmpresa
     *
     * @param \AppBundle\Entity\TipoEmpresa $tipoEmpresa
     *
     * @return Empresa
     */
    public function setTipoEmpresa(\AppBundle\Entity\TipoEmpresa $tipoEmpresa = null)
    {
        $this->tipoEmpresa = $tipoEmpresa;

        return $this;
    }

    /**
     * Get tipoEmpresa
     *
     * @return \AppBundle\Entity\TipoEmpresa
     */
    public function getTipoEmpresa()
    {
        return $this->tipoEmpresa;
    }

    /**
     * Add proyectosEmpresasCargo
     *
     * @param \AppBundle\Entity\ProyectoEmpresaCargo $proyectosEmpresasCargo
     *
     * @return Empresa
     */
    public function addProyectosEmpresasCargo(\AppBundle\Entity\ProyectoEmpresaCargo $proyectosEmpresasCargo)
    {
        $this->proyectosEmpresasCargos[] = $proyectosEmpresasCargo;

        return $this;
    }

    /**
     * Remove proyectosEmpresasCargo
     *
     * @param \AppBundle\Entity\ProyectoEmpresaCargo $proyectosEmpresasCargo
     */
    public function removeProyectosEmpresasCargo(\AppBundle\Entity\ProyectoEmpresaCargo $proyectosEmpresasCargo)
    {
        $this->proyectosEmpresasCargos->removeElement($proyectosEmpresasCargo);
    }

    /**
     * Get proyectosEmpresasCargos
     *
     * @return \Doctrine\Common\Collections\Collection
     */
    public function getProyectosEmpresasCargos()
    {
        return $this->proyectosEmpresasCargos;
    }

    /**
     * Add empresaCargo
     *
     * @param \AppBundle\Entity\Cargo $empresaCargo
     *
     * @return Empresa
     */
    public function addEmpresaCargo(\AppBundle\Entity\Cargo $empresaCargo)
    {
        $this->empresaCargos[] = $empresaCargo;

        return $this;
    }

    /**
     * Remove empresaCargo
     *
     * @param \AppBundle\Entity\Cargo $empresaCargo
     */
    public function removeEmpresaCargo(\AppBundle\Entity\Cargo $empresaCargo)
    {
        $this->empresaCargos->removeElement($empresaCargo);
    }

    /**
     * Get empresaCargos
     *
     * @return \Doctrine\Common\Collections\Collection
     */
    public function getEmpresaCargos()
    {
        return $this->empresaCargos;
    }

    public function setEmpresaCargos($cargos)
    {
        $this->empresaCargos = $cargos;
    }

    /**
     * Add empresaServicio
     *
     * @param \AppBundle\Entity\Cargo $empresaServicio
     *
     * @return Empresa
     */
    public function addEmpresaServicio(\AppBundle\Entity\Cargo $empresaServicio)
    {
        $this->empresaServicios[] = $empresaServicio;

        return $this;
    }

    /**
     * Remove empresaServicio
     *
     * @param \AppBundle\Entity\Cargo $empresaServicio
     */
    public function removeEmpresaServicio(\AppBundle\Entity\Cargo $empresaServicio)
    {
        $this->empresaServicios->removeElement($empresaServicio);
    }

    /**
     * Get empresaServicios
     *
     * @return \Doctrine\Common\Collections\Collection
     */
    public function getEmpresaServicios()
    {
        return $this->empresaServicios;
    }

    public function setEmpresaServicios($cargos)
    {
        $this->empresaServicios = $cargos;
    }

    /**
     * @ORM\PrePersist
     * @ORM\PreUpdate
     */
    public function setFonNombreValue()
    {
        $this->fonNombre = metaphone($this->nombre,5);
    }

    public function cantidadContrataciones()
    {
        return count($this->proyectosEmpresasCargos);
    }

    /**
     * Set nit
     *
     * @param string $nit
     *
     * @return Empresa
     */
    public function setNit($nit)
    {
        $this->nit = $nit;

        return $this;
    }

    /**
     * Get nit
     *
     * @return string
     */
    public function getNit()
    {
        return $this->nit;
    }

    /**
     * Set noAutorizadaResolucion
     *
     * @param string $noAutorizadaResolucion
     *
     * @return Empresa
     */
    public function setNoAutorizadaResolucion($noAutorizadaResolucion)
    {
        $this->noAutorizadaResolucion = $noAutorizadaResolucion;

        return $this;
    }

    /**
     * Get noAutorizadaResolucion
     *
     * @return string
     */
    public function getNoAutorizadaResolucion()
    {
        return $this->noAutorizadaResolucion;
    }

    /**
     * Set fechaNoAutorizadaResolucion
     *
     * @param \DateTime $fechaNoAutorizadaResolucion
     *
     * @return Empresa
     */
    public function setFechaNoAutorizadaResolucion($fechaNoAutorizadaResolucion)
    {
        $this->fechaNoAutorizadaResolucion = $fechaNoAutorizadaResolucion;

        return $this;
    }

    /**
     * Get fechaNoAutorizadaResolucion
     *
     * @return \DateTime
     */
    public function getFechaNoAutorizadaResolucion()
    {
        return $this->fechaNoAutorizadaResolucion;
    }

    /**
     * Set cargoNoAutorizadaResolucion
     *
     * @param string $cargoNoAutorizadaResolucion
     *
     * @return Empresa
     */
    public function setCargoNoAutorizadaResolucion($cargoNoAutorizadaResolucion)
    {
        $this->cargoNoAutorizadaResolucion = $cargoNoAutorizadaResolucion;

        return $this;
    }

    /**
     * Get cargoNoAutorizadaResolucion
     *
     * @return string
     */
    public function getCargoNoAutorizadaResolucion()
    {
        return $this->cargoNoAutorizadaResolucion;
    }

    /**
     * Set noConstituidaResolucion
     *
     * @param string $noConstituidaResolucion
     *
     * @return Empresa
     */
    public function setNoConstituidaResolucion($noConstituidaResolucion)
    {
        $this->noConstituidaResolucion = $noConstituidaResolucion;

        return $this;
    }

    /**
     * Get noConstituidaResolucion
     *
     * @return string
     */
    public function getNoConstituidaResolucion()
    {
        return $this->noConstituidaResolucion;
    }

    /**
     * Set fechaNoConstituidaResolucion
     *
     * @param \DateTime $fechaNoConstituidaResolucion
     *
     * @return Empresa
     */
    public function setFechaNoConstituidaResolucion($fechaNoConstituidaResolucion)
    {
        $this->fechaNoConstituidaResolucion = $fechaNoConstituidaResolucion;

        return $this;
    }

    /**
     * Get fechaNoConstituidaResolucion
     *
     * @return \DateTime
     */
    public function getFechaNoConstituidaResolucion()
    {
        return $this->fechaNoConstituidaResolucion;
    }

    /**
     * Set cargoNoConstituidaResolucion
     *
     * @param string $cargoNoConstituidaResolucion
     *
     * @return Empresa
     */
    public function setCargoNoConstituidaResolucion($cargoNoConstituidaResolucion)
    {
        $this->cargoNoConstituidaResolucion = $cargoNoConstituidaResolucion;

        return $this;
    }

    /**
     * Get cargoNoConstituidaResolucion
     *
     * @return string
     */
    public function getCargoNoConstituidaResolucion()
    {
        return $this->cargoNoConstituidaResolucion;
    }

    /**
     * Set direccion
     *
     * @param string $direccion
     *
     * @return Empresa
     */
    public function setDireccion($direccion)
    {
        $this->direccion = $direccion;

        return $this;
    }

    /**
     * Get direccion
     *
     * @return string
     */
    public function getDireccion()
    {
        return $this->direccion;
    }

    /**
     * Set noCuentaCUP
     *
     * @param string $noCuentaCUP
     *
     * @return Empresa
     */
    public function setNoCuentaCUP($noCuentaCUP)
    {
        $this->noCuentaCUP = $noCuentaCUP;

        return $this;
    }

    /**
     * Get noCuentaCUP
     *
     * @return string
     */
    public function getNoCuentaCUP()
    {
        return $this->noCuentaCUP;
    }

    /**
     * Set noSucursalCUP
     *
     * @param string $noSucursalCUP
     *
     * @return Empresa
     */
    public function setNoSucursalCUP($noSucursalCUP)
    {
        $this->noSucursalCUP = $noSucursalCUP;

        return $this;
    }

    /**
     * Get noSucursalCUP
     *
     * @return string
     */
    public function getNoSucursalCUP()
    {
        return $this->noSucursalCUP;
    }

    /**
     * Set noCuentaCUC
     *
     * @param string $noCuentaCUC
     *
     * @return Empresa
     */
    public function setNoCuentaCUC($noCuentaCUC)
    {
        $this->noCuentaCUC = $noCuentaCUC;

        return $this;
    }

    /**
     * Get noCuentaCUC
     *
     * @return string
     */
    public function getNoCuentaCUC()
    {
        return $this->noCuentaCUC;
    }

    /**
     * Set noSucursalCUC
     *
     * @param string $noSucursalCUC
     *
     * @return Empresa
     */
    public function setNoSucursalCUC($noSucursalCUC)
    {
        $this->noSucursalCUC = $noSucursalCUC;

        return $this;
    }

    /**
     * Get noSucursalCUC
     *
     * @return string
     */
    public function getNoSucursalCUC()
    {
        return $this->noSucursalCUC;
    }

    /**
     * Set nombreRepresentante
     *
     * @param string $nombreRepresentante
     *
     * @return Empresa
     */
    public function setNombreRepresentante($nombreRepresentante)
    {
        $this->nombreRepresentante = $nombreRepresentante;

        return $this;
    }

    /**
     * Get nombreRepresentante
     *
     * @return string
     */
    public function getNombreRepresentante()
    {
        return $this->nombreRepresentante;
    }

    /**
     * Set bancoCUP
     *
     * @param \AppBundle\Entity\Banco $bancoCUP
     *
     * @return Empresa
     */
    public function setBancoCUP(\AppBundle\Entity\Banco $bancoCUP = null)
    {
        $this->bancoCUP = $bancoCUP;

        return $this;
    }

    /**
     * Get bancoCUP
     *
     * @return \AppBundle\Entity\Banco
     */
    public function getBancoCUP()
    {
        return $this->bancoCUP;
    }

    /**
     * Set bancoCUC
     *
     * @param \AppBundle\Entity\Banco $bancoCUC
     *
     * @return Empresa
     */
    public function setBancoCUC(\AppBundle\Entity\Banco $bancoCUC = null)
    {
        $this->bancoCUC = $bancoCUC;

        return $this;
    }

    /**
     * Get bancoCUC
     *
     * @return \AppBundle\Entity\Banco
     */
    public function getBancoCUC()
    {
        return $this->bancoCUC;
    }


    /**
     * Set cargoRepresentante
     *
     * @param string $cargoRepresentante
     *
     * @return Empresa
     */
    public function setCargoRepresentante($cargoRepresentante)
    {
        $this->cargoRepresentante = $cargoRepresentante;

        return $this;
    }

    /**
     * Get cargoRepresentante
     *
     * @return string
     */
    public function getCargoRepresentante()
    {
        return $this->cargoRepresentante;
    }
}
