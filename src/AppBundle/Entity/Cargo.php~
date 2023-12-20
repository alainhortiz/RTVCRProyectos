<?php

namespace AppBundle\Entity;

use Doctrine\Common\Collections\ArrayCollection;
use Doctrine\ORM\Mapping as ORM;

/**
 * Cargo
 *
 * @ORM\Table(name="cargo")
 * @ORM\Entity(repositoryClass="AppBundle\Repository\CargoRepository")
 */
class Cargo
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
     * @ORM\Column(name="funcion", type="text", nullable=true)
     */
    private $funcion;

    /**
     * @var bool
     *
     * @ORM\Column(name="isServicio", type="boolean",nullable=true)
     */
    private $isServicio = false;

    /**
     * @ORM\ManyToOne(targetEntity="TipoContrato",inversedBy="cargos")
     */
    protected $tipoContrato;

    /**
     * @ORM\OneToMany(targetEntity="ProyectoPersonaCargo", mappedBy="cargo")
     */
    private $proyectosPersonasCargos;

    /**
     * @ORM\OneToMany(targetEntity="ProyectoEmpresaCargo", mappedBy="cargo")
     */
    private $proyectosEmpresasCargos;


    /**
     * Constructor.
     */
    public function __construct()
    {
        $this->proyectosEmpresasCargos = new ArrayCollection();
        $this->empresas = new ArrayCollection();
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
     * @return Cargo
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
     * Add proyectosPersonasCargo
     *
     * @param \AppBundle\Entity\ProyectoPersonaCargo $proyectosPersonasCargo
     *
     * @return Cargo
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
     * Set isServicio
     *
     * @param boolean $isServicio
     *
     * @return Cargo
     */
    public function setIsServicio($isServicio)
    {
        $this->isServicio = $isServicio;

        return $this;
    }

    /**
     * Get isServicio
     *
     * @return boolean
     */
    public function getIsServicio()
    {
        return $this->isServicio;
    }


    /**
     * Set tipoContrato
     *
     * @param \AppBundle\Entity\TipoContrato $tipoContrato
     *
     * @return Cargo
     */
    public function setTipoContrato(\AppBundle\Entity\TipoContrato $tipoContrato = null)
    {
        $this->tipoContrato = $tipoContrato;

        return $this;
    }

    /**
     * Get tipoContrato
     *
     * @return \AppBundle\Entity\TipoContrato
     */
    public function getTipoContrato()
    {
        return $this->tipoContrato;
    }

    /**
     * Set funcion
     *
     * @param string $funcion
     *
     * @return Cargo
     */
    public function setFuncion($funcion)
    {
        $this->funcion = $funcion;

        return $this;
    }

    /**
     * Get funcion
     *
     * @return string
     */
    public function getFuncion()
    {
        return $this->funcion;
    }

    /**
     * Add proyectosEmpresasCargo
     *
     * @param \AppBundle\Entity\ProyectoEmpresaCargo $proyectosEmpresasCargo
     *
     * @return Cargo
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
     * Add empresa
     *
     * @param \AppBundle\Entity\Empresa $empresa
     *
     * @return Cargo
     */
    public function addEmpresa(\AppBundle\Entity\Empresa $empresa)
    {
        $this->empresas[] = $empresa;

        return $this;
    }

    /**
     * Remove empresa
     *
     * @param \AppBundle\Entity\Empresa $empresa
     */
    public function removeEmpresa(\AppBundle\Entity\Empresa $empresa)
    {
        $this->empresas->removeElement($empresa);
    }

    /**
     * Get empresas
     *
     * @return \Doctrine\Common\Collections\Collection
     */
    public function getEmpresas()
    {
        return $this->empresas;
    }
}
