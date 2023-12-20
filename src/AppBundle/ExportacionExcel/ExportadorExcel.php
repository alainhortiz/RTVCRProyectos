<?php

namespace AppBundle\ExportacionExcel;


use PhpOffice\PhpSpreadsheet\Cell\DataType;
use PhpOffice\PhpSpreadsheet\Spreadsheet;
use PhpOffice\PhpSpreadsheet\Style\Borders;
use PhpOffice\PhpSpreadsheet\Style\Fill;
use PhpOffice\PhpSpreadsheet\Style\Border;
use PhpOffice\PhpSpreadsheet\Style\Alignment;
use PhpOffice\PhpSpreadsheet\Style\NumberFormat;
use PhpOffice\PhpSpreadsheet\Writer\Xlsx;


class ExportadorExcel
{

    public function exportarProyecto($username, $titulo, $mes, $year, $proyecto, $datosContratados)
    {
        $objPHPExcel = new Spreadsheet();

        $objPHPExcel->getProperties()
            ->setCreator($username)
            ->setLastModifiedBy($username)
            ->setTitle("Contratación")
            ->setSubject("Contratación")
            ->setDescription("Documento generado con Registro de Proyectos")
            ->setKeywords("RTV")
            ->setCategory("PROYECTOS");

        //inicio del codigo de la hoja de totales
        $activeSheet = 0;

        //titulo
        $objPHPExcel->setActiveSheetIndex($activeSheet)->setCellValue('C2', 'CONTRATACIÓN DEL PROYECTO NO. DE CONTRATO '. $proyecto->getNoContratoCanal() . '  "' . strtoupper($titulo) . '" ' . $mes . '.' . $year);

        //Encabezados
        $objPHPExcel->setActiveSheetIndex($activeSheet)->setCellValue('B4', 'No.');
        $objPHPExcel->setActiveSheetIndex($activeSheet)->setCellValue('C4', 'Nombres');
        $objPHPExcel->setActiveSheetIndex($activeSheet)->setCellValue('D4', 'CI');
        $objPHPExcel->setActiveSheetIndex($activeSheet)->setCellValue('E4', 'D/Particular');
        $objPHPExcel->setActiveSheetIndex($activeSheet)->setCellValue('F4', 'Registro del Creador');
        $objPHPExcel->setActiveSheetIndex($activeSheet)->setCellValue('G4', 'Concepto');
        $objPHPExcel->setActiveSheetIndex($activeSheet)->setCellValue('H4', 'en contrato por el cargo');
        $objPHPExcel->setActiveSheetIndex($activeSheet)->setCellValue('I4', 'otros ingresos');
        $objPHPExcel->setActiveSheetIndex($activeSheet)->setCellValue('J4', 'total a cobrar');
        $objPHPExcel->setActiveSheetIndex($activeSheet)->setCellValue('K4', 'valor por programa');

        $objPHPExcel->getActiveSheet(0)->freezePane('E5');

        //Formato de la hoja
        $objPHPExcel->getActiveSheet()->getStyle('C2:K2')->applyFromArray($this->estiloTituloReporteVenta());
        $objPHPExcel->getActiveSheet()->getStyle('B4:K4')->applyFromArray($this->estiloEncabezadosColumnasVenta());

        for ($i = 'B'; $i <= 'K'; $i++) {
            if ($i === 'C') {
                $objPHPExcel->setActiveSheetIndex($activeSheet)->getColumnDimension($i)->setWidth(30);
            } elseif ($i === 'E') {
                $objPHPExcel->setActiveSheetIndex($activeSheet)->getColumnDimension($i)->setWidth(90);
            } elseif ($i === 'G' || $i === 'H' || $i === 'I' || $i === 'J') {
                $objPHPExcel->setActiveSheetIndex($activeSheet)->getColumnDimension($i)->setWidth(20);
            }else {
                $objPHPExcel->setActiveSheetIndex($activeSheet)->getColumnDimension($i)->setWidth(15);
            }
        }

        //Contenido
        $fila = 5;
        $centroCosto = '';

        foreach ($datosContratados as $persona) {

            $objPHPExcel->setActiveSheetIndex($activeSheet)->setCellValue('B' . $fila, $persona['noContrato']);
            $objPHPExcel->setActiveSheetIndex($activeSheet)->setCellValue('C' . $fila, $persona['nombres']);
            $objPHPExcel->setActiveSheetIndex($activeSheet)->setCellValue('D' . $fila, $persona['CI']);
            $objPHPExcel->setActiveSheetIndex($activeSheet)->setCellValue('E' . $fila, $persona['direccion']);
            $objPHPExcel->setActiveSheetIndex($activeSheet)->setCellValue('F' . $fila, $persona['registroCreador']);
            $objPHPExcel->setActiveSheetIndex($activeSheet)->setCellValue('G' . $fila, $persona['concepto']);
            $objPHPExcel->setActiveSheetIndex($activeSheet)->setCellValue('H' . $fila, $persona['porCargo']);
            $objPHPExcel->getActiveSheet()->getStyle('H' . $fila)->getNumberFormat()->setFormatCode('#,##0.00');
            $objPHPExcel->setActiveSheetIndex($activeSheet)->setCellValue('I' . $fila, $persona['otroIngreso']);
            $objPHPExcel->getActiveSheet()->getStyle('I' . $fila)->getNumberFormat()->setFormatCode('#,##0.00');
            $objPHPExcel->setActiveSheetIndex($activeSheet)->setCellValue('J' . $fila, $persona['totalCobrar']);
            $objPHPExcel->getActiveSheet()->getStyle('J' . $fila)->getNumberFormat()->setFormatCode('#,##0.00');
            $objPHPExcel->setActiveSheetIndex($activeSheet)->setCellValue('K' . $fila, $persona['valorPrograma']);
            $objPHPExcel->getActiveSheet()->getStyle('K' . $fila)->getNumberFormat()->setFormatCode('#,##0.00');
            $fila++;
        }

        $fila--;
        $objPHPExcel->getActiveSheet()->getStyle('B5:K' . $fila)->applyFromArray($this->estiloBordesVentas());
        $objPHPExcel->getActiveSheet()->getStyle('B5:B' . $fila)->applyFromArray($this->estiloCenter());
        $objPHPExcel->getActiveSheet()->getStyle('D5:D' . $fila)->applyFromArray($this->estiloCenter());
        $objPHPExcel->getActiveSheet()->getStyle('F5:F' . $fila)->applyFromArray($this->estiloCenter());


        $objPHPExcel->getActiveSheet()->setTitle('Proyecto');

        //Fin del codigo de la hoja de totales

        $objPHPExcel->setActiveSheetIndex(0);

        header('Content-type: application/vnd.openxmlformats-officedocument.spreadsheetml.sheet');
        header('Content-Disposition: attachment; filename="Proyecto No.' . $proyecto->getNoContratoCanal() . '.xlsx"');
        header('Cache-Control: max-age=0');
        $writer = new Xlsx($objPHPExcel);
        $writer->save('php://output');

        exit;

    }

