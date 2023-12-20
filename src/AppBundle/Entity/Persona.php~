<?php

namespace AppBundle\Entity;

use Doctrine\Common\Collections\ArrayCollection;
use Doctrine\ORM\Mapping as ORM;

/**
 * Persona
 *
 * @ORM\Table(name="persona")
 * @ORM\Entity(repositoryClass="AppBundle\Repository\PersonaRepository")
 * @ORM\HasLifecycleCallbacks()
 */
class Persona
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
     * @ORM\Column(name="carnetIdentidad", type="string", length=11, nullable=false, unique=true)
     */
    private $carnetIdentidad;

    /**
     * @var bool
     *
     * @ORM\Column(name="isNIT", type="boolean",nullable=true)
     */
    private $isNIT = false;

    /**
     * @var bool
     *
     * @ORM\Column(name="isTCP", type="boolean",nullable=true)
     */
    private $isTCP = false;

    /**
     * @var bool
     *
     * @ORM\Column(name="isPA", type="boolean",nullable=true)
     */
    private $isPA = false;

    /**
     * @var string
     *
     * @ORM\Column(name="nombre", type="string", length=100, nullable=false)
     */
    private $nombre;

    /**
     * @var string
     *
     * @ORM\Column(name="primerApellido", type="string", length=100, nullable=false)
     */
    private $primerApellido;

    /**
     * @var string
     *
     * @ORM\Column(name="segundoApellido", type="string", length=100, nullable=false)
     */
    private $segundoApellido;

    /**
     * @var string
     *
     * @ORM\Column(name="alias", type="string", length=150, nullable=true)
     */
    private $alias;

    /**
     * @var string
     *
     * @ORM\Column(name="noRegistroCreador", type="string", length=50, nullable=true)
     */
    private $noRegistroCreador;

    /**
     * @var string
     *
     * @ORM\Column(name="noLicencia", type="string", length=50, nullable=true)
     */
    private $noLicencia;

    /**
     * @var string
     *
     * @ORM\Column(name="titulo_licencia", type="string", length=255, nullable=true)
     */
    private $titulo_licencia;

    /**
     * @var string
     *
     * @ORM\Column(name="noCuentaCUP", type="string", length=50, nullable=true)
     */
    private $noCuentaCUP;

    /**
     * @var string
     *
     * @ORM\Column(name="noCuentaCUC", type="string", length=50, nullable=true)
     */
    private $noCuentaCUC;

    /**
     * @var string
     *
     * @ORM\Column(name="noSucursal", type="string", length=50, nullable=true)
     */
    private $noSucursal;

    /**
     * @var string
     *
     * @ORM\Column(name="noLicenciaSanitaria", type="string", length=50, nullable=true)
     */
    private $noLicenciaSanitaria;

    /**
     * @var string
     *
     * @ORM\Column(name="direccion", type="string", length=255, nullable=false)
     */
    private $direccion;

    /**
     * @var string
     *
     * @ORM\Column(name="telefono", type="string", length=50, nullable=true)
     */
    private $telefono;

    /**
     * @var string
     *
     * @ORM\Column(name="fonNombre", type="string", length=100)
     */
    private $fonNombre;

    /**
     * @var string
     *
     * @ORM\Column(name="fonPrimerApellido", type="string", length=100)
     */
    private $fonPrimerApellido;

    /**
     * @var string
     *
     * @ORM\Column(name="fonSegundoApellido", type="string", length=100)
     */
    private $fonSegundoApellido;

    /**
     * @var string
     *
     * @ORM\Column(name="fonAlias", type="string", length=100, nullable=true)
     */
    private $fonAlias;

    /**
     * @ORM\ManyToOne(targetEntity="Sexo",inversedBy="personas")
     */
    protected $sexo;

    /**
     * @ORM\ManyToOne(targetEntity="Profesion",inversedBy="personas")
     */
    protected $profesion;

    /**
     * @ORM\ManyToOne(targetEntity="Banco",inversedBy="personas")
     */
    protected $banco;

    /**
     * @ORM\ManyToOne(targetEntity="Ciudadania",inversedBy="personas")
     */
    protected $ciudadania;

    /**
     * @ORM\OneToMany(targetEntity="ProyectoPersonaCargo", mappedBy="persona")
     */
    private $proyectosPersonasCargos;

    /**
     * @ORM\ManyToMany(targetEntity="Cargo")
     * @ORM\JoinTable(name="persona_cargo",
     *     joinColumns={@ORM\JoinColumn(name="persona_id", referencedColumnName="id")},
     *     inverseJoinColumns={@ORM\JoinColumn(name="cargo_id", referencedColumnName="id")}
     * )
     */
    private $personaCargos;

    /**
     * @ORM\ManyToMany(targetEntity="Cargo")
     * @ORM\JoinTable(name="persona_servicio",
     *     joinColumns={@ORM\JoinColumn(name="persona_id", referencedColumnName="id")},
     *     inverseJoinColumns={@ORM\JoinColumn(name="servicio_id", referencedColumnName="id")}
     * )
     */
    private $personaServicios;

    /**
     * Constructor.
     */
    public function __construct()
    {
        $this->proyectosPersonasCargos = new ArrayCollection();
        $this->personaCargos = new ArrayCollection();
        $this->personaServicios = new ArrayCollection();
    }

    /**
     * Get id
     *
     * @return integer
     */
    public function getId()
    {
        return $this->id;
    }

    /**
     * Set carnetIdentidad
     *
     * @param string $carnetIdentidad
     *
     * @return Persona
     */
    public function setCarnetIdentidad($carnetIdentidad)
    {
        $this->carnetIdentidad = $carnetIdentidad;

        return $this;
    }

    /**
     * Get carnetIdentidad
     *
     * @return string
     */
    public function getCarnetIdentidad()
    {
        return $this->carnetIdentidad;
    }

    /**
     * Set nombre
     *
     * @param string $nombre
     *
     * @return Persona
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
     * Set primerApellido
     *
     * @param string $primerApellido
     *
     * @return Persona
     */
    public function setPrimerApellido($primerApellido)
    {
        $this->primerApellido = $primerApellido;

        return $this;
    }

    /**
     * Get primerApellido
     *
     * @return string
     */
    public function getPrimerApellido()
    {
        return $this->primerApellido;
    }

    /**
     * Set segundoApellido
     *
     * @param string $segundoApellido
     *
     * @return Persona
     */
    public function setSegundoApellido($segundoApellido)
    {
        $this->segundoApellido = $segundoApellido;

        return $this;
    }

    /**
     * Get segundoApellido
     *
     * @return string
     */
    public function getSegundoApellido()
    {
        return $this->segundoApellido;
    }

    /**
     * Set alias
     *
     * @param string $alias
     *
     * @return Persona
     */
    public function setAlias($alias)
    {
        $this->alias = $alias;

        return $this;
    }

    /**
     * Get alias
     *
     * @return string
     */
    public function getAlias()
    {
        return $this->alias;
    }

    /**
     * Set direccion
     *
     * @param string $direccion
     *
     * @return Persona
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
     * Set telefono
     *
     * @param string $telefono
     *
     * @return Persona
     */
    public function setTelefono($telefono)
    {
        $this->telefono = $telefono;

        return $this;
    }

    /**
     * Get telefono
     *
     * @return string
     */
    public function getTelefono()
    {
        return $this->telefono;
    }

    /**
     * Set fonNombre
     *
     * @param string $fonNombre
     *
     * @return Persona
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
     * Set fonPrimerApellido
     *
     * @param string $fonPrimerApellido
     *
     * @return Persona
     */
    public function setFonPrimerApellido($fonPrimerApellido)
    {
        $this->fonPrimerApellido = $fonPrimerApellido;

        return $this;
    }

    /**
     * Get fonPrimerApellido
     *
     * @return string
     */
    public function getFonPrimerApellido()
    {
        return $this->fonPrimerApellido;
    }

    /**
     * Set fonSegundoApellido
     *
     * @param string $fonSegundoApellido
     *
     * @return Persona
     */
    public function setFonSegundoApellido($fonSegundoApellido)
    {
        $this->fonSegundoApellido = $fonSegundoApellido;

        return $this;
    }

    /**
     * Get fonSegundoApellido
     *
     * @return string
     */
    public function getFonSegundoApellido()
    {
        return $this->fonSegundoApellido;
    }

    /**
     * Set fonAlias
     *
     * @param string $fonAlias
     *
     * @return Persona
     */
    public function setFonAlias($fonAlias)
    {
        $this->fonAlias = $fonAlias;

        return $this;
    }

    /**
     * Get fonAlias
     *
     * @return string
     */
    public function getFonAlias()
    {
        return $this->fonAlias;
    }

    /**
     * Set sexo
     *
     * @param \AppBundle\Entity\Sexo $sexo
     *
     * @return Persona
     */
    public function setSexo(\AppBundle\Entity\Sexo $sexo = null)
    {
        $this->sexo = $sexo;

        return $this;
    }

    /**
     * Get sexo
     *
     * @return \AppBundle\Entity\Sexo
     */
    public function getSexo()
    {
        return $this->sexo;
    }

    /**
     * Add proyectosPersonasCargo
     *
     * @param \AppBundle\Entity\ProyectoPersonaCargo $proyectosPersonasCargo
     *
     * @return Persona
     */
    public function addProyectosPersonasCargo(\AppBundle\Entity\ProyectoPersonaCargo $proyectosPersonasCargo)
    {
        $this->proyectosPersonasCargos[] = $proyectosPersonasCargo;

        return $this;
    }

    /**
     * Remove proyectosPersonasCargo
     *
     * @param \AppBundle\Entity\ProyectoPersonaCargo $proyectosPersonasCargo
     */
    public function removeProyectosPersonasCargo(\AppBundle\Entity\ProyectoPersonaCargo $proyectosPersonasCargo)
    {
        $this->proyectosPersonasCargos->removeElement($proyectosPersonasCargo);
    }

    /**
     * Get proyectosPersonasCargos
     *
     * @return \Doctrine\Common\Collections\Collection
     */
    public function getProyectosPersonasCargos()
    {
        return $this->proyectosPersonasCargos;
    }

    /**
     * @ORM\PrePersist
     * @ORM\PreUpdate
     */
    public function setFonNombreValue()
    {
        $this->fonNombre = metaphone($this->nombre,5);
    }

    /**
     * @ORM\PrePersist
     * @ORM\PreUpdate
     */
    public function setFonPrimerApellidoValue()
    {
        $this->fonPrimerApellido = metaphone($this->primerApellido,5);
    }

    /**
     * @ORM\PrePersist
     * @ORM\PreUpdate
     */
    public function setFonSegundoApellidoValue()
    {
        $this->fonSegundoApellido = metaphone($this->segundoApellido,5);
    }

    /**
     * @ORM\PrePersist
     * @ORM\PreUpdate
     */
    public function setFonAliasValue()
    {
        $this->fonAlias = metaphone($this->alias,5);
    }

    /**
     * Get nombreCompleto
     *
     * @return string
     */
    public function nombreCompleto()
    {
        return $this->getNombre() . ' ' . $this->getPrimerApellido() . ' ' . $this->getSegundoApellido();
    }

    /**
     * Set profesion
     *
     * @param \AppBundle\Entity\Profesion $profesion
     *
     * @return Persona
     */
    public function setProfesion(\AppBundle\Entity\Profesion $profesion = null)
    {
        $this->profesion = $profesion;

        return $this;
    }

    /**
     * Get profesion
     *
     * @return \AppBundle\Entity\Profesion
     */
    public function getProfesion()
    {
        return $this->profesion;
    }

    /**
     * Set ciudadania
     *
     * @param \AppBundle\Entity\Ciudadania $ciudadania
     *
     * @return Persona
     */
    public function setCiudadania(\AppBundle\Entity\Ciudadania $ciudadania = null)
    {
        $this->ciudadania = $ciudadania;

        return $this;
    }

    /**
     * Get ciudadania
     *
     * @return \AppBundle\Entity\Ciudadania
     */
    public function getCiudadania()
    {
        return $this->ciudadania;
    }

    /**
     * Add personaCargo
     *
     * @param \AppBundle\Entity\Cargo $personaCargo
     *
     * @return Persona
     */
    public function addPersonaCargo(\AppBundle\Entity\Cargo $personaCargo)
    {
        $this->personaCargos[] = $personaCargo;

        return $this;
    }

    /**
     * Remove personaCargo
     *
     * @param \AppBundle\Entity\Cargo $personaCargo
     */
    public function removePersonaCargo(\AppBundle\Entity\Cargo $personaCargo)
    {
        $this->personaCargos->removeElement($personaCargo);
    }

    /**
     * Get personaCargos
     *
     * @return \Doctrine\Common\Collections\Collection
     */
    public function getPersonaCargos()
    {
        return $this->personaCargos;
    }

    public function setPersonaCargos($cargos)
    {
        $this->personaCargos = $cargos;
    }

    /**
     * Set isNIT
     *
     * @param boolean $isNIT
     *
     * @return Persona
     */
    public function setIsNIT($isNIT)
    {
        $this->isNIT = $isNIT;

        return $this;
    }

    /**
     * Get isNIT
     *
     * @return boolean
     */
    public function getIsNIT()
    {
        return $this->isNIT;
    }

    /**
     * Set noRegistroCreador
     *
     * @param string $noRegistroCreador
     *
     * @return Persona
     */
    public function setNoRegistroCreador($noRegistroCreador)
    {
        $this->noRegistroCreador = $noRegistroCreador;

        return $this;
    }

    /**
     * Get noRegistroCreador
     *
     * @return string
     */
    public function getNoRegistroCreador()
    {
        return $this->noRegistroCreador;
    }

    /**
     * Add personaServicio
     *
     * @param \AppBundle\Entity\Cargo $personaServicio
     *
     * @return Persona
     */
    public function addPersonaServicio(\AppBundle\Entity\Cargo $personaServicio)
    {
        $this->personaServicios[] = $personaServicio;

        return $this;
    }

    /**
     * Remove personaServicio
     *
     * @param \AppBundle\Entity\Cargo $personaServicio
     */
    public function removePersonaServicio(\AppBundle\Entity\Cargo $personaServicio)
    {
        $this->personaServicios->removeElement($personaServicio);
    }

    /**
     * Get personaServicios
     *
     * @return \Doctrine\Common\Collections\Collection
     */
    public function getPersonaServicios()
    {
        return $this->personaServicios;
    }

    public function setPersonaServicios($cargos)
    {
        $this->personaServicios = $cargos;
    }

    /**
     * Set noLicencia
     *
     * @param string $noLicencia
     *
     * @return Persona
     */
    public function setNoLicencia($noLicencia)
    {
        $this->noLicencia = $noLicencia;

        return $this;
    }

    /**
     * Get noLicencia
     *
     * @return string
     */
    public function getNoLicencia()
    {
        return $this->noLicencia;
    }

    /**
     * Set isTCP
     *
     * @param boolean $isTCP
     *
     * @return Persona
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
     * @return Persona
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

    public function cantidadContrataciones()
    {
        return count($this->proyectosPersonasCargos);
    }


    /**
     * Set tituloLicencia
     *
     * @param string $tituloLicencia
     *
     * @return Persona
     */
    public function setTituloLicencia($tituloLicencia)
    {
        $this->titulo_licencia = $tituloLicencia;

        return $this;
    }

    /**
     * Get tituloLicencia
     *
     * @return string
     */
    public function getTituloLicencia()
    {
        return $this->titulo_licencia;
    }

    /**
     * Set noCuentaCUP
     *
     * @param string $noCuentaCUP
     *
     * @return Persona
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
     * Set noCuentaCUC
     *
     * @param string $noCuentaCUC
     *
     * @return Persona
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
     * Set noSucursal
     *
     * @param string $noSucursal
     *
     * @return Persona
     */
    public function setNoSucursal($noSucursal)
    {
        $this->noSucursal = $noSucursal;

        return $this;
    }

    /**
     * Get noSucursal
     *
     * @return string
     */
    public function getNoSucursal()
    {
        return $this->noSucursal;
    }

    /**
     * Set noLicenciaSanitaria
     *
     * @param string $noLicenciaSanitaria
     *
     * @return Persona
     */
    public function setNoLicenciaSanitaria($noLicenciaSanitaria)
    {
        $this->noLicenciaSanitaria = $noLicenciaSanitaria;

        return $this;
    }

    /**
     * Get noLicenciaSanitaria
     *
     * @return string
     */
    public function getNoLicenciaSanitaria()
    {
        return $this->noLicenciaSanitaria;
    }

    /**
     * Set banco
     *
     * @param \AppBundle\Entity\Banco $banco
     *
     * @return Persona
     */
    public function setBanco(\AppBundle\Entity\Banco $banco = null)
    {
        $this->banco = $banco;

        return $this;
    }

    /**
     * Get banco
     *
     * @return \AppBundle\Entity\Banco
     */
    public function getBanco()
    {
        return $this->banco;
    }
}
