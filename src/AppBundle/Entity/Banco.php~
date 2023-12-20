<?php

namespace AppBundle\Entity;

use Doctrine\Common\Collections\ArrayCollection;
use Doctrine\ORM\Mapping as ORM;

/**
 * Banco
 *
 * @ORM\Table(name="banco")
 * @ORM\Entity(repositoryClass="AppBundle\Repository\BancoRepository")
 */
class Banco
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
     * @ORM\OneToMany(targetEntity="Persona", mappedBy="banco")
     */
    private $personas;

    /**
     * @ORM\OneToMany(targetEntity="Empresa", mappedBy="banco")
     */
    private $bancoCUP;

    /**
     * @ORM\OneToMany(targetEntity="Empresa", mappedBy="banco")
     */
    private $bancoCUC;

    /**
     * Constructor.
     */
    public function __construct()
    {
        $this->personas = new ArrayCollection();
        $this->bancoCUP = new ArrayCollection();
        $this->bancoCUC = new ArrayCollection();
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
     * @return Banco
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
     * Add persona
     *
     * @param \AppBundle\Entity\Persona $persona
     *
     * @return Banco
     */
    public function addPersona(\AppBundle\Entity\Persona $persona)
    {
        $this->personas[] = $persona;

        return $this;
    }

    /**
     * Remove persona
     *
     * @param \AppBundle\Entity\Persona $persona
     */
    public function removePersona(\AppBundle\Entity\Persona $persona)
    {
        $this->personas->removeElement($persona);
    }

    /**
     * Get personas
     *
     * @return \Doctrine\Common\Collections\Collection
     */
    public function getPersonas()
    {
        return $this->personas;
    }

    /**
     * Add bancoCUP
     *
     * @param \AppBundle\Entity\Empresa $bancoCUP
     *
     * @return Banco
     */
    public function addBancoCUP(\AppBundle\Entity\Empresa $bancoCUP)
    {
        $this->bancoCUP[] = $bancoCUP;

        return $this;
    }

    /**
     * Remove bancoCUP
     *
     * @param \AppBundle\Entity\Empresa $bancoCUP
     */
    public function removeBancoCUP(\AppBundle\Entity\Empresa $bancoCUP)
    {
        $this->bancoCUP->removeElement($bancoCUP);
    }

    /**
     * Get bancoCUP
     *
     * @return \Doctrine\Common\Collections\Collection
     */
    public function getBancoCUP()
    {
        return $this->bancoCUP;
    }

    /**
     * Add bancoCUC
     *
     * @param \AppBundle\Entity\Empresa $bancoCUC
     *
     * @return Banco
     */
    public function addBancoCUC(\AppBundle\Entity\Empresa $bancoCUC)
    {
        $this->bancoCUC[] = $bancoCUC;

        return $this;
    }

    /**
     * Remove bancoCUC
     *
     * @param \AppBundle\Entity\Empresa $bancoCUC
     */
    public function removeBancoCUC(\AppBundle\Entity\Empresa $bancoCUC)
    {
        $this->bancoCUC->removeElement($bancoCUC);
    }

    /**
     * Get bancoCUC
     *
     * @return \Doctrine\Common\Collections\Collection
     */
    public function getBancoCUC()
    {
        return $this->bancoCUC;
    }
}