    public function exportarPrenominaReporte($username, $titulo, $mes, $year, $reporte, $datosTrabajaron)
    {
        $objPHPExcel = new Spreadsheet();

        $objPHPExcel->getProperties()
            ->setCreator($username)
            ->setLastModifiedBy($username)
            ->setTitle("Prenomina y Reporte de pago")
            ->setSubject("Prenomina y Reporte de pago")
            ->setDescription("Documento generado con Registro de Proyectos")
            ->setKeywords("RTV")
            ->setCategory("REPORTES");

        //inicio del codigo de la hoja de totales
        $activeSheet = 0;

        //titulo
        $objPHPExcel->setActiveSheetIndex($activeSheet)->setCellValue('C2', 'PRENOMINA Y REPORTE NO. '. $reporte->getNoReporte() . ' DE PAGO "' . strtoupper($titulo) . '" ' . $mes . '.' . $year);

        //Encabezados
        $objPHPExcel->setActiveSheetIndex($activeSheet)->setCellValue('B4', 'Ctto No.');
        $objPHPExcel->setActiveSheetIndex($activeSheet)->setCellValue('C4', 'Nombre y Apellidos');
        $objPHPExcel->setActiveSheetIndex($activeSheet)->setCellValue('D4', 'CONCEPTO');
        $objPHPExcel->setActiveSheetIndex($activeSheet)->setCellValue('E4', 'Valor por Programa');
        $objPHPExcel->setActiveSheetIndex($activeSheet)->setCellValue('F4', 'Cantidad de Programas');
        $objPHPExcel->setActiveSheetIndex($activeSheet)->setCellValue('G4', 'Ingreso');
        $objPHPExcel->setActiveSheetIndex($activeSheet)->setCellValue('H4', '5%');
        $objPHPExcel->setActiveSheetIndex($activeSheet)->setCellValue('I4', 'A COBRAR');
        $objPHPExcel->setActiveSheetIndex($activeSheet)->setCellValue('J4', 'Carnet de Identidad');
        $objPHPExcel->setActiveSheetIndex($activeSheet)->setCellValue('K4', 'DIRECCION PARTICULAR');

        $objPHPExcel->getActiveSheet(0)->freezePane('E5');

        //Formato de la hoja
        $objPHPExcel->getActiveSheet()->getStyle('C2:K2')->applyFromArray($this->estiloTituloReporteVenta());
        $objPHPExcel->getActiveSheet()->getStyle('B4:K4')->applyFromArray($this->estiloEncabezadosColumnasVenta());

        for ($i = 'B'; $i <= 'K'; $i++) {
            if ($i === 'C' || $i === 'D') {
                $objPHPExcel->setActiveSheetIndex($activeSheet)->getColumnDimension($i)->setWidth(30);
            } elseif ($i === 'K') {
                $objPHPExcel->setActiveSheetIndex($activeSheet)->getColumnDimension($i)->setWidth(90);
            } elseif ($i === 'E' || $i === 'F' || $i === 'J') {
                $objPHPExcel->setActiveSheetIndex($activeSheet)->getColumnDimension($i)->setWidth(20);
            }else {
                $objPHPExcel->setActiveSheetIndex($activeSheet)->getColumnDimension($i)->setWidth(12);
            }
        }

        //Contenido
        $fila = 5;
        $centroCosto = '';

        foreach ($datosTrabajaron as $persona) {

            $objPHPExcel->setActiveSheetIndex($activeSheet)->setCellValue('B' . $fila, $persona['noContrato']);
            $objPHPExcel->setActiveSheetIndex($activeSheet)->setCellValue('C' . $fila, $persona['nombres']);
            $objPHPExcel->setActiveSheetIndex($activeSheet)->setCellValue('D' . $fila, $persona['concepto']);
            $objPHPExcel->setActiveSheetIndex($activeSheet)->setCellValue('E' . $fila, $persona['valorPrograma']);
            $objPHPExcel->getActiveSheet()->getStyle('E' . $fila)->getNumberFormat()->setFormatCode('#,##0.00');
            $objPHPExcel->setActiveSheetIndex($activeSheet)->setCellValue('F' . $fila, $persona['cantPrograma']);
            $objPHPExcel->setActiveSheetIndex($activeSheet)->setCellValue('G' . $fila, $persona['ingreso']);
            $objPHPExcel->getActiveSheet()->getStyle('G' . $fila)->getNumberFormat()->setFormatCode('#,##0.00');
            $objPHPExcel->setActiveSheetIndex($activeSheet)->setCellValue('H' . $fila, $persona['porciento']);
            $objPHPExcel->getActiveSheet()->getStyle('H' . $fila)->getNumberFormat()->setFormatCode('#,##0.00');
            $objPHPExcel->setActiveSheetIndex($activeSheet)->setCellValue('I' . $fila, $persona['aCobrar']);
            $objPHPExcel->getActiveSheet()->getStyle('I' . $fila)->getNumberFormat()->setFormatCode('#,##0.00');
            $objPHPExcel->setActiveSheetIndex($activeSheet)->setCellValue('J' . $fila, $persona['CI']);
            $objPHPExcel->setActiveSheetIndex($activeSheet)->setCellValue('K' . $fila, $persona['direccion']);
            $fila++;
        }

        $fila--;
        $objPHPExcel->getActiveSheet()->getStyle('B5:K' . $fila)->applyFromArray($this->estiloBordesVentas());
        $objPHPExcel->getActiveSheet()->getStyle('B5:B' . $fila)->applyFromArray($this->estiloCenter());
        $objPHPExcel->getActiveSheet()->getStyle('F5:F' . $fila)->applyFromArray($this->estiloCenter());


        $objPHPExcel->getActiveSheet()->setTitle('Reporte');

        //Fin del codigo de la hoja de totales

        $objPHPExcel->setActiveSheetIndex(0);

        header('Content-type: application/vnd.openxmlformats-officedocument.spreadsheetml.sheet');
        header('Content-Disposition: attachment; filename="Reporte No.' . $reporte->getNoReporte() . '.xlsx"');
        header('Cache-Control: max-age=0');
        $writer = new Xlsx($objPHPExcel);
        $writer->save('php://output');

        exit;

    }

