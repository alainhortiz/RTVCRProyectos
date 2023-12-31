<?php

namespace AppBundle\Repository;

use AppBundle\Entity\Banco;

/**
 * BancoRepository
 *
 * This class was generated by the Doctrine ORM. Add your own custom
 * repository methods below.
 */
class BancoRepository extends \Doctrine\ORM\EntityRepository
{
    public function agregarBanco($data)
    {
        try{
            $em = $this->getEntityManager();
            $banco = new Banco();
            $banco->setNombre($data['nombre']);

            $em->persist($banco);
            $em->flush();
            $msg = $banco;

        }catch (\Exception $e)
        {
            if(strpos($e->getMessage() , 'Duplicate entry') > 0)
            {
                $msg = 'El banco ya existe, no se puede agregar';
            }
            else
            {
                $msg = 'Se produjo un error al insertar el banco';
            }
        }
        return $msg;
    }

    public function modificarBanco($data)
    {
        try
        {
            $em = $this->getEntityManager();
            $banco = $em->getRepository('AppBundle:Banco')->find($data['idBanco']);

            if (!empty($banco)) {
                $banco->setNombre($data['nombre']);
                $em->flush();
                $msg = $banco;
            } else {
                $msg = $banco;
            }

        }catch (\Exception $e)
        {
            $msg = 'Se produjo un error al modificar el banco';
        }

        return $msg;
    }

    public function eliminarBanco($id)
    {
        try
        {
            $em = $this->getEntityManager();
            $banco = $em->getRepository('AppBundle:Banco')->find($id);

            if (!empty($banco)) {
                $em->remove($banco);
                $em->flush();
                $msg = $banco;
            } else {
                $msg = $banco;
            }

        } catch (\Exception $e) {

            if (strpos($e->getMessage(), 'foreign key') > 0) {
                $msg = 'Existen personas TCP asociadas a este banco, no se puede eliminar';
            } else {
                $msg = 'Se produjo un error al eliminar el banco';
            }
        }
        return $msg;
    }

}