    //Estilos
    private function estiloEncabezadosColumnas()
    {
        return [
            'font' => [
                'name' => 'Arial',
                'bold' => true,
                'italic' => false,
                'strike' => false,
                'size' => 12,
                'color' => [
                    'rgb' => '#222222'
                ]
            ],
            'fill' => [
                'fillType' => Fill::FILL_GRADIENT_LINEAR,
                'startColor' => [
                    'argb' => 'FFA0A0A0',
                ],
                'endColor' => [
                    'argb' => 'FFFFFFFF',
                ],
            ],
            'borders' => [
                'allBorders' => [
                    'borderStyle' => Border::BORDER_THIN,
                ],
            ],
            'alignment' => [
                'horizontal' => Alignment::HORIZONTAL_CENTER,
                'vertical' => Alignment::VERTICAL_CENTER,
                'rotation' => 0,
                'wrap' => TRUE
            ]
        ];


    }

    private function estiloEncabezadosColumnasMenor()
    {
        return [
            'font' => [
                'name' => 'Arial',
                'bold' => true,
                'italic' => false,
                'strike' => false,
                'size' => 10,
                'color' => [
                    'rgb' => '#222222'
                ]
            ],
            'fill' => [
                'fillType' => Fill::FILL_GRADIENT_LINEAR,
                'startColor' => [
                    'argb' => 'FFA0A0A0',
                ],
                'endColor' => [
                    'argb' => 'FFFFFFFF',
                ],
            ],
            'borders' => [
                'allBorders' => [
                    'borderStyle' => Border::BORDER_THIN,
                ],
            ],
            'alignment' => [
                'horizontal' => Alignment::HORIZONTAL_CENTER,
                'vertical' => Alignment::VERTICAL_CENTER,
                'rotation' => 0,
                'wrap' => TRUE
            ]
        ];


    }

    private function estiloCenter()
    {
        return [
            'alignment' => [
                'horizontal' => Alignment::HORIZONTAL_CENTER,
                'vertical' => Alignment::VERTICAL_CENTER,
                'rotation' => 0,
                'wrap' => TRUE
            ]
        ];


    }

    private function estiloNegritas()
    {
        return [
            'font' => [
                'name' => 'Arial',
                'bold' => true,
                'italic' => false,
                'strike' => false,
                'size' => 12,
                'color' => [
                    'rgb' => '#222222'
                ]
            ]
        ];


    }

    private function estiloNegritasPlan()
    {
        return [
            'font' => [
                'bold' => true,
                'color' => [
                    'rgb' => '#222222'
                ]
            ]
        ];


    }

    private function estiloColorFontRed()
    {
        return [
            'font' => [
                'bold' => false,
                'color' => [
                    'rgb' => '#222222'
                ]
            ]
        ];


    }

    private function estiloTituloReporte()
    {
        return array(
            'font' => array(
                'name' => 'Verdana',
                'bold' => true,
                'italic' => false,
                'strike' => false,
                'size' => 12,
                'color' => array(
                    'rgb' => '111111'
                )
            ),
            'fill' => array(
                'type' => Fill::FILL_SOLID,
                'color' => array(
                    'rgb' => '#e95e25')
            ),
            'borders' => array(
                'allborders' => array(
                    'style' => Border::BORDER_MEDIUM,
                    'color' => array('argb' => '000000')
                )
            ),
            'alignment' => array(
                'horizontal' => Alignment::HORIZONTAL_CENTER_CONTINUOUS,
                'vertical' => Alignment::VERTICAL_CENTER,
                'rotation' => 0,
                'wrap' => TRUE
            )
        );
    }

    private function estiloTituloReporteVenta()
    {
        return array(
            'font' => array(
                'name' => 'Century Gothic',
                'bold' => true,
                'italic' => false,
                'strike' => false,
                'size' => 10,
                'color' => array(
                    'rgb' => '111111'
                )
            ),
            'fill' => array(
                'type' => Fill::FILL_SOLID,
                'color' => array(
                    'rgb' => '#ffffff')
            ),
            'borders' => array(
                'allborders' => array(
                    'style' => Border::BORDER_MEDIUM,
                    'color' => array('argb' => '000000')
                )
            ),
            'alignment' => array(
                'horizontal' => Alignment::HORIZONTAL_CENTER_CONTINUOUS,
                'vertical' => Alignment::VERTICAL_CENTER,
                'rotation' => 0,
                'wrap' => TRUE
            )
        );
    }

    private function estiloEncabezadosColumnasVenta()
    {
        return [
            'font' => [
                'name' => 'Century Gothic',
                'bold' => true,
                'italic' => false,
                'strike' => false,
                'size' => 8,
                'color' => [
                    'rgb' => '#222222'
                ]
            ],
            'borders' => [
                'allBorders' => [
                    'borderStyle' => Border::BORDER_THIN,
                ],
            ],
            'alignment' => [
                'horizontal' => Alignment::HORIZONTAL_CENTER,
                'vertical' => Alignment::VERTICAL_CENTER,
                'rotation' => 0,
                'wrap' => TRUE
            ]
        ];


    }

    private function estiloDatos()
    {
        return [
            'font' => [
                'name' => 'Arial',
                'bold' => false,
                'italic' => false,
                'strike' => false,
                'size' => 12,
                'color' => [
                    'rgb' => '#222222'
                ]
            ],
            'borders' => [
                'allBorders' => [
                    'borderStyle' => Border::BORDER_THIN,
                ],
            ],
            'alignment' => [
                'horizontal' => Alignment::HORIZONTAL_CENTER,
                'vertical' => Alignment::VERTICAL_CENTER,
                'rotation' => 0,
                'wrap' => TRUE
            ]
        ];
    }

    private function estiloDatosPlan()
    {
        return [
            'font' => [
                'name' => 'Century Gothic',
                'bold' => false,
                'italic' => false,
                'strike' => false,
                'size' => 10,
                'color' => [
                    'rgb' => '#222222'
                ]
            ]
        ];
    }

    private function estiloBordes()
    {
        return [
            'font' => [
                'name' => 'Arial',
                'size' => 10,
                'color' => [
                    'rgb' => '#222222'
                ]
            ],
            'borders' => [
                'allBorders' => [
                    'borderStyle' => Border::BORDER_THIN,
                ],
            ]
        ];
    }

    private function estiloBordesVentas()
    {
        return [
            'font' => [
                'name' => 'Century Gothic',
                'size' => 8,
                'color' => [
                    'rgb' => '#222222'
                ]
            ],
            'borders' => [
                'allBorders' => [
                    'borderStyle' => Border::BORDER_THIN,
                ],
            ]
        ];
    }


}