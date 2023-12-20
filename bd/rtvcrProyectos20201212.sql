-- MySQL dump 10.13  Distrib 5.6.23, for Win32 (x86)
--
-- Host: localhost    Database: rtvcrproyectos
-- ------------------------------------------------------
-- Server version	5.7.26

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `banco`
--

DROP TABLE IF EXISTS `banco`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `banco` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(150) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UNIQ_77DEE1D13A909126` (`nombre`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `banco`
--

LOCK TABLES `banco` WRITE;
/*!40000 ALTER TABLE `banco` DISABLE KEYS */;
INSERT INTO `banco` VALUES (4,'BANDEC'),(3,'BPA'),(2,'Metropolitano');
/*!40000 ALTER TABLE `banco` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cargo`
--

DROP TABLE IF EXISTS `cargo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cargo` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(150) COLLATE utf8_unicode_ci NOT NULL,
  `isServicio` tinyint(1) DEFAULT NULL,
  `tipo_contrato_id` int(11) DEFAULT NULL,
  `funcion` longtext COLLATE utf8_unicode_ci,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UNIQ_3BEE57713A909126` (`nombre`),
  KEY `IDX_3BEE5771458A5509` (`tipo_contrato_id`),
  CONSTRAINT `FK_3BEE5771458A5509` FOREIGN KEY (`tipo_contrato_id`) REFERENCES `tipo_contrato` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=66 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cargo`
--

LOCK TABLES `cargo` WRITE;
/*!40000 ALTER TABLE `cargo` DISABLE KEYS */;
INSERT INTO `cargo` VALUES (1,'Director General ',0,1,'El trabajo a realizar por el Contratado consistirá en la Dirección General de la obra.'),(4,'Conducción',0,4,NULL),(5,'Guionista',0,3,'El trabajo a realizar por El contratado  tenor de su especialidad será el siguiente: GUIONISTA, y como tal tendrá atribuidas las funciones propias de la producción audiovisual de conformidad con el uso y costumbre del sector, actuando en nombre y representación de RTV y siendo responsable ante éste por las obligaciones que contrae, para cuyo cumplimiento debe seguir las instrucciones que se le oriente, entre otras.'),(6,'Productor General',0,2,'El trabajo a realizar por el contratado a tenor de su especialidad será el siguiente: Producción General, tendrá atribuidas las funciones propias de la producción audiovisual de conformidad con el uso y costumbre del sector, actuando en nombre y representación de RTV y siendo responsable ante éste por las obligaciones que contrae, para cuyo cumplimiento debe seguir las instrucciones que se le orienten.'),(7,'Grabador TV',0,4,'El trabajo a realizar por El contratado a tenor de su especialidad será el siguiente: Grabación 	de sonido directo y mezcla de sonido en la etapa de GX y de Postproducción y como tal 	tendrá atribuidas las funciones propias de la producción audiovisual de conformidad con el uso 	y costumbre del sector, actuando en nombre y representación de RTV y siendo responsable ante éste por las obligaciones que contrae, para cuyo cumplimiento debe seguir las instrucciones que se le orienten.'),(8,'Editor',0,4,'El trabajo de El contratado, a tenor de su especialidad, será realizar el montaje y la edición del material para la conformación de la obra, sincronizar audio-imagen, insertar la banda sonora y realizar las correcciones que se requiera; su trabajo concluye con la aprobación por el cliente de la obra terminada, siendo responsable de la misma hasta ese momento; tendrá atribuidas las funciones propias de la producción audiovisual de conformidad con el uso y costumbre del sector, actuando en nombre y representación de RTV y siendo responsable ante éste por las obligaciones que contrae, para cuyo cumplimiento debe seguir las instrucciones que se le orienten'),(9,'Diseño 3D',0,4,NULL),(10,'Operador de Cámara',0,4,NULL),(11,'Asistente de Producción',0,9,'El trabajo a realizar por el Contratado a tenor de su especialidad será el siguiente: Asistir al Productor General en las tareas que se le asignen determinadas por la etapa de realización en la que se encuentre y como tal tendrá atribuidas las funciones propias de la producción audiovisual de conformidad con el uso y costumbre del sector, actuando en nombre y representación de RTV y siendo responsable ante éste por las obligaciones que contrae, para cuyo cumplimiento debe seguir las instrucciones que se le orienten.'),(12,'Vestuario',0,4,'El trabajo a realizar por El contratado  tenor de su especialidad será el siguiente: ejecutaá 	las acciones que oriente el Diseñador de vestuario, mantendrá la imagen durante la 	grabación, , así como los cambios que resulten necesarios en correspondencia con el guión 	aprobado; el tiempo del que dispone y la forma de organizarlo se negociará previamente con la producción, así como el estado óptimo del vestuario a utilizar; coadyuvará al 	cumplimiento del horario que se determine a fin de garantizar el desempeño de la 	especialidad, es responsable por el uso eficiente del presupuesto entregado para la adquisición de los útlies de su especialidad como tal tendrá atribuidas las funciones propias de la producción audiovisual de conformidad con el uso y costumbre del sector, actuando en nombre y representación de RTV y siendo responsable ante éste por las obligaciones que contrae, 	para 	cuyo cumplimiento debe seguir las instrucciones que se le orienten.'),(13,'Maquillaje y Peluquería',0,4,'El trabajo a realizar por El contratado  tenor de su especialidad será el siguiente: cumplir las indicaciones de la jefa de maquillaje, maquillar y peinar al   personal que 	participa en la puesta y mantener su imagen durante la grabación, el tiempo del que dispone y la forma de organizarlo se negociará previamente con la producción, coadyuvará al cumplimiento del horario que se determine a fin de garantizar el desempeño de la especialidad, como tal tendrá atribuidas las funciones propias de la producción audiovisual de conformidad con el uso y costumbre del sector, actuando en nombre y representación de RTV y siendo responsable ante éste por las obligaciones que contrae, 	para 	cuyo cumplimiento debe seguir las instrucciones que se le orienten.'),(14,'Cámara',1,5,NULL),(16,'Micrófonos',1,5,NULL),(17,'Impresión',1,5,NULL),(18,'Alimentación',1,7,NULL),(19,'Transportación',1,10,''),(20,'Alojamiento',1,5,NULL),(21,'Productor Rodaje',0,4,''),(22,'Asistente de Dirección',0,4,'El trabajo de El contratado, a tenor de su especialidad, será  asistir a la Directora en las tareas que ésta demande particularmente en cuanto a la investigación para la realización de  intercambios  con los entrevistados, atenderá todo lo relacionado con la figuración, atención al talento artístico en función de la producción de la obra, dar seguimiento al cumplimiento de las tareas, proponer soluciones ante los imprevistos;  tendrá atribuidas las funciones propias de la producción audiovisual de conformidad con el uso y costumbre del sector, actuando en nombre y representación de RTV y siendo responsable ante éste por las obligaciones que contrae, para cuyo cumplimiento debe seguir las instrucciones que se le orienten.'),(23,'Kit Iluminación',1,5,NULL),(24,'Músico',0,6,NULL),(25,'Actor',0,8,''),(26,'Ambientador',0,4,'El trabajo a realizar por el contratado a tenor de su especialidad será la ambientación de la puesta, de conformidad con lo demandado por la producción; como tal, tendrá atribuidas las funciones propias de la producción audiovisual de conformidad con el uso y costumbre del sector, actuando en nombre y representación de RTV y siendo responsable ante éste por las obligaciones que contrae, para cuyo cumplimiento debe seguir las instrucciones que se le orienten.'),(27,'Anotadora',0,4,'El trabajo a realizar por el contratado a tenor de su especialidad será dar seguimiento y tomar nota de todo lo que suceda en el desarrollo de la obra, fijar  los detalles, para dar continuidad a las secuencias,  optimizar la observación para lograr la unión lógica de las escenas, relacionadas con el vestuario, el peinado, las caracterizaciones, las posiciones, las entradas y desplazamientos de los actores,  cantidades de artículos en un determinado espacio, clima, etc, de conformidad con lo demandado por la producción;  como tal, tendrá atribuidas las funciones propias de la producción audiovisual de conformidad con el uso y costumbre del sector, actuando en nombre y representación de RTV y siendo responsable ante éste por las obligaciones que contrae, para cuyo cumplimiento debe seguir las instrucciones que se le orienten.'),(28,'Asesor Habituales',0,4,'El trabajo a realizar por el contratado a tenor de su especialidad será el siguiente: asesorar al director sobre los diferentes temas que se abordan en el programa, revisar los guiones y mantenerse actualizado sobre la política editorial de la TV, a fin de velar por su cumplimiento, tendrá atribuidas las funciones propias de la producción audiovisual de conformidad con el uso y costumbre del sector, actuando en nombre y representación de RTV y siendo responsable ante éste por las obligaciones que contrae, para cuyo cumplimiento debe seguir las instrucciones que se le orienten.'),(29,'Asesor Dramatizados',0,4,'El trabajo a realizar por el contratado a tenor de su especialidad será el siguiente: asesorar al director sobre el tratamiento de los temas en la obra, revisar los guiones prestar atención a su materialización en correspondencia con lo aprobado previamente y mantenerse actualizado sobre la política editorial de la TV, a fin de velar por su cumplimiento, alertar oportunamente, proponer soluciones, es responsable por el cierre de la obra ante quien la encargó; tendrá atribuidas las funciones propias de la producción audiovisual de conformidad con el uso y costumbre del sector, actuando en nombre y representación de RTV y siendo responsable ante éste por las obligaciones que contrae, para cuyo cumplimiento debe seguir las instrucciones que se le orienten.'),(30,'Asistente a la Producción',0,9,'El trabajo a realizar por el contratado a tenor de su especialidad será el siguiente: ASISTENTE A LA PRODUCCIÓN, poniendo al servicio de la producción de la obra un Vehículo y asumiendo dentro de sus honorarios el costo del combustible y de cualquier reparación o rotura durante la realización de la obra, además, tendrá atribuidas las funciones propias de la producción audiovisual de conformidad con el uso y costumbre del sector, actuando en nombre y representación de RTV y siendo responsable ante éste por las obligaciones que contrae, para cuyo cumplimiento debe seguir las instrucciones que se le orienten.'),(31,'Camarógrafo',0,4,'El trabajo a realizar por El contratado,  tenor de su especialidad, será operar la cámara según se demande y sin dejar de ser creativo, acatará  las indicaciones que se le brinden, procurará la calidad óptima de su trabajo y velará por la conservación de la imagen grabada, hasta su descarga exitosa, estudiará con detenimiento las acciones a realizar con vistas a evitar improvisaciones innecesarias e imprevistos y contribuirá con su esfuerzo personal al cumplimiento eficiente del  plan de gx diseñado, como tal tendrá atribuidas las funciones propias de la producción audiovisual de conformidad con el uso y costumbre del sector, actuando en nombre y representación de RTV y siendo responsable ante éste por las obligaciones que contrae, para cuyo cumplimiento debe seguir las instrucciones que se le orienten.'),(32,'Data Manager',0,4,'El trabajo a realizar por El contratado,  tenor de su especialidad, será recuperar las imágenes grabadas en la memoria de las cámaras y conservarlas hasta su entrega para el proceso de post producción, como tal tendrá atribuidas las funciones propias de la producción audiovisual de conformidad con el uso y costumbre del sector, actuando en nombre y representación de RTV y siendo responsable ante éste por las obligaciones que contrae, para cuyo cumplimiento debe seguir las instrucciones que se le orienten.'),(33,'Director de Fotografía ',0,4,'El trabajo a realizar por El contratado,  tenor de su especialidad, será organizar y dirigir la fotografía, el uso de planos y la calidad de la luz para la toma de imágenes en correspondencia con el propósito del Director, tendrá a su cargo a los operadores de cámara y a los luminotécnicos que intervienen, coordinando desde la etapa de pregx,los recursos que requiere; coadyuvará con su creatividad a la solución de imprevistos, así como, a la eficiencia del plan de gx diseñado; como tal, tendrá atribuidas las funciones propias de la producción audiovisual de conformidad con el uso y costumbre del sector, actuando en nombre y representación de RTV y siendo responsable ante éste por las obligaciones que contrae, para cuyo cumplimiento debe seguir las instrucciones que se le orienten.'),(34,'Director de Arte',0,4,'El trabajo a realizar por El contratado, a tenor de su especialidad será el siguiente: dirigir lo relacionado con su actividad en la que se incluye, ambientación escenografia, maquillaje y vestuario, lograr la armonía del equipo en relación con la producción, motivar la creatividad y proponer soluciones coherentes,, adelantarse con variantes de solución para los imprevistos, interpretar, diseñar y materializar la pretención del Director y que esta se vea reflejada en el resultado de la puesta; actuar en  correspondencia con la ejecución de las diferentes etapas de realización de la obra; tendrá atribuidas las funciones propias de la producción audiovisual de conformidad con el uso y costumbre del sector, actuando en nombre y representación de RTV y siendo responsable ante éste por las obligaciones que contrae, para cuyo cumplimiento debe seguir las instrucciones que se le orienten.'),(35,'Diseñador de Vestuario',0,4,'El trabajo a realizar por El contratado  tenor de su especialidad será el siguiente: previo estudio de los personajes , así como la intención del Director, diseñará y, garantizando el uso eficiente del presupuesto del que dispone, el vestuario a utilizar por el  personal que 	participa en la puesta, mantendrá la imagen durante la grabación, , así como los cambios que resulten necesarios en correspondencia con el guión aprobado; el tiempo del que dispone y la forma de organizarlo se negociará previamente con la producción, cuyo personal coadyuvará al cumplimiento del mismo a fin de garantizar el desempeño de la especialidad, como tal tendrá atribuidas las funciones 	propias de la producción audiovisual de conformidad con el uso y costumbre del sector, actuando en nombre y representación de RTV y siendo responsable ante éste por las obligaciones que contrae, para 	cuyo cumplimiento debe seguir las instrucciones que se le orienten.'),(36,'Diseñador Gráfico',0,4,''),(37,'Diseñador de Luces',0,4,''),(38,'Escenografo',0,4,'El trabajo a realizar por el contratado a tenor de su especialidad será el siguiente: realizar la construcción  de  la escenografía; como tal tendrá atribuidas las funciones propias de la producción audiovisual de conformidad con el uso y costumbre del sector, actuando en nombre y representación de RTV y siendo responsable ante éste por las obligaciones que contrae, para cuyo cumplimiento debe seguir las instrucciones que se le orienten. '),(39,'Montador Escenografico',0,4,'El trabajo a realizar por el contratado a tenor de su especialidad será el siguiente: realizar el montaje de  la escenografía; como tal tendrá atribuidas las funciones propias de la producción audiovisual de conformidad con el uso y costumbre del sector, actuando en nombre y representación de RTV y siendo responsable ante éste por las obligaciones que contrae, para cuyo cumplimiento debe seguir las instrucciones que se le orienten.'),(40,'Especialista en Efectos Especiales',0,4,'El trabajo a realizar por El contratado  tenor de su especialidad será el siguiente: previo estudio de la obra ejecutará lo solicitado por el Director , realizando las gestiones y acciones que resulten necesarias para el logro de lo demandado o en su defecto proponer soluciones creativas a fin de satisfacer  la intención del Director, como tal tendrá atribuidas las funciones 	propias de la producción audiovisual de conformidad con el uso y costumbre del sector, actuando en nombre y representación de RTV y siendo responsable ante éste por las obligaciones que contrae, para 	cuyo cumplimiento debe seguir las instrucciones que se le orienten.'),(41,'Grabador Asistente',0,4,'El trabajo a realizar por El contratado a tenor de su especialidad será el siguiente: asistir al Grabación 	de, en todas las acciones que realice en el proceso de grabación, como tal  tendrá atribuidas las funciones propias de la producción audiovisual de conformidad con el uso 	y costumbre del sector, actuando en nombre y representación de RTV y siendo responsable ante éste por las obligaciones que contrae, para cuyo cumplimiento debe seguir las instrucciones que se le orienten.'),(42,'Tramoya',0,4,'El trabajo a realizar por El contratado, a tenor de su especialidad, será  como Tramoya, ejecutará las acciones previstas por las especialidades de escenografia y ambientación, procurará la calidad óptima de su trabajo, estudiará con detenimiento las acciones a realizar con vistas a evitar improvisaciones innecesarias e imprevistos y contribuirá con su esfuerzo personal al cumplimiento eficiente del  plan de gx diseñado, como tal tendrá atribuidas las funciones propias de la producción audiovisual de conformidad con el uso y costumbre del sector, actuando en nombre y representación de RTV y siendo responsable ante éste por las obligaciones que contrae, para cuyo cumplimiento debe seguir las instrucciones que se le orienten.'),(43,'Especialista Principal',0,4,'El trabajo a realizar por El contratado, a tenor de su especialidad, será  como Especialista principal o Jefe de iluminación, coordinará el trabajo de la especialidad desde la pregx, organizando la demanda de la técnica que se requiera en correspondencia con las necesidades de la obra, en armonía con el resto de las especialidades, ejecutará las acciones necesarias a fin de garantizar la iluminación y contribuirá con su esfuerzo personal al cumplimiento eficiente del  plan de gx diseñado, como tal tendrá atribuidas las funciones propias de la producción audiovisual de conformidad con el uso y costumbre del sector, actuando en nombre y representación de RTV y siendo responsable ante éste por las obligaciones que contrae, para cuyo cumplimiento debe seguir las instrucciones que se le orienten.'),(44,'Luminotécnico ',0,4,'El trabajo a realizar por El contratado, a tenor de su especialidad, será  como luminotécnico, ejecutará las acciones necesarias a fin de garantizar la iluminación demandada para la etapa de grabación, responderá directamente a la indicaciones del especialista pirncipal o Jefe de iluminación, contribuirá con su esfuerzo personal al cumplimiento eficiente del  plan de gx diseñado, como tal tendrá atribuidas las funciones propias de la producción audiovisual de conformidad con el uso y costumbre del sector, actuando en nombre y representación de RTV y siendo responsable ante éste por las obligaciones que contrae, para cuyo cumplimiento debe seguir las instrucciones que se le orienten.'),(45,'Luminotécnico/Electricista  ',0,4,'El trabajo a realizar por El contratado, a tenor de su especialidad, será  como luminotécnico, ejecutará las acciones necesarias a fin de garantizar la iluminación demandada para la etapa de grabación, así como se encargará de la conexión de los equipos, lámparas y bajante eléctrico, velando por la seguridad de la instalaciones que  realice, con su actuar responsable,  contribuirá con su esfuerzo personal al cumplimiento eficiente del  plan de gx diseñado, como tal tendrá atribuidas las funciones propias de la producción audiovisual de conformidad con el uso y costumbre del sector, actuando en nombre y representación de RTV y siendo responsable ante éste por las obligaciones que contrae, para cuyo cumplimiento debe seguir las instrucciones que se le orienten.'),(46,'Maquillista Principal',0,4,'El trabajo a realizar por El contratado  tenor de su especialidad será el siguiente: previo estudio de los personajes , así como la intención del Director, maquillar al personal que 	participa en la puesta y mantener su imagen durante la grabación, el tiempo del que dispone y la forma de organizarlo se negociará previamente con la producción, cuyo personal coadyuvará al cumplimiento del mismo a fin de garantizar el desempeño de la especialidad, es responsable por el uso eficiente de los útiles adquiridos para la realización de la obra. Tendrá atribuidas las funciones 	propias de la producción audiovisual de conformidad con el uso y costumbre del sector, actuando en nombre y representación de RTV y siendo responsable ante éste por las obligaciones que contrae, para 	cuyo cumplimiento debe seguir las instrucciones que se le orienten.'),(47,'Utilero',0,4,'El trabajo a realizar por El contratado  tenor de su especialidad será el siguiente: recoger, ordenar y trasladar con seguridad y responsabilidad los medios técnicos o de cuaquier tipo  utilizados para la realización de la obra, cumpliendo las indicaciones del Productor General y de los Jefes de las especialidades, coadyuvará al cumplimiento del horario que se determine, como tal tendrá atribuidas las funciones propias de la producción audiovisual de conformidad con el uso y costumbre del sector, actuando en nombre y representación de RTV y siendo responsable ante éste por las obligaciones que contrae, 	para 	cuyo cumplimiento debe seguir las instrucciones que se le orienten.'),(48,'Imágenes de apoyo',0,4,''),(49,'Diseno de Animacion',0,4,''),(50,'Musicalizador',0,4,''),(52,'Locutor',0,4,''),(54,'Animacion',0,4,''),(55,'Efectos Digitales',0,4,''),(56,'Especialista',0,4,''),(57,'Productor de Avanzada',0,4,''),(59,'Dise;ador de Banda Sonora',0,4,''),(61,'Musica Original',0,6,''),(62,'Dise;ador Escenografico',0,4,''),(63,'Dise;o de Ambientacion',0,4,''),(64,'Construccion Escenografica',0,4,''),(65,'Jefe de Iluminacion ',0,4,'');
/*!40000 ALTER TABLE `cargo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `categoria_persona`
--

DROP TABLE IF EXISTS `categoria_persona`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `categoria_persona` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(150) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UNIQ_538A49353A909126` (`nombre`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `categoria_persona`
--

LOCK TABLES `categoria_persona` WRITE;
/*!40000 ALTER TABLE `categoria_persona` DISABLE KEYS */;
INSERT INTO `categoria_persona` VALUES (1,'Personal Artístico'),(2,'Trabajador por Cuenta Propia');
/*!40000 ALTER TABLE `categoria_persona` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ciudadania`
--

DROP TABLE IF EXISTS `ciudadania`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ciudadania` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(150) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UNIQ_5290EDE63A909126` (`nombre`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ciudadania`
--

LOCK TABLES `ciudadania` WRITE;
/*!40000 ALTER TABLE `ciudadania` DISABLE KEYS */;
INSERT INTO `ciudadania` VALUES (1,'Cubano'),(2,'Extranjero');
/*!40000 ALTER TABLE `ciudadania` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `empresa`
--

DROP TABLE IF EXISTS `empresa`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `empresa` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `tipo_empresa_id` int(11) DEFAULT NULL,
  `banco_cup_id` int(11) DEFAULT NULL,
  `banco_cuc_id` int(11) DEFAULT NULL,
  `nombre` varchar(150) COLLATE utf8_unicode_ci NOT NULL,
  `nit` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `noAutorizadaResolucion` varchar(10) COLLATE utf8_unicode_ci DEFAULT NULL,
  `fechaNoAutorizadaResolucion` date NOT NULL,
  `cargoNoAutorizadaResolucion` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `noConstituidaResolucion` varchar(10) COLLATE utf8_unicode_ci DEFAULT NULL,
  `fechaNoConstituidaResolucion` date NOT NULL,
  `cargoNoConstituidaResolucion` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `direccion` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `noCuentaCUP` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `noSucursalCUP` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `noCuentaCUC` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `noSucursalCUC` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `fonNombre` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `nombreRepresentante` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `cargoRepresentante` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UNIQ_B8D75A503A909126` (`nombre`),
  KEY `IDX_B8D75A50C3981BB9` (`tipo_empresa_id`),
  KEY `IDX_B8D75A50151D711E` (`banco_cup_id`),
  KEY `IDX_B8D75A5057B1896F` (`banco_cuc_id`),
  CONSTRAINT `FK_B8D75A50151D711E` FOREIGN KEY (`banco_cup_id`) REFERENCES `banco` (`id`),
  CONSTRAINT `FK_B8D75A5057B1896F` FOREIGN KEY (`banco_cuc_id`) REFERENCES `banco` (`id`),
  CONSTRAINT `FK_B8D75A50C3981BB9` FOREIGN KEY (`tipo_empresa_id`) REFERENCES `tipo_empresa` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `empresa`
--

LOCK TABLES `empresa` WRITE;
/*!40000 ALTER TABLE `empresa` DISABLE KEYS */;
/*!40000 ALTER TABLE `empresa` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `empresa_cargo`
--

DROP TABLE IF EXISTS `empresa_cargo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `empresa_cargo` (
  `empresa_id` int(11) NOT NULL,
  `cargo_id` int(11) NOT NULL,
  PRIMARY KEY (`empresa_id`,`cargo_id`),
  KEY `IDX_BF354AF8521E1991` (`empresa_id`),
  KEY `IDX_BF354AF8813AC380` (`cargo_id`),
  CONSTRAINT `FK_BF354AF8521E1991` FOREIGN KEY (`empresa_id`) REFERENCES `empresa` (`id`),
  CONSTRAINT `FK_BF354AF8813AC380` FOREIGN KEY (`cargo_id`) REFERENCES `cargo` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `empresa_cargo`
--

LOCK TABLES `empresa_cargo` WRITE;
/*!40000 ALTER TABLE `empresa_cargo` DISABLE KEYS */;
/*!40000 ALTER TABLE `empresa_cargo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `empresa_servicio`
--

DROP TABLE IF EXISTS `empresa_servicio`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `empresa_servicio` (
  `empresa_id` int(11) NOT NULL,
  `servicio_id` int(11) NOT NULL,
  PRIMARY KEY (`empresa_id`,`servicio_id`),
  KEY `IDX_CB0FB5E1521E1991` (`empresa_id`),
  KEY `IDX_CB0FB5E171CAA3E7` (`servicio_id`),
  CONSTRAINT `FK_CB0FB5E1521E1991` FOREIGN KEY (`empresa_id`) REFERENCES `empresa` (`id`),
  CONSTRAINT `FK_CB0FB5E171CAA3E7` FOREIGN KEY (`servicio_id`) REFERENCES `cargo` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `empresa_servicio`
--

LOCK TABLES `empresa_servicio` WRITE;
/*!40000 ALTER TABLE `empresa_servicio` DISABLE KEYS */;
/*!40000 ALTER TABLE `empresa_servicio` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `formato_proyecto`
--

DROP TABLE IF EXISTS `formato_proyecto`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `formato_proyecto` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(150) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UNIQ_A8F8E91C3A909126` (`nombre`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `formato_proyecto`
--

LOCK TABLES `formato_proyecto` WRITE;
/*!40000 ALTER TABLE `formato_proyecto` DISABLE KEYS */;
INSERT INTO `formato_proyecto` VALUES (1,'FHD');
/*!40000 ALTER TABLE `formato_proyecto` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `municipio`
--

DROP TABLE IF EXISTS `municipio`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `municipio` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `municipio`
--

LOCK TABLES `municipio` WRITE;
/*!40000 ALTER TABLE `municipio` DISABLE KEYS */;
/*!40000 ALTER TABLE `municipio` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `nivel_acceso`
--

DROP TABLE IF EXISTS `nivel_acceso`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `nivel_acceso` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nivel` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UNIQ_8DFF1AE2AAFC20CB` (`nivel`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `nivel_acceso`
--

LOCK TABLES `nivel_acceso` WRITE;
/*!40000 ALTER TABLE `nivel_acceso` DISABLE KEYS */;
INSERT INTO `nivel_acceso` VALUES (1,'ADMINISTRACION'),(2,'PERSONA'),(3,'PROYECTO'),(4,'REPORTE');
/*!40000 ALTER TABLE `nivel_acceso` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `persona`
--

DROP TABLE IF EXISTS `persona`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `persona` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `carnetIdentidad` varchar(11) COLLATE utf8_unicode_ci NOT NULL,
  `nombre` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `primerApellido` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `segundoApellido` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `alias` varchar(150) COLLATE utf8_unicode_ci DEFAULT NULL,
  `direccion` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `telefono` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `fonNombre` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `fonPrimerApellido` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `fonSegundoApellido` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `fonAlias` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `sexo_id` int(11) DEFAULT NULL,
  `profesion_id` int(11) DEFAULT NULL,
  `ciudadania_id` int(11) DEFAULT NULL,
  `isNIT` tinyint(1) DEFAULT NULL,
  `noRegistroCreador` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `noLicencia` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `isTCP` tinyint(1) DEFAULT NULL,
  `isPA` tinyint(1) DEFAULT NULL,
  `banco_id` int(11) DEFAULT NULL,
  `titulo_licencia` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `noCuentaCUP` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `noCuentaCUC` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `noSucursal` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `noLicenciaSanitaria` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UNIQ_51E5B69BAED35FCB` (`carnetIdentidad`),
  KEY `IDX_51E5B69B2B32DB58` (`sexo_id`),
  KEY `IDX_51E5B69BC5AF4D0F` (`profesion_id`),
  KEY `IDX_51E5B69BD0F17795` (`ciudadania_id`),
  KEY `IDX_51E5B69BCC04A73E` (`banco_id`),
  CONSTRAINT `FK_51E5B69B2B32DB58` FOREIGN KEY (`sexo_id`) REFERENCES `sexo` (`id`),
  CONSTRAINT `FK_51E5B69BC5AF4D0F` FOREIGN KEY (`profesion_id`) REFERENCES `profesion` (`id`),
  CONSTRAINT `FK_51E5B69BCC04A73E` FOREIGN KEY (`banco_id`) REFERENCES `banco` (`id`),
  CONSTRAINT `FK_51E5B69BD0F17795` FOREIGN KEY (`ciudadania_id`) REFERENCES `ciudadania` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=118 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `persona`
--

LOCK TABLES `persona` WRITE;
/*!40000 ALTER TABLE `persona` DISABLE KEYS */;
INSERT INTO `persona` VALUES (42,'83092827229','Javier','Gomez','Sanchez','','Ave 39 e/ calle  y calle 30, edificio 2614 apto 2. Playa','','JFR','KMS','SNXS','',1,1,1,0,'','0',0,1,NULL,'','','','',''),(43,'62072600814','Laura Ana','Torres','Oro','','Beales No. 90 e/ calle Font y calle 9na. Lawton','','LRN','TRS','OR','',2,3,1,0,'','0',0,1,NULL,'','','','',''),(44,'70082509345','Jorge Luis','Frias','Garcia','','Ave 91 e/ calle 206 y calle 210, No. 20618 apto 2. La Lisa','','JRJLS','FRS','KRX','',1,10,1,0,'','0',0,1,NULL,'','','','',''),(45,'79041105303','Maykel ','Valdés','Duharte','','Mendoza No. 24 apto 4 e/ Santa Emilia y Santo Suarez. 10 de Octubre','','MKL','FLTS','THRT','',1,10,1,0,'','0',0,1,NULL,'','','','',''),(46,'85031918659','Yanaris','Bravo','Lima','','Ave 29 No. 6813 e/ calle 68 y calle 70. Playa','','YNRS','BRF','LM','',NULL,1,1,0,'','0',0,1,NULL,'','','','',''),(47,'76061501475','Yanaisa','Errasti ','Bueno','','Concordia No. 659 e/ Oquendo y Salud. Centro Habana','','YNS','ERST','BN','',2,13,1,0,'','0',0,1,NULL,'','','','',''),(48,'85071205193','Leidy','Nodas','Dávila','','Calle 288 No. 4507 e/ calle 45 y calle 47. La Lisa   ','','LT','NTS','TFL','',2,18,1,0,'','0',0,1,NULL,'','','','',''),(49,'80112820160','Robin','Ramírez','Sánchez','','Beales 84 e/ calle E y Calle Fonts. Lawton ','','RBN','RMRS','SNXS','',1,18,1,0,'','0',0,1,NULL,'','','','',''),(50,'66111309583','Eugenio Alejandro','Ricardo','Sánchez','','Josefina Este No.116 e/ Segunda y Tercera. Lawton. 10 de Octubre','','EJNLJ','RKRT','SNXS','',1,18,1,0,'','0',0,1,NULL,'','','','',''),(51,'96113007628','Alexis Antonio','Leyva','Moreno','','Calle J e/ calle 7ma y calle D edificio 15026 apto 29. Reparto Alta Habana. Boyeros','','ALKSS','LF','MRN','',1,11,1,0,'','0',0,1,NULL,'','','','',''),(52,'93011807862','Ary Ernesto','Vincench','Rodríguez','','Calle Factor No. 705 apto 7 e/ Conil y calle Tulipán. Plaza de la Revolución','','ARRNS','FNSNX','RTRKS','',1,8,1,0,'','0',0,1,NULL,'','','','',''),(53,'66032601698','Rosa Miriam','Elizalde ','Zorrilla','Rosa Miriam','San Martin No.3 apto.152 entre Infanta y Pasaje Raficas. Cerro. La  Habana\n','','RSMRM','ELSLT','SRL','RSMRM',2,1,1,1,'','0',0,1,NULL,'','','','',''),(54,'75042424788','Adrian Enrique ','Migueles ','Álvarez','','Calle 26 No.975 apto.4D e/ calle 26D y calle 26. Plaza de la Revolución. La Habana.\n\n\n','','ATRNN','MKLS','LFRS','',1,1,1,1,'','0',0,1,NULL,'','','','',''),(55,'91080422576','Kalia María Venereo ','Venereo','León','','Calle 12 No.563 apto5 e/ 23 y 25. Plaza de la Revolución. La Habana.\n\n','','KLMRF','FNR','LN','',2,NULL,1,0,'','0',0,1,NULL,'','','','',''),(56,'86080607034','Beatriz ','Pérez ','Alonso','','General Lee No. 451 e/ La Sola y Pasaje Oeste. Santos Suárez. 10 de Octubre. La Habana.\n','','BTRS','PRS','ALNS','',2,2,1,0,'','0',0,1,NULL,'','','','',''),(57,'63121702817','Rebeca De Los Ángeles Zamora','Sánchez ','Zamora','','Jesús Peregrino No.110 apto. 3 e/ Santiago y Márquez González. Centro Habana. La Habana.\n','','RBKTL','SNXS','SMR','',2,3,1,0,'','0',0,1,NULL,'','','','',''),(58,'62101513176','Flor De Paz  ','De Lázaro','Cubillas','','Calle 22 No. 269-71 apto 3F e/ 17 y 19. Plaza de la Revolución. La Habana.\n','','FLRTP','TLSR','KBLS','',2,11,1,0,'','0',0,1,NULL,'','','','',''),(59,'96120608029','Iroel ','Vázquez','González','','Calle Porvenir No.207 apto.7 e/ Fonts y Córdova. Lawton. 10 de Octubre. La Habana\n','','IRL','FSKS','KNSLS','',1,NULL,1,0,'','0',0,1,NULL,'','','','',''),(60,'93090807386','Darian ','Perdomo ','González','','Calle 3era. No.105 apto.5 e/ Gertrudis y Josefina. 10 de Octubre. La Habana.\n','','TRN','PRTM','KNSLS','',1,NULL,1,0,'','0',0,1,NULL,'','','','',''),(61,'92041404360','Dario Gabriel  ','Sánchez','García','','Calle Factor No.765 Piso 17 apto.2 e/  Conill y Tulipán. Plaza de la Revolución. La Habana.\n','','TRKBR','SNXS','KRK','',1,NULL,1,0,'','0',0,1,NULL,'','','','',''),(62,'62111815740','Ernesto','Ruiz','Ramos','','Calle Principal  No.20018 Esquina A. Reparto Residencial Almendares. Boyeros. La Habana.\n','','ERNST','RS','RMS','',1,NULL,1,0,'','0',0,1,NULL,'','','','',''),(63,'92110827722','Aldo Alejandro  ','Cruces','Newhall','','San Bernardino No.316 apto.5 e/ San Julio y Durege. Santos Suarez. 10 de Octubre. La Habana.\n','','ALTLJ','KRSS','NHL','',1,NULL,1,0,'','0',0,1,NULL,'','','','',''),(64,'84052401016','Yanela Barbara ','Bauza','Aguilar','','Calle Bernabe Varona No.135 entre Calle Independencia y Calle Sartorio, Gibara, Holguin','','YNLBR','BS','AKLR','',2,1,1,0,'000163','0',0,1,NULL,'','','','',''),(65,'80080218938','Maria Julia','Jacomino ','de Fuentes','','Arias No.177 entre Maceo y Martires, Holguin','','MRJL','JKMN','TFNTS','',2,3,1,0,'000652','0',0,1,NULL,'','','','',''),(66,'92042930665','Oscar','Sanchez','de la Yera','','Ave 17 No. 30815 entre calle 308 y calle 310, Santa fe, Playa,La Habana','','OSKR','SNXS','TLYR','',1,8,1,0,'000978','0',0,1,NULL,'','','','',''),(67,'70112108421','Hector Manuel','Reyes ','Tarrago','','Calle Morales Lemus No. 70 entre Calle Cuba y Calle Garayalde, Holguin','','HKTRM','RYS','TRK','',1,NULL,1,0,'001911','0',0,1,NULL,'','','','',''),(68,'56061502815','Luz Crecencia','Reyes','Tarrago','','Calzada de Bejucal No. 26706 entre Maximo Gomez y Presidente Gomez, Repato Las Ca;as, Boyeros, La Habana','','LSKRS','RYS','TRK','',2,NULL,1,0,'','2960',1,0,2,'Operador y/o Arrendador de Equipamineto para la Produccion Artistica','0000','0598760000001225','323',''),(69,'88011338183','José Antonio López ','López ','Díaz','','Calle 86 # 528 apto. 4 e/ 5ta B y 7ma, Playa, La Habana\n','','JSNTN','LPS','TS','',1,1,1,0,'001120','0',0,1,NULL,'','','','',''),(70,'74101502985','Damián  ','Cordero','Gómez','','Calle Ánimas # 614 apto 2 bajos e/ Lealtad y Perseverancia, Centro Habana, La Habana\n','','TMN','KRTR','KMS','',1,14,1,0,'000929','0',0,1,NULL,'','','','',''),(71,'86010907715','Ivette  ','Acosta','Claro','','Calle 41 # 12428 e/ 124 y 128, Marianao, La Habana\n','','IFT','AKST','KLR','',2,14,1,0,'000620','0',0,1,NULL,'','','','',''),(72,'85082711416','Yeilis  ','Reyes','Junco','','Calle 1ra # 14508 bajos e/ Calle 4ta y calle 6ta, Guanabacoa, La Habana\n','','YLS','RYS','JNK','',2,14,1,0,'','0',0,1,NULL,'','','','',''),(73,'65062707792','Magaly  ','Arias','Ramírez','','Calle Corrales # 10 apto 23 e/ Calle Zulueta y Calle Egido, Habana Vieja, La Habana\n','','MKL','ARS','RMRS','',2,19,1,0,'','0',0,1,NULL,'','','','',''),(74,'74081613553','Altair ','Reyes ','Raga','','Calle Camiada # 90 e/ Calle Ravena y Calle Girona, reparto Santa Elena, Manzanillo, Granma\n','','ALTR','RYS','RK','',NULL,27,1,0,'','0',0,1,NULL,'','','','',''),(75,'92070727729','Ricardo ','Blanco ','Martinez','','Calle Estancia # 826-A e/ Conill y Santa Ana, Plaza de la Revolución, La Habana\n','','RKRT','BLNK','MRTNS','',1,28,1,1,'000879','0',0,1,NULL,'','','','',''),(76,'86040117007','Yusvier ','Abreu Sotolongo','Sotolongo','','Calle Abrahan Delgado @ 111 e/ Calle Máximo Gómez y Calle Serafín Sánchez, Ciego de Ávila\n','','YSFR','ABRST','STLNK','',1,3,1,0,'001874','0',0,1,NULL,'','','','',''),(77,'88010722359','Yanara ','Rodríguez ','Escobar','','Calle C # 59 bajos e/ Calle A y Calle Arellano, reparto Lawton, Diez de Octubre, La Habana\n','','YNR','RTRKS','ESKBR','',2,3,1,0,'000893','0',0,1,NULL,'','','','',''),(78,'64112401039','Ana Maria ','Diaz ','Martinez','','Ave. 31 # 2813 e/ Calle 28 y Calle 30, poblado Catalina, Güines, Mayabeque\n','','ANMR','TS','MRTNS','',2,11,1,0,'','0',0,1,NULL,'','','','',''),(79,'75101803128','Livan ','Cruz ','Traba','','Calle Libertad no. 127 interior e/ Anita y Mantilla. Mantilla, Arroyo Naranjo, La Habana\n','','LFN','KRS','TRB','',1,21,1,1,'','0',0,1,NULL,'','','','',''),(80,'62082211528','Jorge ','Marrero ','Molina','','Calle 56 # 4111 apto 7 e/ Calle 41 y Calle 43, La ceiba, Playa, La Habana\n','','JRJ','MRR','MLN','',1,18,1,0,'','0',0,1,NULL,'','','','',''),(81,'90022028660','Gerardo ','Garcia ','Perez','','Progreso 36 e/ Longa y Calzada de Managua, Mantilla, Arroyo Naranjo, La Habana\n','','JRRT','KRX','PRS','',1,18,1,1,'','0',0,1,NULL,'','','','',''),(82,'58120100580','Nelson ','Brito ','López','','Carretera Alberro Km 3 1/2 s/n, Alberro, Cotorro, La Habana\n','','NLSN','BRT','LPS','',1,18,1,1,'','0',0,1,NULL,'','','','',''),(83,'92041630254','Claudia ','Remedios ','Suárez','','Calle 285 # 10003 Alt. e/ 100 y 102, Boyeros, La Habana\n','','KLT','RMTS','SRS','',2,NULL,1,1,'','0',0,1,NULL,'','','','',''),(84,'89082835745','Alejandro ','Vargas ','Luzardo','','Ave. Independencia KM 3½ Bloque 8 apto 6, Reparto la Guayaba, Cerro, La Habana\n','','ALJNT','FRKS','LSRT','',1,31,1,0,'','0',0,1,NULL,'','','','',''),(85,'75121207407','Yasser ','Exposito ','Cárdenas','','Reparto Camilo Cienfuegos Edificio 301  apto 202, Habana del Este, La Habana\n','','YSR','EKSPS','KRTNS','',1,31,1,0,'','0',0,1,NULL,'','','','',''),(86,'85072513167','Jesús Antonio ','Urrutia ','Valencia','','Calle 3ra H #164A30 e/ 3ra B y 164 A, Zona 1, Alamar, Habana del Este, La Habana\n','','JSSNT','URX','FLNX','',1,31,1,1,'000199','0',0,1,NULL,'','','','',''),(87,'87091906767','Manuel Alejandro ','Blanco ','Martínez','','Calle 222 # 2725 apto 4e/ Ave. 27 y Ave. 29, Lisa, La Habana\n','','MNLLJ','BLNK','MRTNS','',1,32,1,0,'','0',0,1,NULL,'','','','',''),(88,'89031223466','Jorge Luis ','Armengol',' Rojas','','Pasaje A # 14513 e/ Calle 24 de febrero y Calle 2, Reparto Martin Pérez, San Miguel de Padrón, La Habana\n','','JRJLS','ARMNK','RJS','',1,33,1,0,'','0',0,1,NULL,'','','','',''),(89,'75080201865','Eduardo ','Quintero ','Ruiz','','Ave. Camagüey # 11618 apto 38 e/ Calle 11 y Calle Canal, Cerro, La Habana\n','','ETRT','KNTR','RS','',1,33,1,0,'','0',0,1,NULL,'','','','',''),(90,'82060804246','Noriel ','Martínez ','Cruz','','Calle 32 # 3305 e/ 33 y Línea, Catalina de Güines, Mayabeque, \n','','NRL','MRTNS','KRS','',1,33,1,0,'','0',0,1,NULL,'','','','',''),(91,'97091100709','Ernesto ','González ','Martínez','','Calle Estancia # 826-A e/ Conill y Santa Ana, Plaza de la Revolución, La Habana\n','','ERNST','KNSLS','MRTNS','',1,21,1,0,'','0',0,1,NULL,'','','','',''),(92,'95122727155','Lisandra ','González ','Peraza','','Calle 44 # 2908 e/ Ave. 29 y Ave. 31, San Antonio de los Baños, Artemisa\n','','LSNTR','KNSLS','PRS','',2,34,1,1,'000469','0',0,1,NULL,'','','','',''),(93,'96091617171','Ixchel Marina ','Casado ','Pérez','','Calle Miguel Angel Nuñez # 38 e/ Calle Bellavista y Calle Jaime Noguera, Reparto La Vigia, Camagüey\n','','IKSXL','KST','PRS','',2,34,1,0,'','0',0,1,NULL,'','','','',''),(94,'68102332365','Rubén Isaac ','Pérez ','Cuéllar','','Edificio 318 apto 406, reparto Camilo Cienfuegos, Habana del Este, La Habana\n','','RBNSK','PRS','KLR','',1,34,1,0,'','0',0,1,NULL,'','','','',''),(95,'92050727725','José Armando ','Amat ','Pérez','','Calle 33A #15605 e/ 156 y 158, Playa, La Habana\n','','JSRMN','AMT','PRS','',1,34,1,0,'','0',0,1,NULL,'','','','',''),(96,'83022013290','Maylén Danay ','Ibarra ','González','','Ave. 47 #19406 apto 6 e/ Calle 194 y Calle 196, Lisa, La Habana\n','','MLNTN','IBR','KNSLS','',2,3,1,0,'','0',0,1,NULL,'','','','',''),(97,'94123036142','Manuel Alejandro ','Pérez ','Morales','','Edificio 14 apto 18 Reparto Pastorita, Cienfuegos\n','','MNLLJ','PRS','MRLS','',1,35,1,0,'','0',0,1,NULL,'','','','',''),(98,'94061729788','Ariel ','Corrales',' Sánchez','','Florencia # 104 e/ San Anselmo y San Gabriel, Cerro, La Habana\n','','ARL','KRLS','SNXS','',1,35,1,0,'','0',0,1,NULL,'','','','',''),(99,'85101105536','Ibis ','González ','González','','Calle San Rafael # 967 apto. 66 e/ Espada y Hospital, Centro Habana, La Habana\n','','IBS','KNSLS','KNSLS','',2,36,1,0,'','0',0,1,NULL,'','','','',''),(100,'91032727215','Yanisel ','Duthil ','Rivera','','Calle 229A #20033 e/ 206 y 235, Fontanar, Boyeros, La Habana\n','','YNSL','T0L','RFR','',2,35,1,0,'','0',0,1,NULL,'','','','',''),(101,'70082602648','Justo Orlando ','Interian ','Quintana','','Calle Ayuntamiento # 205 apto 4 e/ Calle San Pedro y Calle Lombillo, Cerra, La Habana\n','','JSTRL','INTRN','KNTN','',1,NULL,1,1,'','0',0,1,NULL,'','','','',''),(102,'00073168429','Adrian Lázaro ','Lora ','Herrera','','Calle San Anselmo # 452 e/ Calle Macedonia y Calle Florencia, Cerro, La Habana\n','','ATRNL','LR','HRR','',1,NULL,1,0,'','0',0,1,NULL,'','','','',''),(103,'63061202377','Teresa ','García ','Trimiño','','Calle Maloja # 353 Bajos e/ Escobar y Division, Centro Habana, La Habana\n','','TRS','KRK','TRM','',2,38,1,1,'','0',0,1,NULL,'','','','',''),(104,'90072626890','Heidy Ana ','Cruz ','Laurencio','','Calle 108 # 28708 e/ Calle 287 y Calle 291, Reparto Calabazar, Boyeros, La Habana\n','','HTN','KRS','LRNS','',2,38,1,0,'','0',0,1,NULL,'','','','',''),(105,'99122808355','Lorena ','Gispert ','Duverger','','Ave. Boyeros # 803 apto 5-C e/ Calle Tulipán y Calle Conill, Plaza de la Revolución, La Habana\n','','LRN','JSPRT','TFRJR','',2,12,1,0,'','0',0,1,NULL,'','','','',''),(106,'84120704188','Luismel ','González ','Llanes','','Ave. 35-A # 8512 e/ 86 y 88, Quivicán, Mayabeque\n','','LSML','KNSLS','LNS','',1,8,1,1,'','0',0,1,NULL,'','','','',''),(107,'81043007727','Alain ','García ','Escobar','','Calle 28 # 314 apto. 306 e/ Calle 23 y Calle 25, Plaza de la Revolución, La Habana\n','','ALN','KRK','ESKBR','',1,8,1,0,'','0',0,1,NULL,'','','','',''),(108,'94030309068','José Andrés ','Fumero ','Rojas','','Ave. 27 # 2814 e/ Calle 28 y Calle 30, Caibarien, Villa Clara\n','','JSNTR','FMR','RJS','',1,39,1,0,'','0',0,1,NULL,'','','','',''),(109,'83080810339','Keidy ','Ortiz ','Perez','','Calle 62 # 210704  e/ Calle 217 y Calzada de Guines, Florida, San Miguel del Padrón, La Habana\n','','KT','ORTS','PRS','',2,35,1,1,'','0',0,1,NULL,'','','','',''),(110,'84090807921','Eduardo Lázaro ','Navarrete ','Pérez','','Calle 144 # C117 apto 1 e/ Calle 41 y Calle 43, Marianao, La Habana\n','','ETRTL','NFRT','PRS','',1,35,1,1,'','0',0,1,NULL,'','','','',''),(111,'59022109758','Carmen Viday Perez de Diego','Perez ','de Diego','','Calle Oeste # 982 apto 8 e/ Calle Josefina y Ursula, Sevillano, Diez de Octubre, La Habana\n','','KRMNF','PRS','TTK','',2,36,1,1,'','0',0,1,NULL,'','','','',''),(112,'85061926496','Sulian ','Linares ','Ramos','','Ave. 35 # 5409 apto 1 e/ Calle 54 y Calle 56, Almendares, Playa, La Habana\n','','SLN','LNRS','RMS','',2,35,1,1,'','0',0,1,NULL,'','','','',''),(113,'81100701595','Jelliset ','Valdés ','Rodríguez','','Calle Oeste # 7 apto 4 e/ San Miguel y Lagueruela, reparto sevillano, diez de octubre, La Habana\n','','JLST','FLTS','RTRKS','',2,16,1,0,'','0',0,1,NULL,'','','','',''),(114,'60072604438','María Caridad ','Cruz ','Balmaseda','','Ave. 35 A # 225 apto 7 e/ Calle 250 y Calle 246, San Agustín, Lisa, La Habana\n','','MRKRT','KRS','BLMST','',2,2,1,0,'','0',0,1,NULL,'','','','',''),(115,'95012145130','Danay ','Cruz ','Estupiñan','','Calle Paseo # 613 apto 2 e/ Calle 25 y Calle 27, Plaza de la Revolución, La Habana\n','','TN','KRS','ESTPN','',2,2,1,0,'','0',0,1,NULL,'','','','',''),(116,'72061011026','Alain','Hernandez','Ortiz','','calle c','','ALN','HRNNT','ORTS','',1,NULL,1,1,'','234444',1,0,2,'Transportacion','3444','4566','34',''),(117,'72061011027','Roberto','Perez','Azul','','e','','RBRT','PRS','ASL','',1,NULL,1,1,'','d',1,0,4,'d','d','d','56777','');
/*!40000 ALTER TABLE `persona` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `persona_cargo`
--

DROP TABLE IF EXISTS `persona_cargo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `persona_cargo` (
  `persona_id` int(11) NOT NULL,
  `cargo_id` int(11) NOT NULL,
  PRIMARY KEY (`persona_id`,`cargo_id`),
  KEY `IDX_D52F5554F5F88DB9` (`persona_id`),
  KEY `IDX_D52F5554813AC380` (`cargo_id`),
  CONSTRAINT `FK_D52F5554813AC380` FOREIGN KEY (`cargo_id`) REFERENCES `cargo` (`id`),
  CONSTRAINT `FK_D52F5554F5F88DB9` FOREIGN KEY (`persona_id`) REFERENCES `persona` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `persona_cargo`
--

LOCK TABLES `persona_cargo` WRITE;
/*!40000 ALTER TABLE `persona_cargo` DISABLE KEYS */;
INSERT INTO `persona_cargo` VALUES (42,1),(42,10),(43,6),(44,10),(45,10),(45,48),(46,32),(47,13),(48,30),(49,30),(50,30),(51,22),(52,49),(53,1),(53,8),(53,10),(54,8),(54,22),(54,31),(55,34),(55,49),(56,5),(56,8),(56,9),(57,6),(58,30),(59,30),(60,50),(61,4),(62,52),(63,49),(63,54),(64,1),(65,6),(66,55),(67,5),(67,7),(67,31),(69,1),(70,22),(71,22),(72,27),(73,29),(74,29),(75,6),(76,21),(77,11),(78,11),(79,30),(80,30),(81,30),(82,30),(83,33),(84,10),(85,10),(86,10),(87,30),(88,65),(89,44),(90,44),(91,32),(92,7),(93,41),(94,41),(95,59),(96,61),(97,34),(98,62),(99,63),(100,35),(101,47),(102,47),(103,13),(104,13),(105,12),(106,8),(107,8),(108,36),(109,64),(110,64),(111,26),(112,11),(113,5),(114,5),(115,5);
/*!40000 ALTER TABLE `persona_cargo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `persona_servicio`
--

DROP TABLE IF EXISTS `persona_servicio`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `persona_servicio` (
  `persona_id` int(11) NOT NULL,
  `servicio_id` int(11) NOT NULL,
  PRIMARY KEY (`persona_id`,`servicio_id`),
  KEY `IDX_2B55E66BF5F88DB9` (`persona_id`),
  KEY `IDX_2B55E66B71CAA3E7` (`servicio_id`),
  CONSTRAINT `FK_2B55E66B71CAA3E7` FOREIGN KEY (`servicio_id`) REFERENCES `cargo` (`id`),
  CONSTRAINT `FK_2B55E66BF5F88DB9` FOREIGN KEY (`persona_id`) REFERENCES `persona` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `persona_servicio`
--

LOCK TABLES `persona_servicio` WRITE;
/*!40000 ALTER TABLE `persona_servicio` DISABLE KEYS */;
INSERT INTO `persona_servicio` VALUES (68,14),(68,16),(68,17),(68,23),(116,16),(116,19),(116,20),(116,23),(117,14),(117,16),(117,17),(117,19),(117,20),(117,23);
/*!40000 ALTER TABLE `persona_servicio` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `profesion`
--

DROP TABLE IF EXISTS `profesion`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `profesion` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(150) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UNIQ_7CBDAD0A3A909126` (`nombre`)
) ENGINE=InnoDB AUTO_INCREMENT=40 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `profesion`
--

LOCK TABLES `profesion` WRITE;
/*!40000 ALTER TABLE `profesion` DISABLE KEYS */;
INSERT INTO `profesion` VALUES (16,'Actor'),(36,'Ambientadora'),(35,'Artista'),(20,'Asesor TV'),(14,'Asistente de Dirección'),(11,'Asistente de Producción'),(31,'Camarografo'),(18,'Chofer'),(4,'Conducción'),(17,'Data Manager'),(1,'Director'),(39,'Dise;ador'),(9,'Diseño 3D'),(19,'Dramaturgo'),(8,'Editor'),(32,'electricista'),(27,'especialista'),(26,'Estadistico'),(30,'Fotografo'),(5,'Grabador de TV'),(2,'Guionista'),(21,'Informatico'),(33,'Luminotecnico'),(13,'Maquillaje y Peluquería'),(38,'Maquillista'),(37,'Montador'),(15,'Músico'),(10,'Operador de Cámara'),(3,'Productor'),(28,'Realizador Audiovisual'),(6,'Rodaje'),(34,'sonidista'),(12,'Vestuario');
/*!40000 ALTER TABLE `profesion` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `provincia`
--

DROP TABLE IF EXISTS `provincia`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `provincia` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `provincia`
--

LOCK TABLES `provincia` WRITE;
/*!40000 ALTER TABLE `provincia` DISABLE KEYS */;
/*!40000 ALTER TABLE `provincia` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `proyecto`
--

DROP TABLE IF EXISTS `proyecto`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `proyecto` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `titulo` varchar(150) COLLATE utf8_unicode_ci NOT NULL,
  `tiempoPantalla` int(11) NOT NULL,
  `emisiones` int(11) NOT NULL,
  `fechaInicio` date NOT NULL,
  `fechaTerminacion` date NOT NULL,
  `etapaPreFilmacion` int(11) NOT NULL,
  `etapaFilmacion` int(11) NOT NULL,
  `etapaPostFilmacion` int(11) NOT NULL,
  `descripcion` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `formato_id` int(11) DEFAULT NULL,
  `tipo_id` int(11) DEFAULT NULL,
  `isConcluido` tinyint(1) DEFAULT NULL,
  `noContratoCanal` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `nombresDirectorGeneral` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `nombresProductorGeneral` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_6FD202B98D02887B` (`formato_id`),
  KEY `IDX_6FD202B9A9276E6C` (`tipo_id`),
  CONSTRAINT `FK_6FD202B98D02887B` FOREIGN KEY (`formato_id`) REFERENCES `formato_proyecto` (`id`),
  CONSTRAINT `FK_6FD202B9A9276E6C` FOREIGN KEY (`tipo_id`) REFERENCES `tipo_proyecto` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=34 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `proyecto`
--

LOCK TABLES `proyecto` WRITE;
/*!40000 ALTER TABLE `proyecto` DISABLE KEYS */;
INSERT INTO `proyecto` VALUES (29,'Dominio Cuba',27,2,'2020-11-29','2020-12-04',2,2,2,'',1,10,0,'187/2019','Rosa Miriam Elizalde  Zorrilla','Rebeca De Los Ángeles Zamora Sánchez  Zamora'),(30,'Documental Capaces',12,1,'2020-11-15','2020-12-01',4,5,8,'',1,11,0,'187/2019','Yanela Barbara  Bauza Aguilar','Maria Julia Jacomino  de Fuentes'),(31,'DRAMATIZADO  EL ATRACON',15,13,'2020-10-22','2020-12-05',26,28,20,'',1,8,0,'187/2019','José Antonio López  López  Díaz','Ricardo  Blanco  Martinez'),(32,'ok',12,4,'2020-12-10','2020-12-31',10,5,4,'ok',1,9,0,'44','Alain Hernandez Ortiz','Alain Hernandez Ortiz'),(33,'q',12,2,'2020-12-12','2020-12-19',2,2,2,'a',1,9,0,'44','Adrian Enrique  Migueles  Álvarez','Adrian Enrique  Migueles  Álvarez');
/*!40000 ALTER TABLE `proyecto` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `proyecto_empresa_cargo`
--

DROP TABLE IF EXISTS `proyecto_empresa_cargo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `proyecto_empresa_cargo` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `proyecto_id` int(11) DEFAULT NULL,
  `empresa_id` int(11) DEFAULT NULL,
  `cargo_id` int(11) DEFAULT NULL,
  `noContrato` varchar(10) COLLATE utf8_unicode_ci NOT NULL,
  `isTCP` tinyint(1) DEFAULT NULL,
  `isPA` tinyint(1) DEFAULT NULL,
  `presupuestoCargo` decimal(18,2) NOT NULL,
  `presupuestoOtroIngreso` decimal(18,2) DEFAULT NULL,
  `presupuestoTotal` decimal(18,2) NOT NULL,
  `valorPrograma` decimal(18,2) NOT NULL,
  `presupuestoRestante` decimal(18,2) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_85612206F625D1BA` (`proyecto_id`),
  KEY `IDX_85612206521E1991` (`empresa_id`),
  KEY `IDX_85612206813AC380` (`cargo_id`),
  CONSTRAINT `FK_85612206521E1991` FOREIGN KEY (`empresa_id`) REFERENCES `empresa` (`id`),
  CONSTRAINT `FK_85612206813AC380` FOREIGN KEY (`cargo_id`) REFERENCES `cargo` (`id`),
  CONSTRAINT `FK_85612206F625D1BA` FOREIGN KEY (`proyecto_id`) REFERENCES `proyecto` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `proyecto_empresa_cargo`
--

LOCK TABLES `proyecto_empresa_cargo` WRITE;
/*!40000 ALTER TABLE `proyecto_empresa_cargo` DISABLE KEYS */;
/*!40000 ALTER TABLE `proyecto_empresa_cargo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `proyecto_empresa_reporte`
--

DROP TABLE IF EXISTS `proyecto_empresa_reporte`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `proyecto_empresa_reporte` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `proyecto_empresa_cargo_id` int(11) DEFAULT NULL,
  `reporte_id` int(11) DEFAULT NULL,
  `noSuplemento` int(11) NOT NULL,
  `cantidadProgramas` int(11) NOT NULL,
  `ingreso` decimal(18,2) NOT NULL,
  `porciento` decimal(18,2) NOT NULL,
  `presupuestoACobrar` decimal(18,2) NOT NULL,
  `presupuestoRestante` decimal(18,2) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_45DAC619FFCBAEE9` (`proyecto_empresa_cargo_id`),
  KEY `IDX_45DAC61992CA572` (`reporte_id`),
  CONSTRAINT `FK_45DAC61992CA572` FOREIGN KEY (`reporte_id`) REFERENCES `reporte` (`id`),
  CONSTRAINT `FK_45DAC619FFCBAEE9` FOREIGN KEY (`proyecto_empresa_cargo_id`) REFERENCES `proyecto_empresa_cargo` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `proyecto_empresa_reporte`
--

LOCK TABLES `proyecto_empresa_reporte` WRITE;
/*!40000 ALTER TABLE `proyecto_empresa_reporte` DISABLE KEYS */;
/*!40000 ALTER TABLE `proyecto_empresa_reporte` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `proyecto_persona_cargo`
--

DROP TABLE IF EXISTS `proyecto_persona_cargo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `proyecto_persona_cargo` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `proyecto_id` int(11) DEFAULT NULL,
  `persona_id` int(11) DEFAULT NULL,
  `cargo_id` int(11) DEFAULT NULL,
  `presupuestoCargo` decimal(18,2) NOT NULL,
  `presupuestoOtroIngreso` decimal(18,2) DEFAULT NULL,
  `presupuestoTotal` decimal(18,2) NOT NULL,
  `valorPrograma` decimal(18,2) NOT NULL,
  `noContrato` varchar(10) COLLATE utf8_unicode_ci NOT NULL,
  `isTCP` tinyint(1) DEFAULT NULL,
  `isPA` tinyint(1) DEFAULT NULL,
  `presupuestoRestante` decimal(18,2) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_EF7B3DAAF625D1BA` (`proyecto_id`),
  KEY `IDX_EF7B3DAAF5F88DB9` (`persona_id`),
  KEY `IDX_EF7B3DAA813AC380` (`cargo_id`),
  CONSTRAINT `FK_EF7B3DAA813AC380` FOREIGN KEY (`cargo_id`) REFERENCES `cargo` (`id`),
  CONSTRAINT `FK_EF7B3DAAF5F88DB9` FOREIGN KEY (`persona_id`) REFERENCES `persona` (`id`),
  CONSTRAINT `FK_EF7B3DAAF625D1BA` FOREIGN KEY (`proyecto_id`) REFERENCES `proyecto` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=104 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `proyecto_persona_cargo`
--

LOCK TABLES `proyecto_persona_cargo` WRITE;
/*!40000 ALTER TABLE `proyecto_persona_cargo` DISABLE KEYS */;
INSERT INTO `proyecto_persona_cargo` VALUES (26,29,53,1,440.00,0.00,440.00,220.00,'1',0,1,440.00),(27,29,54,8,360.00,0.00,360.00,180.00,'2',0,1,360.00),(28,29,54,22,400.00,0.00,400.00,200.00,'3',0,1,400.00),(29,29,54,31,200.00,0.00,200.00,100.00,'4',0,1,200.00),(30,29,55,34,390.00,0.00,390.00,195.00,'5',0,1,390.00),(31,29,55,49,360.00,0.00,360.00,180.00,'6',0,1,360.00),(32,29,56,5,60.00,0.00,60.00,30.00,'7',0,1,60.00),(33,29,57,6,400.00,0.00,400.00,200.00,'8',0,1,400.00),(34,29,58,30,100.00,0.00,100.00,50.00,'9',0,1,100.00),(35,29,59,30,420.00,0.00,420.00,210.00,'10',0,1,420.00),(36,29,60,50,120.00,0.00,120.00,60.00,'11',0,1,120.00),(37,29,61,4,220.00,0.00,220.00,110.00,'12',0,1,220.00),(38,29,62,52,60.00,0.00,60.00,30.00,'13',0,1,60.00),(39,29,63,49,360.00,0.00,360.00,180.00,'14',0,1,360.00),(40,29,52,49,360.00,0.00,360.00,180.00,'15',0,1,360.00),(41,30,64,1,750.00,0.00,750.00,750.00,'1',0,1,750.00),(42,30,65,6,170.00,0.00,170.00,170.00,'2',0,1,170.00),(43,30,66,55,170.00,0.00,170.00,170.00,'3',0,1,170.00),(44,30,67,5,300.00,0.00,300.00,300.00,'4',0,1,300.00),(45,30,67,7,175.00,0.00,175.00,175.00,'5',0,1,175.00),(46,30,67,31,175.00,0.00,175.00,175.00,'6',0,1,175.00),(47,30,68,16,90.00,0.00,90.00,90.00,'1-TCP',1,0,90.00),(48,30,68,14,300.00,0.00,300.00,300.00,'1-TCP',1,0,300.00),(49,30,68,23,180.00,0.00,180.00,180.00,'1-TCP',1,0,180.00),(50,31,69,1,3200.00,0.00,3200.00,246.15,'1',0,1,3200.00),(51,31,70,22,1120.00,0.00,1120.00,86.15,'2',0,1,1120.00),(52,31,71,22,1040.00,0.00,1040.00,80.00,'3',0,1,1040.00),(53,31,72,27,1040.00,0.00,1040.00,80.00,'4',0,1,1040.00),(54,31,73,29,910.00,0.00,910.00,70.00,'5',0,1,910.00),(55,31,74,29,910.00,0.00,910.00,70.00,'6',0,1,910.00),(56,31,75,6,2800.00,0.00,2800.00,215.38,'7',0,1,2800.00),(57,31,76,21,1950.00,0.00,1950.00,150.00,'8',0,1,1950.00),(58,31,77,11,780.00,0.00,780.00,60.00,'9',0,1,780.00),(59,31,78,11,650.00,0.00,650.00,50.00,'10',0,1,650.00),(60,31,79,30,4440.00,0.00,4440.00,341.54,'11',0,1,4440.00),(61,31,80,30,2280.00,0.00,2280.00,175.38,'12',0,1,2280.00),(62,31,81,30,6720.00,0.00,6720.00,516.92,'13',0,1,6720.00),(63,31,82,30,3300.00,0.00,3300.00,253.85,'14',0,1,3300.00),(64,31,83,33,2590.00,0.00,2590.00,199.23,'15',0,1,2590.00),(65,31,84,10,1120.00,0.00,1120.00,86.15,'16',0,1,1120.00),(66,31,85,10,1120.00,0.00,1120.00,86.15,'17',0,1,1120.00),(67,31,86,10,1120.00,0.00,1120.00,86.15,'18',0,1,1120.00),(68,31,87,30,560.00,0.00,560.00,43.08,'19',0,1,560.00),(69,31,88,65,1500.00,0.00,1500.00,115.38,'20',0,1,1500.00),(70,31,89,44,600.00,0.00,600.00,46.15,'21',0,1,600.00),(71,31,90,44,600.00,0.00,600.00,46.15,'22',0,1,600.00),(72,31,91,32,560.00,0.00,560.00,43.08,'23',0,1,560.00),(73,31,92,7,1500.00,0.00,1500.00,115.38,'24',0,1,1500.00),(74,31,93,41,560.00,0.00,560.00,43.08,'25',0,1,560.00),(75,31,94,41,560.00,0.00,560.00,43.08,'26',0,1,560.00),(76,31,95,59,780.00,0.00,780.00,60.00,'27',0,1,780.00),(77,31,96,61,1000.00,0.00,1000.00,76.92,'28',0,1,1000.00),(78,31,97,34,1960.00,0.00,1960.00,150.77,'29',0,1,1960.00),(79,32,68,14,1040.00,0.00,1040.00,260.00,'1-TCP',1,0,1040.00),(80,32,68,16,1040.00,0.00,1040.00,260.00,'1-TCP',1,0,1040.00),(81,32,116,16,1040.00,0.00,1040.00,260.00,'2-TCP',1,0,1040.00),(82,32,116,19,1040.00,0.00,1040.00,260.00,'2-TCP',1,0,1040.00),(83,30,68,17,240.00,0.00,240.00,240.00,'1-TCP',1,0,240.00),(84,30,116,16,490.00,0.00,490.00,490.00,'2-TCP',1,0,490.00),(85,30,116,19,300.00,0.00,300.00,300.00,'2-TCP',1,0,300.00),(86,33,53,1,1.00,1.00,2.00,0.00,'1',0,1,2.00),(87,33,53,8,2.00,2.00,4.00,0.00,'2',0,1,4.00),(88,33,53,10,2.00,2.00,4.00,0.00,'2',0,1,4.00),(89,33,56,5,1.00,1.00,2.00,0.00,'3',0,1,2.00),(90,33,56,8,2.00,2.00,4.00,0.00,'4',0,1,4.00),(91,33,56,9,3.00,3.00,6.00,0.00,'4',0,1,6.00),(92,33,54,8,2.00,2.00,4.00,0.00,'5',0,1,4.00),(93,33,54,22,2.00,2.00,4.00,0.00,'5',0,1,4.00),(94,33,54,31,2.00,2.00,4.00,0.00,'5',0,1,4.00),(95,32,53,1,1.00,1.00,2.00,0.50,'1',0,1,2.00),(96,32,53,8,1.00,1.00,2.00,0.50,'2',0,1,2.00),(97,32,53,10,1.00,1.00,2.00,0.50,'2',0,1,2.00),(98,32,56,5,1.00,1.00,2.00,0.50,'3',0,1,2.00),(99,32,56,8,1.00,1.00,2.00,0.50,'4',0,1,2.00),(100,32,56,9,1.00,1.00,2.00,0.50,'4',0,1,2.00),(101,32,54,8,1.00,1.00,2.00,0.50,'5',0,1,2.00),(102,32,54,22,1.00,1.00,2.00,0.50,'5',0,1,2.00),(103,32,54,31,1.00,1.00,2.00,0.50,'5',0,1,2.00);
/*!40000 ALTER TABLE `proyecto_persona_cargo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `proyecto_persona_reporte`
--

DROP TABLE IF EXISTS `proyecto_persona_reporte`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `proyecto_persona_reporte` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `reporte_id` int(11) DEFAULT NULL,
  `proyecto_persona_cargo_id` int(11) DEFAULT NULL,
  `cantidadProgramas` int(11) NOT NULL,
  `ingreso` decimal(18,2) NOT NULL,
  `presupuestoRestante` decimal(18,2) NOT NULL,
  `porciento` decimal(18,2) NOT NULL,
  `presupuestoACobrar` decimal(18,2) NOT NULL,
  `noSuplemento` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_CA6052131F91FD63` (`proyecto_persona_cargo_id`),
  KEY `IDX_CA60521392CA572` (`reporte_id`),
  CONSTRAINT `FK_CA6052131F91FD63` FOREIGN KEY (`proyecto_persona_cargo_id`) REFERENCES `proyecto_persona_cargo` (`id`),
  CONSTRAINT `FK_CA60521392CA572` FOREIGN KEY (`reporte_id`) REFERENCES `reporte` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `proyecto_persona_reporte`
--

LOCK TABLES `proyecto_persona_reporte` WRITE;
/*!40000 ALTER TABLE `proyecto_persona_reporte` DISABLE KEYS */;
/*!40000 ALTER TABLE `proyecto_persona_reporte` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `reporte`
--

DROP TABLE IF EXISTS `reporte`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `reporte` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `fechaReporte` date NOT NULL,
  `cantidadProgramas` int(11) NOT NULL,
  `proyecto_id` int(11) DEFAULT NULL,
  `noReporte` int(11) NOT NULL,
  `isConcluido` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_5CB1214F625D1BA` (`proyecto_id`),
  CONSTRAINT `FK_5CB1214F625D1BA` FOREIGN KEY (`proyecto_id`) REFERENCES `proyecto` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `reporte`
--

LOCK TABLES `reporte` WRITE;
/*!40000 ALTER TABLE `reporte` DISABLE KEYS */;
/*!40000 ALTER TABLE `reporte` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `role`
--

DROP TABLE IF EXISTS `role`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `role` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UNIQ_57698A6A3A909126` (`nombre`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `role`
--

LOCK TABLES `role` WRITE;
/*!40000 ALTER TABLE `role` DISABLE KEYS */;
INSERT INTO `role` VALUES (2,'ROLE_ADMINISTRADOR'),(3,'ROLE_PERSONA'),(4,'ROLE_PROYECTO'),(5,'ROLE_REPORTE'),(1,'ROLE_SUPERUSUARIO');
/*!40000 ALTER TABLE `role` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sexo`
--

DROP TABLE IF EXISTS `sexo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sexo` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(150) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UNIQ_2C3956923A909126` (`nombre`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sexo`
--

LOCK TABLES `sexo` WRITE;
/*!40000 ALTER TABLE `sexo` DISABLE KEYS */;
INSERT INTO `sexo` VALUES (2,'Femenino'),(1,'Masculino');
/*!40000 ALTER TABLE `sexo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tipo_contrato`
--

DROP TABLE IF EXISTS `tipo_contrato`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tipo_contrato` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(150) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UNIQ_B0AC3FEA3A909126` (`nombre`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tipo_contrato`
--

LOCK TABLES `tipo_contrato` WRITE;
/*!40000 ALTER TABLE `tipo_contrato` DISABLE KEYS */;
INSERT INTO `tipo_contrato` VALUES (8,'Contrato Actor'),(7,'Contrato Alimentación Trabajador por Cuenta Propia'),(9,'Contrato Asistente a la Producción'),(1,'Contrato Director'),(4,'Contrato General'),(3,'Contrato Guionista'),(6,'Contrato Música Original'),(2,'Contrato Productor'),(5,'Contrato Trabajador General por Cuenta Propia'),(10,'Contrato Transporte por Cuenta Propia');
/*!40000 ALTER TABLE `tipo_contrato` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tipo_empresa`
--

DROP TABLE IF EXISTS `tipo_empresa`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tipo_empresa` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UNIQ_AB2E7BF03A909126` (`nombre`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tipo_empresa`
--

LOCK TABLES `tipo_empresa` WRITE;
/*!40000 ALTER TABLE `tipo_empresa` DISABLE KEYS */;
/*!40000 ALTER TABLE `tipo_empresa` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tipo_proyecto`
--

DROP TABLE IF EXISTS `tipo_proyecto`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tipo_proyecto` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(150) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UNIQ_B91758703A909126` (`nombre`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tipo_proyecto`
--

LOCK TABLES `tipo_proyecto` WRITE;
/*!40000 ALTER TABLE `tipo_proyecto` DISABLE KEYS */;
INSERT INTO `tipo_proyecto` VALUES (11,'Cinematografico'),(8,'Dramatizado'),(10,'Informativo'),(1,'Programa Habitual'),(9,'Serial');
/*!40000 ALTER TABLE `tipo_proyecto` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `traza`
--

DROP TABLE IF EXISTS `traza`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `traza` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `fecha` date NOT NULL,
  `operacion` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `descripcion` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `username` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `nombre` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=780 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `traza`
--

LOCK TABLES `traza` WRITE;
/*!40000 ALTER TABLE `traza` DISABLE KEYS */;
INSERT INTO `traza` VALUES (1,'2020-10-18','Insertar Cargo','Se insertó una nuevo cargo con el nombre: Dramatizados','system','Alain'),(2,'2020-10-18','Insertar Tipo de Proyecto','Se insertó una nuevo tipo de proyecto con el nombre: Dramatizados','system','Alain'),(3,'2020-10-18','Insertar Tipo de Proyecto','Se insertó una nuevo tipo de proyecto con el nombre: Seriales','system','Alain'),(4,'2020-10-18','Insertar Tipo de Proyecto','Se insertó una nuevo tipo de proyecto con el nombre: Dramatizados','system','Alain'),(5,'2020-10-18','Insertar Tipo de Proyecto','Se insertó una nuevo tipo de proyecto con el nombre: Seriales','system','Alain'),(6,'2020-10-18','Insertar Tipo de Proyecto','Se insertó una nuevo tipo de proyecto con el nombre: Dramatizados','system','Alain'),(7,'2020-10-18','Insertar Tipo de Proyecto','Se insertó una nuevo tipo de proyecto con el nombre: Seriales','system','Alain'),(8,'2020-10-18','Insertar Tipo de Proyecto','Se insertó una nuevo tipo de proyecto con el nombre: Dramatizados','system','Alain'),(9,'2020-10-18','Insertar Tipo de Proyecto','Se insertó una nuevo tipo de proyecto con el nombre: Seriales','system','Alain'),(10,'2020-10-18','Insertar Cargo','Se insertó una nuevo cargo con el nombre: Conducción','system','Alain'),(11,'2020-10-18','Insertar Cargo','Se insertó una nuevo cargo con el nombre: Guionista','system','Alain'),(12,'2020-10-18','Insertar Cargo','Se insertó una nuevo cargo con el nombre: Productor General/Rodaje ','system','Alain'),(13,'2020-10-18','Insertar Cargo','Se insertó una nuevo cargo con el nombre: Grabador TV','system','Alain'),(14,'2020-10-18','Insertar Cargo','Se insertó una nuevo cargo con el nombre: Editor','system','Alain'),(15,'2020-10-18','Insertar Cargo','Se insertó una nuevo cargo con el nombre: Diseño 3D','system','Alain'),(16,'2020-10-18','Insertar Cargo','Se insertó una nuevo cargo con el nombre: Operador de Cámara','system','Alain'),(17,'2020-10-18','Insertar Cargo','Se insertó una nuevo cargo con el nombre: Asistente de Producción','system','Alain'),(18,'2020-10-18','Insertar Cargo','Se insertó una nuevo cargo con el nombre: Vestuario','system','Alain'),(19,'2020-10-18','Insertar Cargo','Se insertó una nuevo cargo con el nombre: Maquillaje y Peluquería','system','Alain'),(20,'2020-10-18','Insertar Formato','Se insertó una nuevo formato con el nombre: HD','system','Alain'),(21,'2020-10-18','Insertar Formato','Se insertó una nuevo formato con el nombre: VHS','system','Alain'),(22,'2020-10-18','Eliminar el formato','Se eliminó el formato con el nombre: VHS','system','Alain'),(23,'2020-10-18','Modificar el formato','Se modificó el formato con el nombre:  ffff','system','Alain'),(24,'2020-10-18','Eliminar el formato','Se eliminó el formato con el nombre: ffff','system','Alain'),(25,'2020-10-18','Modificar tipo de proyecto','Se modificó el tipo de proyecto con el nombre:  Seriales1','system','Alain'),(26,'2020-10-18','Modificar tipo de proyecto','Se modificó el tipo de proyecto con el nombre:  Seriales','system','Alain'),(27,'2020-10-18','Insertar Tipo de Proyecto','Se insertó una nuevo tipo de proyecto con el nombre: dddd','system','Alain'),(28,'2020-10-18','Eliminar tipo de proyecto','Se eliminó el tipo de proyecto con el nombre: dddd','system','Alain'),(29,'2020-10-18','Modificar el cargo','Se modificó el cargo con el nombre:  Productor General/Rodaje 1','system','Alain'),(30,'2020-10-18','Modificar el cargo','Se modificó el cargo con el nombre:  Productor General/Rodaje','system','Alain'),(31,'2020-10-18','Insertar Cargo','Se insertó una nuevo cargo con el nombre: ddd','system','Alain'),(32,'2020-10-18','Eliminar el cargo','Se eliminó el cargo con el nombre: ddd','system','Alain'),(33,'2020-10-18','Insertar Persona','Se insertó la persona: Randol Menéndez Cruz','system','Alain'),(34,'2020-10-18','Insertar Persona','Se insertó la persona: Ilse Hernández Sariol','system','Alain'),(35,'2020-10-19','Insertar Persona','Se insertó la persona: Sandy León de Armas','system','Alain'),(36,'2020-10-19','Insertar Persona','Se insertó la persona: Sandy León de Armas','system','Alain'),(37,'2020-10-22','Insertar Profesión','Se insertó una nueva profesión con el nombre: Director','marta.diaz','Marta'),(38,'2020-10-22','Insertar Profesión','Se insertó una nueva profesión con el nombre: Guionista','marta.diaz','Marta'),(39,'2020-10-22','Insertar Profesión','Se insertó una nueva profesión con el nombre: Productor','marta.diaz','Marta'),(40,'2020-10-22','Insertar Profesión','Se insertó una nueva profesión con el nombre: Grabador de TV','marta.diaz','Marta'),(41,'2020-10-22','Insertar Persona','Se insertó la persona: Roberto Chávez Gestoso','marta.diaz','Marta'),(42,'2020-10-22','Modificar Persona','Se modificó la persona: Roberto Chávez Gestoso','marta.diaz','Marta'),(43,'2020-10-22','Modificar Persona','Se modificó la persona: Roberto Chávez Gestoso','marta.diaz','Marta'),(44,'2020-10-22','Modificar Persona','Se modificó la persona: Roberto Chávez Gestoso','marta.diaz','Marta'),(45,'2020-10-22','Insertar Persona','Se insertó la persona: Jorge Gómez La O','marta.diaz','Marta'),(46,'2020-10-22','Insertar Persona','Se insertó la persona: Victor Alejandro López Fuentes','marta.diaz','Marta'),(47,'2020-10-22','Insertar Persona','Se insertó la persona: Raymel Almeida Carracedo','marta.diaz','Marta'),(48,'2020-10-23','Insertar Persona','Se insertó la persona: Yohannes Acosta Díaz','marta.diaz','Marta'),(49,'2020-10-23','Insertar Persona','Se insertó la persona: Michel Batista Leyva','marta.diaz','Marta'),(50,'2020-10-23','Modificar Persona','Se modificó la persona: Randol Menéndez Cruz','marta.diaz','Marta'),(51,'2020-10-23','Modificar Persona','Se modificó la persona: Randol Menéndez Cruz','marta.diaz','Marta'),(52,'2020-10-23','Modificar Persona','Se modificó la persona: Randol Menéndez Cruz','marta.diaz','Marta'),(53,'2020-10-23','Modificar Persona','Se modificó la persona: Randol Menéndez Cruz','marta.diaz','Marta'),(54,'2020-10-23','Modificar Persona','Se modificó la persona: Randol Menéndez Cruz','marta.diaz','Marta'),(55,'2020-10-23','Agregar los datos generales de un proyecto','Se agregó los datos generales del proyecto: 33','marta.diaz','Marta'),(56,'2020-10-24','Modificar los datos generales de un proyecto','Se modificó los datos generales del proyecto: 33','marta.diaz','Marta'),(57,'2020-10-24','Modificar los datos generales de un proyecto','Se modificó los datos generales del proyecto: 33','marta.diaz','Marta'),(58,'2020-10-28','Insertar Cargo','Se insertó una nuevo cargo con el nombre: Cámara','marta.diaz','Marta'),(59,'2020-10-28','Insertar Cargo','Se insertó una nuevo cargo con el nombre: Kit Iluminación','marta.diaz','Marta'),(60,'2020-10-28','Insertar Cargo','Se insertó una nuevo cargo con el nombre: Micrófonos','marta.diaz','Marta'),(61,'2020-10-28','Insertar Cargo','Se insertó una nuevo cargo con el nombre: Impresión','marta.diaz','Marta'),(62,'2020-10-28','Insertar Cargo','Se insertó una nuevo cargo con el nombre: Alimentación','marta.diaz','Marta'),(63,'2020-10-28','Insertar Cargo','Se insertó una nuevo cargo con el nombre: Transportación','marta.diaz','Marta'),(64,'2020-10-28','Insertar Cargo','Se insertó una nuevo cargo con el nombre: Alojamiento','marta.diaz','Marta'),(65,'2020-10-28','Insertar Cargo','Se insertó una nuevo cargo con el nombre: iooo','marta.diaz','Marta'),(66,'2020-10-28','Insertar Cargo','Se insertó una nuevo cargo con el nombre: yyyy','marta.diaz','Marta'),(67,'2020-10-28','Insertar Cargo','Se insertó una nuevo cargo con el nombre: 555555','marta.diaz','Marta'),(68,'2020-10-28','Insertar Cargo','Se insertó una nuevo cargo con el nombre: eeeeee','marta.diaz','Marta'),(69,'2020-10-28','Insertar Cargo','Se insertó una nuevo cargo con el nombre: rrrr','marta.diaz','Marta'),(70,'2020-10-28','Insertar Cargo','Se insertó una nuevo cargo con el nombre: rrrrttttt','marta.diaz','Marta'),(71,'2020-10-28','Eliminar el concepto','Se eliminó el concepto con el nombre: eeeeee','marta.diaz','Marta'),(72,'2020-10-28','Eliminar el concepto','Se eliminó el concepto con el nombre: 555555','marta.diaz','Marta'),(73,'2020-10-28','Eliminar el concepto','Se eliminó el concepto con el nombre: Kit Iluminación','marta.diaz','Marta'),(74,'2020-10-28','Eliminar el concepto','Se eliminó el concepto con el nombre: rrrr','marta.diaz','Marta'),(75,'2020-10-28','Eliminar el concepto','Se eliminó el concepto con el nombre: rrrrttttt','marta.diaz','Marta'),(76,'2020-10-28','Modificar el concepto','Se modificó el concepto con el nombre:  iooo1','marta.diaz','Marta'),(77,'2020-10-28','Eliminar el concepto','Se eliminó el concepto con el nombre: iooo1','marta.diaz','Marta'),(78,'2020-10-28','Eliminar el concepto','Se eliminó el concepto con el nombre: yyyy','marta.diaz','Marta'),(79,'2020-10-28','Insertar Persona','Se insertó la persona: alain roberto perez','marta.diaz','Marta'),(80,'2020-10-28','Insertar Persona','Se insertó la persona: alden valdez diaz','marta.diaz','Marta'),(81,'2020-10-28','Insertar Persona','Se insertó la persona: roberto Perez galan','marta.diaz','Marta'),(82,'2020-10-28','Modificar Persona','Se modificó la persona: alden valdez diaz','marta.diaz','Marta'),(83,'2020-10-28','Insertar Persona','Se insertó la persona: Julio Alambron Satas','marta.diaz','Marta'),(84,'2020-10-28','Modificar Persona','Se modificó la persona: Julio Alambron Satas','marta.diaz','Marta'),(85,'2020-10-28','Modificar Persona','Se modificó la persona: Julio Alambron Satas','marta.diaz','Marta'),(86,'2020-10-28','Modificar Persona','Se modificó la persona: Julio Alambron Satas','marta.diaz','Marta'),(87,'2020-10-28','Modificar Persona','Se modificó la persona: Julio Alambron Satas','marta.diaz','Marta'),(88,'2020-10-28','Modificar Persona','Se modificó la persona: Julio Alambron Satas','marta.diaz','Marta'),(89,'2020-10-28','Modificar Persona','Se modificó la persona: Julio Alambron Satas','marta.diaz','Marta'),(90,'2020-10-28','Modificar Persona','Se modificó la persona: Julio Alambron Satas','marta.diaz','Marta'),(91,'2020-10-28','Modificar Persona','Se modificó la persona: Julio Alambron Satas','marta.diaz','Marta'),(92,'2020-10-28','Modificar Persona','Se modificó la persona: Julio Alambron Satas','marta.diaz','Marta'),(93,'2020-10-28','Modificar Persona','Se modificó la persona: Julio Alambron Satas','marta.diaz','Marta'),(94,'2020-10-28','Modificar Persona','Se modificó la persona: Julio Alambron Satas','marta.diaz','Marta'),(95,'2020-10-29','Modificar Persona','Se modificó la persona: alain roberto perez','marta.diaz','Marta'),(96,'2020-10-29','Modificar Persona','Se modificó la persona: alain roberto perez','marta.diaz','Marta'),(97,'2020-10-29','Insertar concepto','Se insertó una nuevo concepto con el nombre: tyyyy','marta.diaz','Marta'),(98,'2020-10-29','Eliminar el concepto','Se eliminó el concepto con el nombre: tyyyy','marta.diaz','Marta'),(99,'2020-10-29','Modificar el concepto','Se modificó el concepto con el nombre:  Director General ','marta.diaz','Marta'),(100,'2020-10-29','Modificar el concepto','Se modificó el concepto con el nombre:  Guionista','marta.diaz','Marta'),(101,'2020-10-29','Modificar el concepto','Se modificó el concepto con el nombre:  Productor General/Rodaje','marta.diaz','Marta'),(107,'2020-10-29','Agregar los datos generales de un proyecto','Se agregó los datos generales del proyecto: iiiiiiii','marta.diaz','Marta'),(118,'2020-10-29','Agregar los datos generales de un proyecto','Se agregó los datos generales del proyecto: 456','marta.diaz','Marta'),(119,'2020-10-29','Agregar los datos generales de un proyecto','Se agregó los datos generales del proyecto: dale','marta.diaz','Marta'),(125,'2020-10-29','Agregar los datos generales de un proyecto','Se agregó los datos generales del proyecto: ok','marta.diaz','Marta'),(126,'2020-10-29','Agregar las contrataciones del personal artístico de un proyecto','Se agregaron las contrataciones del personal artístico del proyecto: ok','marta.diaz','Marta'),(127,'2020-10-29','Agregar las contrataciones de los trabajadores por cuenta propia de un proyecto','Se agregaron las contrataciones de los trabajadores por cuenta propia del proyecto: ok','marta.diaz','Marta'),(128,'2020-10-30','Modificar los datos generales de un proyecto','Se modificó los datos generales del proyecto: ok','marta.diaz','Marta'),(129,'2020-10-30','Agregar las contrataciones del personal artístico de un proyecto','Se agregaron las contrataciones del personal artístico del proyecto: ok','marta.diaz','Marta'),(130,'2020-10-30','Agregar las contrataciones de los trabajadores por cuenta propia de un proyecto','Se agregaron las contrataciones de los trabajadores por cuenta propia del proyecto: ok','marta.diaz','Marta'),(133,'2020-10-30','Modificar los datos generales de un proyecto','Se modificó los datos generales del proyecto: ok','marta.diaz','Marta'),(134,'2020-10-30','Modificación de las contrataciones de un proyecto','Se modificaron las contrataciones del proyecto: ok','marta.diaz','Marta'),(135,'2020-10-30','Modificar los datos generales de un proyecto','Se modificó los datos generales del proyecto: ok','marta.diaz','Marta'),(136,'2020-10-30','Modificación de las contrataciones de un proyecto','Se modificaron las contrataciones del proyecto: ok','marta.diaz','Marta'),(137,'2020-10-30','Modificar los datos generales de un proyecto','Se modificó los datos generales del proyecto: ok','marta.diaz','Marta'),(138,'2020-10-30','Modificación de las contrataciones de un proyecto','Se modificaron las contrataciones del proyecto: ok','marta.diaz','Marta'),(139,'2020-10-30','Modificar los datos generales de un proyecto','Se modificó los datos generales del proyecto: ok','marta.diaz','Marta'),(140,'2020-10-30','Modificación de las contrataciones de un proyecto','Se modificaron las contrataciones del proyecto: ok','marta.diaz','Marta'),(141,'2020-10-30','Modificar los datos generales de un proyecto','Se modificó los datos generales del proyecto: ok','marta.diaz','Marta'),(142,'2020-10-30','Modificación de las contrataciones de un proyecto','Se modificaron las contrataciones del proyecto: ok','marta.diaz','Marta'),(143,'2020-10-30','Modificar los datos generales de un proyecto','Se modificó los datos generales del proyecto: ok','marta.diaz','Marta'),(144,'2020-10-30','Modificación de las contrataciones de un proyecto','Se modificaron las contrataciones del proyecto: ok','marta.diaz','Marta'),(145,'2020-10-30','Modificar los datos generales de un proyecto','Se modificó los datos generales del proyecto: ok','marta.diaz','Marta'),(146,'2020-10-30','Modificación de las contrataciones de un proyecto','Se modificaron las contrataciones del proyecto: ok','marta.diaz','Marta'),(147,'2020-10-31','Insertar Formato','Se insertó una nuevo formato con el nombre: wwww','marta.diaz','Marta'),(148,'2020-10-31','Eliminar el formato','Se eliminó el formato con el nombre: wwww','marta.diaz','Marta'),(149,'2020-10-31','Modificar tipo de proyecto','Se modificó el tipo de proyecto con el nombre:  Dramatizado','marta.diaz','Marta'),(150,'2020-10-31','Modificar tipo de proyecto','Se modificó el tipo de proyecto con el nombre:  Programa Habitual','marta.diaz','Marta'),(151,'2020-10-31','Modificar tipo de proyecto','Se modificó el tipo de proyecto con el nombre:  Serial','marta.diaz','Marta'),(152,'2020-10-31','Insertar Tipo de Contrato','Se insertó una nuevo tipo de contrato con el nombre: Contrato Director','marta.diaz','Marta'),(153,'2020-10-31','Insertar Tipo de Contrato','Se insertó una nuevo tipo de contrato con el nombre: Contrato Director','marta.diaz','Marta'),(154,'2020-10-31','Insertar Tipo de Contrato','Se insertó una nuevo tipo de contrato con el nombre: Contrato Productor','marta.diaz','Marta'),(155,'2020-10-31','Insertar Tipo de Contrato','Se insertó una nuevo tipo de contrato con el nombre: Contrato Guionista','marta.diaz','Marta'),(156,'2020-10-31','Insertar Tipo de Contrato','Se insertó una nuevo tipo de contrato con el nombre: Contrato General','marta.diaz','Marta'),(157,'2020-10-31','Insertar Tipo de Contrato','Se insertó una nuevo tipo de contrato con el nombre: Contrato Trabajador por Cuenta Propia','marta.diaz','Marta'),(158,'2020-10-31','Insertar Tipo de Contrato','Se insertó una nuevo tipo de contrato con el nombre: ss','marta.diaz','Marta'),(159,'2020-10-31','Modificar el Tipo de Contrato','Se modificó el tipo de contrato con el nombre:  ss1','marta.diaz','Marta'),(160,'2020-10-31','Eliminar el tipo de contrato','Se eliminó el tipo de contrato con el nombre: ss1','marta.diaz','Marta'),(161,'2020-10-31','Modificar el concepto','Se modificó el concepto con el nombre:  Alimentación','marta.diaz','Marta'),(162,'2020-10-31','Modificar el concepto','Se modificó el concepto con el nombre:  Alojamiento','marta.diaz','Marta'),(163,'2020-10-31','Modificar el concepto','Se modificó el concepto con el nombre:  Asistente de Producción','marta.diaz','Marta'),(164,'2020-10-31','Modificar el concepto','Se modificó el concepto con el nombre:  Conducción','marta.diaz','Marta'),(165,'2020-10-31','Modificar el concepto','Se modificó el concepto con el nombre:  Cámara','marta.diaz','Marta'),(166,'2020-10-31','Modificar el concepto','Se modificó el concepto con el nombre:  Cámara','marta.diaz','Marta'),(167,'2020-10-31','Modificar el concepto','Se modificó el concepto con el nombre:  Alimentación','marta.diaz','Marta'),(168,'2020-10-31','Modificar el concepto','Se modificó el concepto con el nombre:  Alojamiento','marta.diaz','Marta'),(169,'2020-10-31','Modificar el concepto','Se modificó el concepto con el nombre:  Alimentación','marta.diaz','Marta'),(170,'2020-10-31','Modificar el concepto','Se modificó el concepto con el nombre:  Director General ','marta.diaz','Marta'),(171,'2020-10-31','Modificar el concepto','Se modificó el concepto con el nombre:  Diseño 3D','marta.diaz','Marta'),(172,'2020-10-31','Modificar el concepto','Se modificó el concepto con el nombre:  Editor','marta.diaz','Marta'),(173,'2020-10-31','Modificar el concepto','Se modificó el concepto con el nombre:  Grabador TV','marta.diaz','Marta'),(174,'2020-10-31','Modificar el concepto','Se modificó el concepto con el nombre:  Guionista','marta.diaz','Marta'),(175,'2020-10-31','Modificar el concepto','Se modificó el concepto con el nombre:  Impresión','marta.diaz','Marta'),(176,'2020-10-31','Modificar el concepto','Se modificó el concepto con el nombre:  Maquillaje y Peluquería','marta.diaz','Marta'),(177,'2020-10-31','Modificar el concepto','Se modificó el concepto con el nombre:  Micrófonos','marta.diaz','Marta'),(178,'2020-10-31','Modificar el concepto','Se modificó el concepto con el nombre:  Operador de Cámara','marta.diaz','Marta'),(179,'2020-10-31','Modificar el concepto','Se modificó el concepto con el nombre:  Productor General/Rodaje','marta.diaz','Marta'),(180,'2020-10-31','Modificar el concepto','Se modificó el concepto con el nombre:  Transportación','marta.diaz','Marta'),(181,'2020-10-31','Modificar el concepto','Se modificó el concepto con el nombre:  Vestuario','marta.diaz','Marta'),(182,'2020-11-01','Modificar los datos generales de un proyecto','Se modificó los datos generales del proyecto: 33','marta.diaz','Marta'),(183,'2020-11-01','Modificación de las contrataciones de un proyecto','Se modificaron las contrataciones del proyecto: 33','marta.diaz','Marta'),(184,'2020-11-01','Modificar los datos generales de un proyecto','Se modificó los datos generales del proyecto: 33','marta.diaz','Marta'),(185,'2020-11-01','Modificación de las contrataciones de un proyecto','Se modificaron las contrataciones del proyecto: 33','marta.diaz','Marta'),(186,'2020-11-01','Modificar los datos generales de un proyecto','Se modificó los datos generales del proyecto: 33','marta.diaz','Marta'),(187,'2020-11-01','Modificación de las contrataciones de un proyecto','Se modificaron las contrataciones del proyecto: 33','marta.diaz','Marta'),(188,'2020-11-01','Modificar los datos generales de un proyecto','Se modificó los datos generales del proyecto: 33','marta.diaz','Marta'),(189,'2020-11-01','Modificación de las contrataciones de un proyecto','Se modificaron las contrataciones del proyecto: 33','marta.diaz','Marta'),(190,'2020-11-01','Modificar los datos generales de un proyecto','Se modificó los datos generales del proyecto: 33','marta.diaz','Marta'),(191,'2020-11-01','Modificación de las contrataciones de un proyecto','Se modificaron las contrataciones del proyecto: 33','marta.diaz','Marta'),(192,'2020-11-01','Modificar los datos generales de un proyecto','Se modificó los datos generales del proyecto: 456','marta.diaz','Marta'),(193,'2020-11-01','Modificación de las contrataciones de un proyecto','Se modificaron las contrataciones del proyecto: 456','marta.diaz','Marta'),(200,'2020-11-01','Modificar los datos generales de un proyecto','Se modificó los datos generales del proyecto: 33','marta.diaz','Marta'),(201,'2020-11-01','Modificación de las contrataciones de un proyecto','Se modificaron las contrataciones del proyecto: 33','marta.diaz','Marta'),(202,'2020-11-01','Modificar los datos generales de un proyecto','Se modificó los datos generales del proyecto: 33','marta.diaz','Marta'),(203,'2020-11-01','Modificación de las contrataciones de un proyecto','Se modificaron las contrataciones del proyecto: 33','marta.diaz','Marta'),(204,'2020-11-01','Modificar los datos generales de un proyecto','Se modificó los datos generales del proyecto: 33','marta.diaz','Marta'),(205,'2020-11-01','Modificación de las contrataciones de un proyecto','Se modificaron las contrataciones del proyecto: 33','marta.diaz','Marta'),(206,'2020-11-01','Modificar los datos generales de un proyecto','Se modificó los datos generales del proyecto: 456','marta.diaz','Marta'),(207,'2020-11-01','Modificación de las contrataciones de un proyecto','Se modificaron las contrataciones del proyecto: 456','marta.diaz','Marta'),(208,'2020-11-01','Modificar los datos generales de un proyecto','Se modificó los datos generales del proyecto: ok','marta.diaz','Marta'),(209,'2020-11-01','Modificación de las contrataciones de un proyecto','Se modificaron las contrataciones del proyecto: ok','marta.diaz','Marta'),(210,'2020-11-01','Modificar los datos generales de un proyecto','Se modificó los datos generales del proyecto: dale','marta.diaz','Marta'),(211,'2020-11-01','Modificación de las contrataciones de un proyecto','Se modificaron las contrataciones del proyecto: dale','marta.diaz','Marta'),(212,'2020-11-01','Concluir un proyecto','Se concluyó el proyecto: 33','marta.diaz','Marta'),(213,'2020-11-01','Concluir un proyecto','Se concluyó el proyecto: iiiiiiii','marta.diaz','Marta'),(214,'2020-11-01','Concluir un proyecto','Se concluyó el proyecto: 456','marta.diaz','Marta'),(215,'2020-11-01','Concluir un proyecto','Se concluyó el proyecto: ok','marta.diaz','Marta'),(216,'2020-11-01','Concluir un proyecto','Se concluyó el proyecto: dale','marta.diaz','Marta'),(217,'2020-11-01','Eliminar persona','Se elimino la persona: Randol Menéndez Cruz','marta.diaz','Marta'),(218,'2020-11-01','Eliminar persona','Se elimino la persona: Ilse Hernández Sariol','marta.diaz','Marta'),(219,'2020-11-01','Eliminar persona','Se elimino la persona: Sandy León de Armas','marta.diaz','Marta'),(220,'2020-11-01','Eliminar persona','Se elimino la persona: Roberto Chávez Gestoso','marta.diaz','Marta'),(221,'2020-11-01','Eliminar persona','Se elimino la persona: Jorge Gómez La O','marta.diaz','Marta'),(222,'2020-11-01','Eliminar persona','Se elimino la persona: Victor Alejandro López Fuentes','marta.diaz','Marta'),(223,'2020-11-01','Eliminar persona','Se elimino la persona: Raymel Almeida Carracedo','marta.diaz','Marta'),(224,'2020-11-01','Eliminar persona','Se elimino la persona: Yohannes Acosta Díaz','marta.diaz','Marta'),(225,'2020-11-01','Eliminar persona','Se elimino la persona: Michel Batista Leyva','marta.diaz','Marta'),(226,'2020-11-01','Eliminar persona','Se elimino la persona: alain roberto perez','marta.diaz','Marta'),(227,'2020-11-01','Eliminar persona','Se elimino la persona: alden valdez diaz','marta.diaz','Marta'),(228,'2020-11-01','Eliminar persona','Se elimino la persona: roberto Perez galan','marta.diaz','Marta'),(229,'2020-11-01','Eliminar persona','Se elimino la persona: Julio Alambron Satas','marta.diaz','Marta'),(230,'2020-11-01','Insertar Persona','Se insertó la persona: Randol Menéndez Cruz','marta.diaz','Marta'),(231,'2020-11-01','Insertar Persona','Se insertó la persona: Ilse Hernández Sariol','marta.diaz','Marta'),(232,'2020-11-01','Modificar el concepto','Se modificó el concepto con el nombre:  Productor General','marta.diaz','Marta'),(233,'2020-11-01','Insertar concepto','Se insertó una nuevo concepto con el nombre: Rodaje','marta.diaz','Marta'),(234,'2020-11-01','Modificar profesión','Se modificó la profesión con el nombre:  Rodaje','marta.diaz','Marta'),(235,'2020-11-01','Insertar Persona','Se insertó la persona: Sandy León de Armas','marta.diaz','Marta'),(236,'2020-11-01','Modificar el concepto','Se modificó el concepto con el nombre:  Productor General/Rodaje','marta.diaz','Marta'),(237,'2020-11-01','Insertar Persona','Se insertó la persona: Roberto  Chávez Gestoso','marta.diaz','Marta'),(238,'2020-11-01','Insertar Persona','Se insertó la persona: Jorge Gómez La O','marta.diaz','Marta'),(239,'2020-11-01','Insertar Persona','Se insertó la persona: Victor Alejandro López Fuentes','marta.diaz','Marta'),(240,'2020-11-01','Insertar Persona','Se insertó la persona: Raymel Almeida Carracedo','marta.diaz','Marta'),(241,'2020-11-01','Insertar Persona','Se insertó la persona: Yohannes Acosta Díaz','marta.diaz','Marta'),(242,'2020-11-01','Insertar Persona','Se insertó la persona: Michel Batista Leyva','marta.diaz','Marta'),(243,'2020-11-01','Insertar Persona','Se insertó la persona: Dumay Luna Mejías','marta.diaz','Marta'),(244,'2020-11-01','Insertar Profesión','Se insertó una nueva profesión con el nombre: Asistente de Dirección','marta.diaz','Marta'),(245,'2020-11-01','Insertar concepto','Se insertó una nuevo concepto con el nombre: Asistente de Dirección','marta.diaz','Marta'),(246,'2020-11-01','Modificar Persona','Se modificó la persona: Dumay Luna Mejías','marta.diaz','Marta'),(247,'2020-11-01','Modificar Persona','Se modificó la persona: Dumay Luna Mejías','marta.diaz','Marta'),(248,'2020-11-01','Insertar Persona','Se insertó la persona: Armando Daniel Gorrin Maldonado','marta.diaz','Marta'),(249,'2020-11-01','Insertar Persona','Se insertó la persona: Dariela Rivera Quintana','marta.diaz','Marta'),(250,'2020-11-01','Insertar Persona','Se insertó la persona: Isis Hernández Sariol','marta.diaz','Marta'),(251,'2020-11-01','Insertar Persona','Se insertó la persona: Enier  Ares Manso','marta.diaz','Marta'),(252,'2020-11-01','Modificar Persona','Se modificó la persona: Michel Batista Leyva','marta.diaz','Marta'),(253,'2020-11-01','Insertar concepto','Se insertó una nuevo concepto con el nombre: Kit Iluminación','marta.diaz','Marta'),(254,'2020-11-01','Modificar Persona','Se modificó la persona: Michel Batista Leyva','marta.diaz','Marta'),(255,'2020-11-01','Modificar Persona','Se modificó la persona: Sandy León de Armas','marta.diaz','Marta'),(262,'2020-11-01','Agregar los datos generales de un proyecto','Se agregó los datos generales del proyecto: Naturalmente','marta.diaz','Marta'),(263,'2020-11-01','Agregar las contrataciones del personal artístico de un proyecto','Se agregaron las contrataciones del personal artístico del proyecto: Naturalmente','marta.diaz','Marta'),(264,'2020-11-01','Modificar los datos generales de un proyecto','Se modificó los datos generales del proyecto: Naturalmente','marta.diaz','Marta'),(265,'2020-11-01','Modificación de las contrataciones de un proyecto','Se modificaron las contrataciones del proyecto: Naturalmente','marta.diaz','Marta'),(268,'2020-11-01','Modificar los datos generales de un proyecto','Se modificó los datos generales del proyecto: Naturalmente','marta.diaz','Marta'),(269,'2020-11-01','Modificación de las contrataciones de un proyecto','Se modificaron las contrataciones del proyecto: Naturalmente','marta.diaz','Marta'),(270,'2020-11-01','Modificar Persona','Se modificó la persona: Ilse Hernández Sariol','marta.diaz','Marta'),(271,'2020-11-01','Modificar los datos generales de un proyecto','Se modificó los datos generales del proyecto: Naturalmente','marta.diaz','Marta'),(272,'2020-11-01','Modificación de las contrataciones de un proyecto','Se modificaron las contrataciones del proyecto: Naturalmente','marta.diaz','Marta'),(273,'2020-11-01','Modificar Persona','Se modificó la persona: Jorge Gómez La O','marta.diaz','Marta'),(274,'2020-11-01','Modificar los datos generales de un proyecto','Se modificó los datos generales del proyecto: Naturalmente','marta.diaz','Marta'),(275,'2020-11-01','Modificación de las contrataciones de un proyecto','Se modificaron las contrataciones del proyecto: Naturalmente','marta.diaz','Marta'),(276,'2020-11-01','Modificar los datos generales de un proyecto','Se modificó los datos generales del proyecto: Naturalmente','marta.diaz','Marta'),(277,'2020-11-01','Modificación de las contrataciones de un proyecto','Se modificaron las contrataciones del proyecto: Naturalmente','marta.diaz','Marta'),(278,'2020-11-01','Modificar Persona','Se modificó la persona: Victor Alejandro López Fuentes','marta.diaz','Marta'),(279,'2020-11-01','Insertar Persona','Se insertó la persona: Alain Hernández Ortiz','marta.diaz','Marta'),(280,'2020-11-01','Insertar Persona','Se insertó la persona: Roberto pooo iiiii','marta.diaz','Marta'),(281,'2020-11-01','Insertar Persona','Se insertó la persona: s s s','marta.diaz','Marta'),(282,'2020-11-01','Modificar Persona','Se modificó la persona: s s s','marta.diaz','Marta'),(283,'2020-11-01','Modificar Persona','Se modificó la persona: s s s','marta.diaz','Marta'),(284,'2020-11-01','Modificar Persona','Se modificó la persona: s s s','marta.diaz','Marta'),(285,'2020-11-01','Modificar Persona','Se modificó la persona: Randol Menéndez Cruz','marta.diaz','Marta'),(286,'2020-11-01','Modificar Persona','Se modificó la persona: Randol Menéndez Cruz','marta.diaz','Marta'),(287,'2020-11-02','Insertar Persona','Se insertó la persona: a a a','marta.diaz','Marta'),(288,'2020-11-02','Insertar Persona','Se insertó la persona: e e e','marta.diaz','Marta'),(289,'2020-11-02','Insertar Persona','Se insertó la persona: r r r','marta.diaz','Marta'),(290,'2020-11-02','Eliminar persona','Se elimino la persona: r r r','marta.diaz','Marta'),(291,'2020-11-02','Eliminar persona','Se elimino la persona: e e e','marta.diaz','Marta'),(292,'2020-11-02','Eliminar persona','Se elimino la persona: a a a','marta.diaz','Marta'),(293,'2020-11-02','Eliminar persona','Se elimino la persona: s s s','marta.diaz','Marta'),(294,'2020-11-02','Modificar Persona','Se modificó la persona: Raymel Almeida Carracedo','marta.diaz','Marta'),(295,'2020-11-02','Modificar Persona','Se modificó la persona: Michel Batista Leyva','marta.diaz','Marta'),(296,'2020-11-02','Modificar Persona','Se modificó la persona: Dariela Rivera Quintana','marta.diaz','Marta'),(297,'2020-11-02','Modificar Persona','Se modificó la persona: Isis Hernández Sariol','marta.diaz','Marta'),(298,'2020-11-02','Modificar Persona','Se modificó la persona: Enier  Ares Manso','marta.diaz','Marta'),(299,'2020-11-02','Modificar los datos generales de un proyecto','Se modificó los datos generales del proyecto: Naturalmente','marta.diaz','Marta'),(300,'2020-11-02','Modificación de las contrataciones de un proyecto','Se modificaron las contrataciones del proyecto: Naturalmente','marta.diaz','Marta'),(301,'2020-11-02','Modificar los datos generales de un proyecto','Se modificó los datos generales del proyecto: Naturalmente','marta.diaz','Marta'),(302,'2020-11-02','Modificación de las contrataciones de un proyecto','Se modificaron las contrataciones del proyecto: Naturalmente','marta.diaz','Marta'),(303,'2020-11-03','Modificar los datos generales de un proyecto','Se modificó los datos generales del proyecto: Naturalmente','marta.diaz','Marta'),(304,'2020-11-03','Modificación de las contrataciones de un proyecto','Se modificaron las contrataciones del proyecto: Naturalmente','marta.diaz','Marta'),(305,'2020-11-05','Agregar reporte de un proyecto','Se agregó el reporte no. 1 del proyecto: Naturalmente','marta.diaz','Marta'),(306,'2020-11-05','Agregar las personas de un reporte','Se agregaron las personas del reporte no. 1 del proyecto: Naturalmente','marta.diaz','Marta'),(307,'2020-11-05','Agregar reporte de un proyecto','Se agregó el reporte no. 1 del proyecto: Naturalmente','marta.diaz','Marta'),(308,'2020-11-05','Agregar las personas de un reporte','Se agregaron las personas del reporte no. 1 del proyecto: Naturalmente','marta.diaz','Marta'),(309,'2020-11-05','Agregar reporte de un proyecto','Se agregó el reporte no. 1 del proyecto: Naturalmente','marta.diaz','Marta'),(310,'2020-11-05','Agregar las personas de un reporte','Se agregaron las personas del reporte no. 1 del proyecto: Naturalmente','marta.diaz','Marta'),(311,'2020-11-05','Agregar reporte de un proyecto','Se agregó el reporte no. 2 del proyecto: Naturalmente','marta.diaz','Marta'),(312,'2020-11-05','Agregar las personas de un reporte','Se agregaron las personas del reporte no. 2 del proyecto: Naturalmente','marta.diaz','Marta'),(313,'2020-11-05','Modificar reporte de un proyecto','Se modificó el reporte no. 1 del proyecto: Naturalmente','marta.diaz','Marta'),(314,'2020-11-05','Modificar las personas de un reporte','Se modificaron las personas del reporte no. 1 del proyecto: Naturalmente','marta.diaz','Marta'),(315,'2020-11-05','Modificar reporte de un proyecto','Se modificó el reporte no. 1 del proyecto: Naturalmente','marta.diaz','Marta'),(316,'2020-11-05','Modificar las personas de un reporte','Se modificaron las personas del reporte no. 1 del proyecto: Naturalmente','marta.diaz','Marta'),(317,'2020-11-05','Modificar reporte de un proyecto','Se modificó el reporte no. 1 del proyecto: Naturalmente','marta.diaz','Marta'),(318,'2020-11-05','Modificar las personas de un reporte','Se modificaron las personas del reporte no. 1 del proyecto: Naturalmente','marta.diaz','Marta'),(319,'2020-11-05','Modificar reporte de un proyecto','Se modificó el reporte no. 1 del proyecto: Naturalmente','marta.diaz','Marta'),(320,'2020-11-05','Modificar las personas de un reporte','Se modificaron las personas del reporte no. 1 del proyecto: Naturalmente','marta.diaz','Marta'),(321,'2020-11-05','Modificar reporte de un proyecto','Se modificó el reporte no. 1 del proyecto: Naturalmente','marta.diaz','Marta'),(322,'2020-11-05','Modificar las personas de un reporte','Se modificaron las personas del reporte no. 1 del proyecto: Naturalmente','marta.diaz','Marta'),(323,'2020-11-05','Modificar reporte de un proyecto','Se modificó el reporte no. 1 del proyecto: Naturalmente','marta.diaz','Marta'),(324,'2020-11-05','Modificar las personas de un reporte','Se modificaron las personas del reporte no. 1 del proyecto: Naturalmente','marta.diaz','Marta'),(325,'2020-11-05','Agregar reporte de un proyecto','Se agregó el reporte no. 3 del proyecto: Naturalmente','marta.diaz','Marta'),(326,'2020-11-05','Agregar las personas de un reporte','Se agregaron las personas del reporte no. 3 del proyecto: Naturalmente','marta.diaz','Marta'),(327,'2020-11-05','Modificar reporte de un proyecto','Se modificó el reporte no. 3 del proyecto: Naturalmente','marta.diaz','Marta'),(328,'2020-11-05','Modificar las personas de un reporte','Se modificaron las personas del reporte no. 3 del proyecto: Naturalmente','marta.diaz','Marta'),(329,'2020-11-06','Agregar reporte de un proyecto','Se agregó el reporte no. 1 del proyecto: Naturalmente','marta.diaz','Marta'),(330,'2020-11-06','Agregar las personas de un reporte','Se agregaron las personas del reporte no. 1 del proyecto: Naturalmente','marta.diaz','Marta'),(331,'2020-11-06','Agregar reporte de un proyecto','Se agregó el reporte no. 2 del proyecto: Naturalmente','marta.diaz','Marta'),(332,'2020-11-06','Agregar las personas de un reporte','Se agregaron las personas del reporte no. 2 del proyecto: Naturalmente','marta.diaz','Marta'),(333,'2020-11-06','Agregar reporte de un proyecto','Se agregó el reporte no. 1 del proyecto: Naturalmente','marta.diaz','Marta'),(334,'2020-11-06','Agregar las personas de un reporte','Se agregaron las personas del reporte no. 1 del proyecto: Naturalmente','marta.diaz','Marta'),(335,'2020-11-06','Agregar reporte de un proyecto','Se agregó el reporte no. 2 del proyecto: Naturalmente','marta.diaz','Marta'),(336,'2020-11-06','Agregar las personas de un reporte','Se agregaron las personas del reporte no. 2 del proyecto: Naturalmente','marta.diaz','Marta'),(337,'2020-11-06','Agregar reporte de un proyecto','Se agregó el reporte no. 3 del proyecto: Naturalmente','marta.diaz','Marta'),(338,'2020-11-06','Agregar las personas de un reporte','Se agregaron las personas del reporte no. 3 del proyecto: Naturalmente','marta.diaz','Marta'),(339,'2020-11-06','Agregar reporte de un proyecto','Se agregó el reporte no. 4 del proyecto: Naturalmente','marta.diaz','Marta'),(340,'2020-11-06','Agregar las personas de un reporte','Se agregaron las personas del reporte no. 4 del proyecto: Naturalmente','marta.diaz','Marta'),(341,'2020-11-06','Agregar reporte de un proyecto','Se agregó el reporte no. 5 del proyecto: Naturalmente','marta.diaz','Marta'),(342,'2020-11-06','Agregar las personas de un reporte','Se agregaron las personas del reporte no. 5 del proyecto: Naturalmente','marta.diaz','Marta'),(343,'2020-11-06','Agregar reporte de un proyecto','Se agregó el reporte no. 6 del proyecto: Naturalmente','marta.diaz','Marta'),(344,'2020-11-06','Agregar las personas de un reporte','Se agregaron las personas del reporte no. 6 del proyecto: Naturalmente','marta.diaz','Marta'),(345,'2020-11-06','Agregar reporte de un proyecto','Se agregó el reporte no. 7 del proyecto: Naturalmente','marta.diaz','Marta'),(346,'2020-11-06','Agregar las personas de un reporte','Se agregaron las personas del reporte no. 7 del proyecto: Naturalmente','marta.diaz','Marta'),(347,'2020-11-06','Agregar reporte de un proyecto','Se agregó el reporte no. 8 del proyecto: Naturalmente','marta.diaz','Marta'),(348,'2020-11-06','Agregar las personas de un reporte','Se agregaron las personas del reporte no. 8 del proyecto: Naturalmente','marta.diaz','Marta'),(349,'2020-11-06','Agregar reporte de un proyecto','Se agregó el reporte no. 9 del proyecto: Naturalmente','marta.diaz','Marta'),(350,'2020-11-06','Agregar las personas de un reporte','Se agregaron las personas del reporte no. 9 del proyecto: Naturalmente','marta.diaz','Marta'),(351,'2020-11-06','Agregar reporte de un proyecto','Se agregó el reporte no. 10 del proyecto: Naturalmente','marta.diaz','Marta'),(352,'2020-11-06','Agregar las personas de un reporte','Se agregaron las personas del reporte no. 10 del proyecto: Naturalmente','marta.diaz','Marta'),(353,'2020-11-06','Agregar reporte de un proyecto','Se agregó el reporte no. 11 del proyecto: Naturalmente','marta.diaz','Marta'),(354,'2020-11-06','Agregar las personas de un reporte','Se agregaron las personas del reporte no. 11 del proyecto: Naturalmente','marta.diaz','Marta'),(355,'2020-11-06','Agregar reporte de un proyecto','Se agregó el reporte no. 12 del proyecto: Naturalmente','marta.diaz','Marta'),(356,'2020-11-06','Agregar las personas de un reporte','Se agregaron las personas del reporte no. 12 del proyecto: Naturalmente','marta.diaz','Marta'),(357,'2020-11-06','Agregar reporte de un proyecto','Se agregó el reporte no. 13 del proyecto: Naturalmente','marta.diaz','Marta'),(358,'2020-11-06','Agregar las personas de un reporte','Se agregaron las personas del reporte no. 13 del proyecto: Naturalmente','marta.diaz','Marta'),(359,'2020-11-06','Agregar reporte de un proyecto','Se agregó el reporte no. 14 del proyecto: Naturalmente','marta.diaz','Marta'),(360,'2020-11-06','Agregar las personas de un reporte','Se agregaron las personas del reporte no. 14 del proyecto: Naturalmente','marta.diaz','Marta'),(361,'2020-11-06','Agregar reporte de un proyecto','Se agregó el reporte no. 15 del proyecto: Naturalmente','marta.diaz','Marta'),(362,'2020-11-06','Agregar las personas de un reporte','Se agregaron las personas del reporte no. 15 del proyecto: Naturalmente','marta.diaz','Marta'),(363,'2020-11-06','Agregar reporte de un proyecto','Se agregó el reporte no. 16 del proyecto: Naturalmente','marta.diaz','Marta'),(364,'2020-11-06','Agregar las personas de un reporte','Se agregaron las personas del reporte no. 16 del proyecto: Naturalmente','marta.diaz','Marta'),(365,'2020-11-06','Agregar reporte de un proyecto','Se agregó el reporte no. 17 del proyecto: Naturalmente','marta.diaz','Marta'),(366,'2020-11-06','Agregar las personas de un reporte','Se agregaron las personas del reporte no. 17 del proyecto: Naturalmente','marta.diaz','Marta'),(367,'2020-11-06','Agregar reporte de un proyecto','Se agregó el reporte no. 18 del proyecto: Naturalmente','marta.diaz','Marta'),(368,'2020-11-06','Agregar las personas de un reporte','Se agregaron las personas del reporte no. 18 del proyecto: Naturalmente','marta.diaz','Marta'),(369,'2020-11-06','Agregar reporte de un proyecto','Se agregó el reporte no. 19 del proyecto: Naturalmente','marta.diaz','Marta'),(370,'2020-11-06','Agregar las personas de un reporte','Se agregaron las personas del reporte no. 19 del proyecto: Naturalmente','marta.diaz','Marta'),(371,'2020-11-06','Agregar reporte de un proyecto','Se agregó el reporte no. 20 del proyecto: Naturalmente','marta.diaz','Marta'),(372,'2020-11-06','Agregar las personas de un reporte','Se agregaron las personas del reporte no. 20 del proyecto: Naturalmente','marta.diaz','Marta'),(373,'2020-11-06','Agregar reporte de un proyecto','Se agregó el reporte no. 1 del proyecto: Naturalmente','marta.diaz','Marta'),(374,'2020-11-06','Agregar las personas de un reporte','Se agregaron las personas del reporte no. 1 del proyecto: Naturalmente','marta.diaz','Marta'),(375,'2020-11-06','Agregar reporte de un proyecto','Se agregó el reporte no. 2 del proyecto: Naturalmente','marta.diaz','Marta'),(376,'2020-11-06','Agregar las personas de un reporte','Se agregaron las personas del reporte no. 2 del proyecto: Naturalmente','marta.diaz','Marta'),(377,'2020-11-06','Agregar reporte de un proyecto','Se agregó el reporte no. 1 del proyecto: Naturalmente','marta.diaz','Marta'),(378,'2020-11-06','Agregar las personas de un reporte','Se agregaron las personas del reporte no. 1 del proyecto: Naturalmente','marta.diaz','Marta'),(379,'2020-11-06','Agregar reporte de un proyecto','Se agregó el reporte no. 2 del proyecto: Naturalmente','marta.diaz','Marta'),(380,'2020-11-06','Agregar las personas de un reporte','Se agregaron las personas del reporte no. 2 del proyecto: Naturalmente','marta.diaz','Marta'),(381,'2020-11-06','Agregar reporte de un proyecto','Se agregó el reporte no. 1 del proyecto: Naturalmente','marta.diaz','Marta'),(382,'2020-11-06','Agregar las personas de un reporte','Se agregaron las personas del reporte no. 1 del proyecto: Naturalmente','marta.diaz','Marta'),(403,'2020-11-06','Agregar reporte de un proyecto','Se agregó el reporte no. 2 del proyecto: Naturalmente','marta.diaz','Marta'),(404,'2020-11-06','Agregar las personas de un reporte','Se agregaron las personas del reporte no. 2 del proyecto: Naturalmente','marta.diaz','Marta'),(405,'2020-11-06','Agregar reporte de un proyecto','Se agregó el reporte no. 3 del proyecto: Naturalmente','marta.diaz','Marta'),(406,'2020-11-06','Agregar las personas de un reporte','Se agregaron las personas del reporte no. 3 del proyecto: Naturalmente','marta.diaz','Marta'),(410,'2020-11-06','Agregar reporte de un proyecto','Se agregó el reporte no. 4 del proyecto: Naturalmente','marta.diaz','Marta'),(411,'2020-11-06','Agregar las personas de un reporte','Se agregaron las personas del reporte no. 4 del proyecto: Naturalmente','marta.diaz','Marta'),(429,'2020-11-06','Modificar reporte de un proyecto','Se modificó el reporte no. 4 del proyecto: Naturalmente','marta.diaz','Marta'),(430,'2020-11-06','Modificar las personas de un reporte','Se modificaron las personas del reporte no. 4 del proyecto: Naturalmente','marta.diaz','Marta'),(438,'2020-11-06','Modificar reporte de un proyecto','Se modificó el reporte no. 4 del proyecto: Naturalmente','marta.diaz','Marta'),(439,'2020-11-06','Modificar las personas de un reporte','Se modificaron las personas del reporte no. 4 del proyecto: Naturalmente','marta.diaz','Marta'),(440,'2020-11-06','Modificar reporte de un proyecto','Se modificó el reporte no. 4 del proyecto: Naturalmente','marta.diaz','Marta'),(441,'2020-11-06','Modificar las personas de un reporte','Se modificaron las personas del reporte no. 4 del proyecto: Naturalmente','marta.diaz','Marta'),(442,'2020-11-06','Agregar reporte de un proyecto','Se agregó el reporte no. 5 del proyecto: Naturalmente','marta.diaz','Marta'),(443,'2020-11-06','Agregar las personas de un reporte','Se agregaron las personas del reporte no. 5 del proyecto: Naturalmente','marta.diaz','Marta'),(444,'2020-11-06','Agregar reporte de un proyecto','Se agregó el reporte no. 6 del proyecto: Naturalmente','marta.diaz','Marta'),(445,'2020-11-06','Agregar las personas de un reporte','Se agregaron las personas del reporte no. 6 del proyecto: Naturalmente','marta.diaz','Marta'),(446,'2020-11-06','Agregar reporte de un proyecto','Se agregó el reporte no. 7 del proyecto: Naturalmente','marta.diaz','Marta'),(447,'2020-11-06','Agregar las personas de un reporte','Se agregaron las personas del reporte no. 7 del proyecto: Naturalmente','marta.diaz','Marta'),(448,'2020-11-06','Agregar reporte de un proyecto','Se agregó el reporte no. 1 del proyecto: Naturalmente','marta.diaz','Marta'),(449,'2020-11-06','Agregar las personas de un reporte','Se agregaron las personas del reporte no. 1 del proyecto: Naturalmente','marta.diaz','Marta'),(450,'2020-11-06','Agregar reporte de un proyecto','Se agregó el reporte no. 1 del proyecto: Naturalmente','marta.diaz','Marta'),(451,'2020-11-06','Agregar las personas de un reporte','Se agregaron las personas del reporte no. 1 del proyecto: Naturalmente','marta.diaz','Marta'),(452,'2020-11-06','Modificar reporte de un proyecto','Se modificó el reporte no. 1 del proyecto: Naturalmente','marta.diaz','Marta'),(453,'2020-11-06','Modificar las personas de un reporte','Se modificaron las personas del reporte no. 1 del proyecto: Naturalmente','marta.diaz','Marta'),(454,'2020-11-06','Agregar reporte de un proyecto','Se agregó el reporte no. 2 del proyecto: Naturalmente','marta.diaz','Marta'),(455,'2020-11-06','Agregar las personas de un reporte','Se agregaron las personas del reporte no. 2 del proyecto: Naturalmente','marta.diaz','Marta'),(456,'2020-11-06','Agregar reporte de un proyecto','Se agregó el reporte no. 3 del proyecto: Naturalmente','marta.diaz','Marta'),(457,'2020-11-06','Agregar las personas de un reporte','Se agregaron las personas del reporte no. 3 del proyecto: Naturalmente','marta.diaz','Marta'),(458,'2020-11-07','Agregar reporte de un proyecto','Se agregó el reporte no. 1 del proyecto: Naturalmente','marta.diaz','Marta'),(459,'2020-11-07','Agregar las personas de un reporte','Se agregaron las personas del reporte no. 1 del proyecto: Naturalmente','marta.diaz','Marta'),(460,'2020-11-07','Agregar reporte de un proyecto','Se agregó el reporte no. 2 del proyecto: Naturalmente','marta.diaz','Marta'),(461,'2020-11-07','Agregar las personas de un reporte','Se agregaron las personas del reporte no. 2 del proyecto: Naturalmente','marta.diaz','Marta'),(462,'2020-11-07','Agregar reporte de un proyecto','Se agregó el reporte no. 3 del proyecto: Naturalmente','marta.diaz','Marta'),(463,'2020-11-07','Agregar las personas de un reporte','Se agregaron las personas del reporte no. 3 del proyecto: Naturalmente','marta.diaz','Marta'),(464,'2020-11-07','Agregar reporte de un proyecto','Se agregó el reporte no. 4 del proyecto: Naturalmente','marta.diaz','Marta'),(465,'2020-11-07','Agregar las personas de un reporte','Se agregaron las personas del reporte no. 4 del proyecto: Naturalmente','marta.diaz','Marta'),(466,'2020-11-12','Insertar Tipo de Contrato','Se insertó una nuevo tipo de contrato con el nombre: Contrato Música Original','marta.diaz','Marta'),(467,'2020-11-12','Insertar Profesión','Se insertó una nueva profesión con el nombre: Músico','marta.diaz','Marta'),(468,'2020-11-12','Insertar concepto','Se insertó una nuevo concepto con el nombre: Músico','marta.diaz','Marta'),(469,'2020-11-13','Modificar el Tipo de Contrato','Se modificó el tipo de contrato con el nombre:  Contrato Alimentación Trabajador por Cuenta Propia','marta.diaz','Marta'),(470,'2020-11-13','Modificar el Tipo de Contrato','Se modificó el tipo de contrato con el nombre:  Contrato Trabajador por Cuenta Propia','marta.diaz','Marta'),(471,'2020-11-13','Insertar Tipo de Contrato','Se insertó una nuevo tipo de contrato con el nombre: Contrato Alimentación Trabajador por Cuenta Propia','marta.diaz','Marta'),(472,'2020-11-13','Modificar el concepto','Se modificó el concepto con el nombre:  Alimentación','marta.diaz','Marta'),(473,'2020-11-13','Modificar los datos generales de un proyecto','Se modificó los datos generales del proyecto: Naturalmente','marta.diaz','Marta'),(474,'2020-11-13','Modificación de las contrataciones de un proyecto','Se modificaron las contrataciones del proyecto: Naturalmente','marta.diaz','Marta'),(475,'2020-11-13','Agregar reporte de un proyecto','Se agregó el reporte no. 1 del proyecto: Naturalmente','marta.diaz','Marta'),(476,'2020-11-13','Agregar las personas de un reporte','Se agregaron las personas del reporte no. 1 del proyecto: Naturalmente','marta.diaz','Marta'),(477,'2020-11-13','Insertar Usuario','Se insertó el usuario: Mabel Sulay Castillo Mompie','marta.diaz','Marta'),(478,'2020-11-13','Acceso al Formulario','Acceso al Formulario resetear password','marta.diaz','Marta'),(479,'2020-11-13','Modificar Usuario','Se modificó el usuario: Marta Díaz Rodríguez','marta.diaz','Marta'),(480,'2020-11-14','Cambio de contraseña de Usuario','Se cambió la contraseña del usuario: Marta Díaz Rodríguez','marta.diaz','Marta'),(481,'2020-11-14','Acceso al Formulario','Acceso al Formulario resetear password','marta.diaz','Marta'),(482,'2020-11-14','Resetear contraseña de Usuario','Se reseteó la contraseña del usuario: Mabel Sulay Castillo Mompie','marta.diaz','Marta'),(483,'2020-11-14','Modificar Usuario','Se modificó el usuario: Marta Díaz Rodríguez','marta.diaz','Marta'),(484,'2020-11-15','Cambio de contraseña de Usuario','Se cambió la contraseña del usuario: Marta Díaz Rodríguez','marta.diaz','Marta'),(485,'2020-11-15','Insertar Tipo de Contrato','Se insertó una nuevo tipo de contrato con el nombre: Contrato Actor','marta.diaz','Marta'),(486,'2020-11-15','Insertar Profesión','Se insertó una nueva profesión con el nombre: Actor','marta.diaz','Marta'),(487,'2020-11-15','Insertar concepto','Se insertó una nuevo concepto con el nombre: Actor','marta.diaz','Marta'),(488,'2020-11-15','Insertar Tipo de Contrato','Se insertó una nuevo tipo de contrato con el nombre: Contrato Asistente de Producción','marta.diaz','Marta'),(489,'2020-11-15','Modificar el concepto','Se modificó el concepto con el nombre:  Asistente de Producción','marta.diaz','Marta'),(490,'2020-11-15','Modificar Usuario','Se modificó el usuario: Mabel Sulay Castillo Mompie','marta.diaz','Marta'),(491,'2020-11-15','Modificar Usuario','Se modificó el usuario: Mabel Sulay Castillo Mompie','marta.diaz','Marta'),(492,'2020-11-16','Modificar Persona','Se modificó la persona: Ilse Hernández Sariol','marta.diaz','Marta'),(495,'2020-11-17','Insertar concepto','Se insertó una nuevo concepto con el nombre: Ambientador','marta.diaz','Marta'),(496,'2020-11-17','Insertar Profesión','Se insertó una nueva profesión con el nombre: Ambientador','marta.diaz','Marta'),(497,'2020-11-17','Eliminar profesión','Se eliminó la profesión con el nombre: Ambientador','marta.diaz','Marta'),(498,'2020-11-17','Insertar concepto','Se insertó una nuevo concepto con el nombre: Anotadora','marta.diaz','Marta'),(499,'2020-11-17','Insertar concepto','Se insertó una nuevo concepto con el nombre: Asesor Habituales','marta.diaz','Marta'),(500,'2020-11-17','Insertar concepto','Se insertó una nuevo concepto con el nombre: Asesor Dramatizados','marta.diaz','Marta'),(501,'2020-11-17','Modificar el concepto','Se modificó el concepto con el nombre:  Asistente de Dirección','marta.diaz','Marta'),(502,'2020-11-17','Modificar el concepto','Se modificó el concepto con el nombre:  Asistente de Producción','marta.diaz','Marta'),(503,'2020-11-17','Insertar concepto','Se insertó una nuevo concepto con el nombre: Asistente a la Producción','marta.diaz','Marta'),(504,'2020-11-17','Insertar concepto','Se insertó una nuevo concepto con el nombre: Camarógrafo','marta.diaz','Marta'),(505,'2020-11-17','Insertar concepto','Se insertó una nuevo concepto con el nombre: Data Manager','marta.diaz','Marta'),(506,'2020-11-17','Insertar concepto','Se insertó una nuevo concepto con el nombre: Director de Fotografía ','marta.diaz','Marta'),(507,'2020-11-17','Insertar concepto','Se insertó una nuevo concepto con el nombre: Director de Arte','marta.diaz','Marta'),(508,'2020-11-17','Insertar concepto','Se insertó una nuevo concepto con el nombre: Diseñador de Vestuario','marta.diaz','Marta'),(509,'2020-11-17','Modificar el concepto','Se modificó el concepto con el nombre:  Vestuario','marta.diaz','Marta'),(510,'2020-11-17','Insertar concepto','Se insertó una nuevo concepto con el nombre: Diseñador Gráfico','marta.diaz','Marta'),(511,'2020-11-17','Insertar concepto','Se insertó una nuevo concepto con el nombre: Diseñador de Luces','marta.diaz','Marta'),(512,'2020-11-17','Insertar concepto','Se insertó una nuevo concepto con el nombre: Escenografo','marta.diaz','Marta'),(513,'2020-11-17','Insertar concepto','Se insertó una nuevo concepto con el nombre: Montador','marta.diaz','Marta'),(514,'2020-11-17','Modificar el concepto','Se modificó el concepto con el nombre:  Editor','marta.diaz','Marta'),(515,'2020-11-17','Insertar concepto','Se insertó una nuevo concepto con el nombre: Especialista en Efectos Especiales','marta.diaz','Marta'),(516,'2020-11-17','Modificar el concepto','Se modificó el concepto con el nombre:  Grabador TV','marta.diaz','Marta'),(517,'2020-11-17','Insertar concepto','Se insertó una nuevo concepto con el nombre: Grabador Asistente','marta.diaz','Marta'),(518,'2020-11-17','Insertar concepto','Se insertó una nuevo concepto con el nombre: Tramoya','marta.diaz','Marta'),(519,'2020-11-17','Insertar concepto','Se insertó una nuevo concepto con el nombre: Especialista Principal','marta.diaz','Marta'),(520,'2020-11-17','Insertar concepto','Se insertó una nuevo concepto con el nombre: Luminotécnico ','marta.diaz','Marta'),(521,'2020-11-17','Insertar concepto','Se insertó una nuevo concepto con el nombre: Luminotécnico/Electricista  ','marta.diaz','Marta'),(522,'2020-11-17','Insertar concepto','Se insertó una nuevo concepto con el nombre: Maquillista Principal','marta.diaz','Marta'),(523,'2020-11-17','Modificar el concepto','Se modificó el concepto con el nombre:  Maquillaje y Peluquería','marta.diaz','Marta'),(524,'2020-11-17','Insertar concepto','Se insertó una nuevo concepto con el nombre: Utilero','marta.diaz','Marta'),(525,'2020-11-17','Modificar el concepto','Se modificó el concepto con el nombre:  Director General ','marta.diaz','Marta'),(526,'2020-11-17','Modificar el concepto','Se modificó el concepto con el nombre:  Guionista','marta.diaz','Marta'),(527,'2020-11-17','Modificar el concepto','Se modificó el concepto con el nombre:  Productor General','marta.diaz','Marta'),(536,'2020-11-18','Modificar los datos generales de un proyecto','Se modificó los datos generales del proyecto: Naturalmente','marta.diaz','Marta'),(537,'2020-11-18','Modificación de las contrataciones de un proyecto','Se modificaron las contrataciones del proyecto: Naturalmente','marta.diaz','Marta'),(538,'2020-11-18','Modificar los datos generales de un proyecto','Se modificó los datos generales del proyecto: Naturalmente','marta.diaz','Marta'),(539,'2020-11-18','Modificación de las contrataciones de un proyecto','Se modificaron las contrataciones del proyecto: Naturalmente','marta.diaz','Marta'),(540,'2020-11-18','Modificar los datos generales de un proyecto','Se modificó los datos generales del proyecto: Naturalmente','marta.diaz','Marta'),(541,'2020-11-18','Modificación de las contrataciones de un proyecto','Se modificaron las contrataciones del proyecto: Naturalmente','marta.diaz','Marta'),(542,'2020-11-18','Modificar los datos generales de un proyecto','Se modificó los datos generales del proyecto: Naturalmente','marta.diaz','Marta'),(543,'2020-11-18','Modificación de las contrataciones de un proyecto','Se modificaron las contrataciones del proyecto: Naturalmente','marta.diaz','Marta'),(544,'2020-11-18','Modificar los datos generales de un proyecto','Se modificó los datos generales del proyecto: Naturalmente','marta.diaz','Marta'),(545,'2020-11-18','Modificación de las contrataciones de un proyecto','Se modificaron las contrataciones del proyecto: Naturalmente','marta.diaz','Marta'),(546,'2020-11-18','Modificar el concepto','Se modificó el concepto con el nombre:  Guionista','marta.diaz','Marta'),(547,'2020-11-21','Insertar Persona','Se insertó la persona: Coralia Veloz Martinez','marta.diaz','Marta'),(548,'2020-11-21','Modificar Persona','Se modificó la persona: Coralia Veloz Martinez','marta.diaz','Marta'),(549,'2020-11-21','Modificar los datos generales de un proyecto','Se modificó los datos generales del proyecto: Naturalmente','marta.diaz','Marta'),(550,'2020-11-21','Modificación de las contrataciones de un proyecto','Se modificaron las contrataciones del proyecto: Naturalmente','marta.diaz','Marta'),(551,'2020-11-21','Modificar el Tipo de Contrato','Se modificó el tipo de contrato con el nombre:  Contrato Asistente a la Producción','marta.diaz','Marta'),(552,'2020-11-21','Modificar el concepto','Se modificó el concepto con el nombre:  Asistente a la Producción','marta.diaz','Marta'),(553,'2020-11-21','Modificar el concepto','Se modificó el concepto con el nombre:  Asistente a la Producción','marta.diaz','Marta'),(554,'2020-11-21','Modificar el concepto','Se modificó el concepto con el nombre:  Actor','marta.diaz','Marta'),(555,'2020-11-21','Modificar el concepto','Se modificó el concepto con el nombre:  Actor','marta.diaz','Marta'),(556,'2020-11-22','Modificar el Tipo de Contrato','Se modificó el tipo de contrato con el nombre:  Contrato Trabajador General por Cuenta Propia','marta.diaz','Marta'),(557,'2020-11-22','Insertar Tipo de Contrato','Se insertó una nuevo tipo de contrato con el nombre: Contrato Transporte por Cuenta Propia','marta.diaz','Marta'),(558,'2020-11-22','Modificar el concepto','Se modificó el concepto con el nombre:  Transportación','marta.diaz','Marta'),(559,'2020-11-22','Modificar Persona','Se modificó la persona: Michel Batista Leyva','marta.diaz','Marta'),(560,'2020-11-22','Modificar los datos generales de un proyecto','Se modificó los datos generales del proyecto: Naturalmente','marta.diaz','Marta'),(561,'2020-11-22','Modificación de las contrataciones de un proyecto','Se modificaron las contrataciones del proyecto: Naturalmente','marta.diaz','Marta'),(562,'2020-11-22','Insertar Persona','Se insertó la persona: Yosley García Cruz','marta.diaz','Marta'),(563,'2020-11-22','Modificar los datos generales de un proyecto','Se modificó los datos generales del proyecto: Naturalmente','marta.diaz','Marta'),(564,'2020-11-22','Modificación de las contrataciones de un proyecto','Se modificaron las contrataciones del proyecto: Naturalmente','marta.diaz','Marta'),(565,'2020-11-23','Insertar Persona','Se insertó la persona: Alexis González Díaz de Villegas','marta.diaz','Marta'),(566,'2020-11-23','Modificar los datos generales de un proyecto','Se modificó los datos generales del proyecto: Naturalmente','marta.diaz','Marta'),(567,'2020-11-23','Modificación de las contrataciones de un proyecto','Se modificaron las contrataciones del proyecto: Naturalmente','marta.diaz','Marta'),(568,'2020-11-23','Insertar Persona','Se insertó la persona: Dariel Rilberto González Boggiano','marta.diaz','Marta'),(569,'2020-11-23','Modificar los datos generales de un proyecto','Se modificó los datos generales del proyecto: Naturalmente','marta.diaz','Marta'),(570,'2020-11-23','Modificación de las contrataciones de un proyecto','Se modificaron las contrataciones del proyecto: Naturalmente','marta.diaz','Marta'),(571,'2020-11-25','Insertar Banco','Se insertó una nuevo banco con el nombre: Metropolitano','marta.diaz','Marta'),(572,'2020-11-25','Insertar Banco','Se insertó una nuevo banco con el nombre: BPA','marta.diaz','Marta'),(573,'2020-11-25','Insertar Banco','Se insertó una nuevo banco con el nombre: BANDEC','marta.diaz','Marta'),(574,'2020-11-25','Insertar Banco','Se insertó una nuevo banco con el nombre: R','marta.diaz','Marta'),(575,'2020-11-25','Modificar banco','Se modificó el banco con el nombre:  R1','marta.diaz','Marta'),(576,'2020-11-25','Eliminar banco','Se eliminó el banco con el nombre: R1','marta.diaz','Marta'),(577,'2020-11-25','Insertar Persona','Se insertó la persona: Alain Hernández Ortiz','marta.diaz','Marta'),(578,'2020-11-25','Eliminar persona','Se elimino la persona: Alain Hernández Ortiz','marta.diaz','Marta'),(579,'2020-11-25','Insertar Persona','Se insertó la persona: w w w','marta.diaz','Marta'),(580,'2020-11-25','Eliminar persona','Se elimino la persona: w w w','marta.diaz','Marta'),(581,'2020-11-25','Insertar Persona','Se insertó la persona: s s s','marta.diaz','Marta'),(582,'2020-11-25','Eliminar persona','Se elimino la persona: s s s','marta.diaz','Marta'),(583,'2020-11-25','Insertar Persona','Se insertó la persona: a a a','marta.diaz','Marta'),(584,'2020-11-25','Eliminar persona','Se elimino la persona: a a a','marta.diaz','Marta'),(585,'2020-11-25','Insertar Persona','Se insertó la persona: s s s','marta.diaz','Marta'),(586,'2020-11-25','Eliminar persona','Se elimino la persona: s s s','marta.diaz','Marta'),(587,'2020-11-25','Insertar Persona','Se insertó la persona: a a a','marta.diaz','Marta'),(588,'2020-11-25','Eliminar persona','Se elimino la persona: a a a','marta.diaz','Marta'),(589,'2020-11-25','Insertar Persona','Se insertó la persona: a a a','marta.diaz','Marta'),(590,'2020-11-25','Eliminar persona','Se elimino la persona: a a a','marta.diaz','Marta'),(591,'2020-11-25','Insertar Persona','Se insertó la persona: ds d d','marta.diaz','Marta'),(592,'2020-11-25','Eliminar persona','Se elimino la persona: ds d d','marta.diaz','Marta'),(593,'2020-11-25','Insertar Persona','Se insertó la persona: d d d','marta.diaz','Marta'),(594,'2020-11-25','Modificar Persona','Se modificó la persona: d d d','marta.diaz','Marta'),(595,'2020-11-25','Modificar Persona','Se modificó la persona: d d d','marta.diaz','Marta'),(596,'2020-11-25','Modificar Persona','Se modificó la persona: d d d','marta.diaz','Marta'),(597,'2020-11-25','Modificar Persona','Se modificó la persona: d d d','marta.diaz','Marta'),(598,'2020-11-25','Modificar Persona','Se modificó la persona: Yosley García Cruz','marta.diaz','Marta'),(599,'2020-11-25','Modificar Persona','Se modificó la persona: Yosley García Cruz','marta.diaz','Marta'),(600,'2020-11-25','Modificar Persona','Se modificó la persona: Yosley García Cruz','marta.diaz','Marta'),(601,'2020-11-25','Modificar Persona','Se modificó la persona: Dariel Rilberto González Boggiano','marta.diaz','Marta'),(602,'2020-11-26','Agregar reporte de un proyecto','Se agregó el reporte no. 2 del proyecto: Naturalmente','marta.diaz','Marta'),(603,'2020-11-26','Agregar las personas de un reporte','Se agregaron las personas del reporte no. 2 del proyecto: Naturalmente','marta.diaz','Marta'),(604,'2020-11-26','Agregar reporte de un proyecto','Se agregó el reporte no. 3 del proyecto: Naturalmente','marta.diaz','Marta'),(605,'2020-11-26','Agregar las personas de un reporte','Se agregaron las personas del reporte no. 3 del proyecto: Naturalmente','marta.diaz','Marta'),(606,'2020-11-28','Eliminar Usuario','Se eliminó el usuario: Mabel Sulay Castillo Mompie','marta.diaz','Marta'),(607,'2020-11-30','Insertar Persona','Se insertó la persona: Javier Gomez Sanchez','marta.diaz','Marta'),(608,'2020-11-30','Insertar Persona','Se insertó la persona: Laura Ana Torres Oro','marta.diaz','Marta'),(609,'2020-11-30','Insertar Persona','Se insertó la persona: Jorge Luis Frias Garcia','marta.diaz','Marta'),(610,'2020-11-30','Insertar concepto','Se insertó una nuevo concepto con el nombre: Imágenes de apoyo','marta.diaz','Marta'),(611,'2020-11-30','Insertar Persona','Se insertó la persona: Maykel  Valdés Duharte','marta.diaz','Marta'),(612,'2020-11-30','Insertar Profesión','Se insertó una nueva profesión con el nombre: Data Manager','marta.diaz','Marta'),(613,'2020-11-30','Insertar Persona','Se insertó la persona: Yanaris Bravo Lima','marta.diaz','Marta'),(614,'2020-11-30','Insertar Persona','Se insertó la persona: Yanaisa Errasti  Bueno','marta.diaz','Marta'),(615,'2020-11-30','Insertar Persona','Se insertó la persona: Leidy Nodas Dávila','marta.diaz','Marta'),(616,'2020-11-30','Insertar Profesión','Se insertó una nueva profesión con el nombre: Chofer','marta.diaz','Marta'),(617,'2020-11-30','Modificar Persona','Se modificó la persona: Leidy Nodas Dávila','marta.diaz','Marta'),(618,'2020-11-30','Insertar Persona','Se insertó la persona: Robin Ramírez Sánchez','marta.diaz','Marta'),(619,'2020-11-30','Insertar Persona','Se insertó la persona: Eugenio Alejandro Ricardo Sánchez','marta.diaz','Marta'),(620,'2020-11-30','Insertar Persona','Se insertó la persona: Alexis Antonio Leyva Moreno','marta.diaz','Marta'),(621,'2020-11-30','Insertar Persona','Se insertó la persona: Ary Ernesto Vincench Rodríguez','marta.diaz','Marta'),(622,'2020-12-04','Insertar Persona','Se insertó la persona: Rosa Miriam Elizalde  Zorrilla','marta.diaz','Marta'),(623,'2020-12-04','Insertar Persona','Se insertó la persona: Adrian Enrique  Migueles  Álvarez','marta.diaz','Marta'),(624,'2020-12-04','Insertar concepto','Se insertó una nuevo concepto con el nombre: Diseno de Animacion','marta.diaz','Marta'),(625,'2020-12-04','Insertar Persona','Se insertó la persona: Kalia María Venereo  Venereo León','marta.diaz','Marta'),(626,'2020-12-04','Insertar Persona','Se insertó la persona: Beatriz  Pérez  Alonso','marta.diaz','Marta'),(627,'2020-12-04','Insertar Persona','Se insertó la persona: Rebeca De Los Ángeles Zamora Sánchez  Zamora','marta.diaz','Marta'),(628,'2020-12-04','Insertar Persona','Se insertó la persona: Flor De Paz   De Lázaro Cubillas','marta.diaz','Marta'),(629,'2020-12-04','Insertar Persona','Se insertó la persona: Iroel Vázquez González Vázquez González','marta.diaz','Marta'),(630,'2020-12-04','Insertar concepto','Se insertó una nuevo concepto con el nombre: Musicalizador','marta.diaz','Marta'),(631,'2020-12-04','Insertar Persona','Se insertó la persona: Darian  Perdomo  González','marta.diaz','Marta'),(632,'2020-12-04','Insertar Persona','Se insertó la persona: Dario Gabriel   Sánchez García','marta.diaz','Marta'),(633,'2020-12-04','Insertar concepto','Se insertó una nuevo concepto con el nombre: Locutor','marta.diaz','Marta'),(634,'2020-12-04','Insertar Persona','Se insertó la persona: Ernesto Ruiz Ramos','marta.diaz','Marta'),(635,'2020-12-04','Insertar concepto','Se insertó una nuevo concepto con el nombre: Animacion','marta.diaz','Marta'),(636,'2020-12-04','Insertar Persona','Se insertó la persona: Aldo Alejandro   Cruces Newhall','marta.diaz','Marta'),(637,'2020-12-04','Insertar Tipo de Proyecto','Se insertó una nuevo tipo de proyecto con el nombre: Informativo','marta.diaz','Marta'),(638,'2020-12-04','Agregar los datos generales de un proyecto','Se agregó los datos generales del proyecto: Dominio Cuba','marta.diaz','Marta'),(639,'2020-12-04','Modificar Persona','Se modificó la persona: Iroel  Vázquez González','marta.diaz','Marta'),(640,'2020-12-04','Modificar Persona','Se modificó la persona: Ary Ernesto Vincench Rodríguez','marta.diaz','Marta'),(641,'2020-12-05','Modificar los datos generales de un proyecto','Se modificó los datos generales del proyecto: Dominio Cuba','marta.diaz','Marta'),(642,'2020-12-05','Modificación de las contrataciones de un proyecto','Se modificaron las contrataciones del proyecto: Dominio Cuba','marta.diaz','Marta'),(643,'2020-12-05','Modificar los datos generales de un proyecto','Se modificó los datos generales del proyecto: Dominio Cuba','marta.diaz','Marta'),(644,'2020-12-05','Modificación de las contrataciones de un proyecto','Se modificaron las contrataciones del proyecto: Dominio Cuba','marta.diaz','Marta'),(645,'2020-12-05','Modificar los datos generales de un proyecto','Se modificó los datos generales del proyecto: Dominio Cuba','marta.diaz','Marta'),(646,'2020-12-05','Modificación de las contrataciones de un proyecto','Se modificaron las contrataciones del proyecto: Dominio Cuba','marta.diaz','Marta'),(647,'2020-12-05','Modificar Persona','Se modificó la persona: Ary Ernesto Vincench Rodríguez','marta.diaz','Marta'),(648,'2020-12-05','Modificar el Tipo de Contrato','Se modificó el tipo de contrato con el nombre:  Contrato Director','marta.diaz','Marta'),(649,'2020-12-05','Modificar Persona','Se modificó la persona: Adrian Enrique  Migueles  Álvarez','marta.diaz','Marta'),(650,'2020-12-05','Insertar Persona','Se insertó la persona: Yanela Barbara  Bauza Aguilar','marta.diaz','Marta'),(651,'2020-12-05','Insertar Persona','Se insertó la persona: Maria Julia Jacomino  de Fuentes','marta.diaz','Marta'),(652,'2020-12-05','Insertar concepto','Se insertó una nuevo concepto con el nombre: Efectos Digitales','marta.diaz','Marta'),(653,'2020-12-05','Insertar Persona','Se insertó la persona: Oscar Sanchez de la Yera','marta.diaz','Marta'),(654,'2020-12-05','Insertar Persona','Se insertó la persona: Hector Manuel Reyes  Tarrago','marta.diaz','Marta'),(655,'2020-12-05','Insertar Persona','Se insertó la persona: Luz Crecencia Reyes Tarrago','marta.diaz','Marta'),(656,'2020-12-05','Insertar Tipo de Proyecto','Se insertó una nuevo tipo de proyecto con el nombre: Cinematografico','marta.diaz','Marta'),(657,'2020-12-05','Agregar los datos generales de un proyecto','Se agregó los datos generales del proyecto: Documental Capaces','marta.diaz','Marta'),(658,'2020-12-05','Agregar las contrataciones del personal artístico de un proyecto','Se agregaron las contrataciones del personal artístico del proyecto: Documental Capaces','marta.diaz','Marta'),(659,'2020-12-05','Modificar los datos generales de un proyecto','Se modificó los datos generales del proyecto: Documental Capaces','marta.diaz','Marta'),(660,'2020-12-05','Modificación de las contrataciones de un proyecto','Se modificaron las contrataciones del proyecto: Documental Capaces','marta.diaz','Marta'),(661,'2020-12-05','Insertar Persona','Se insertó la persona: José Antonio López  López  Díaz','marta.diaz','Marta'),(662,'2020-12-05','Insertar Persona','Se insertó la persona: Damián   Cordero Gómez','marta.diaz','Marta'),(663,'2020-12-05','Insertar Persona','Se insertó la persona: Ivette   Acosta Claro','marta.diaz','Marta'),(664,'2020-12-05','Insertar Persona','Se insertó la persona: Yeilis   Reyes Junco','marta.diaz','Marta'),(665,'2020-12-05','Insertar Persona','Se insertó la persona: Magaly   Arias Ramírez','marta.diaz','Marta'),(666,'2020-12-05','Insertar Profesión','Se insertó una nueva profesión con el nombre: Dramaturgo','marta.diaz','Marta'),(667,'2020-12-05','Modificar Persona','Se modificó la persona: Magaly   Arias Ramírez','marta.diaz','Marta'),(668,'2020-12-05','Insertar Profesión','Se insertó una nueva profesión con el nombre: Asesor TV','marta.diaz','Marta'),(669,'2020-12-05','Insertar Profesión','Se insertó una nueva profesión con el nombre: Informatico','marta.diaz','Marta'),(670,'2020-12-05','Insertar Profesión','Se insertó una nueva profesión con el nombre: Estadistico','marta.diaz','Marta'),(671,'2020-12-05','Insertar concepto','Se insertó una nuevo concepto con el nombre: Especialista','marta.diaz','Marta'),(672,'2020-12-05','Insertar Profesión','Se insertó una nueva profesión con el nombre: especialista','marta.diaz','Marta'),(673,'2020-12-05','Insertar Persona','Se insertó la persona: Altair  Reyes  Raga','marta.diaz','Marta'),(674,'2020-12-05','Insertar Persona','Se insertó la persona: Ricardo  Blanco  Martinez','marta.diaz','Marta'),(675,'2020-12-05','Insertar Profesión','Se insertó una nueva profesión con el nombre: Realizador Audiovisual','marta.diaz','Marta'),(676,'2020-12-05','Modificar Persona','Se modificó la persona: Ricardo  Blanco  Martinez','marta.diaz','Marta'),(677,'2020-12-05','Modificar Persona','Se modificó la persona: Ricardo  Blanco  Martinez','marta.diaz','Marta'),(678,'2020-12-05','Insertar Persona','Se insertó la persona: Yusvier  Abreu Sotolongo Sotolongo','marta.diaz','Marta'),(679,'2020-12-05','Modificar el concepto','Se modificó el concepto con el nombre:  Productor Rodaje','marta.diaz','Marta'),(680,'2020-12-05','Insertar concepto','Se insertó una nuevo concepto con el nombre: Productor de Avanzada','marta.diaz','Marta'),(681,'2020-12-05','Modificar Persona','Se modificó la persona: Yusvier  Abreu Sotolongo Sotolongo','marta.diaz','Marta'),(682,'2020-12-05','Insertar Persona','Se insertó la persona: Yanara  Rodríguez  Escobar','marta.diaz','Marta'),(683,'2020-12-05','Modificar Persona','Se modificó la persona: Yusvier  Abreu Sotolongo Sotolongo','marta.diaz','Marta'),(684,'2020-12-05','Insertar Persona','Se insertó la persona: Ana Maria  Diaz  Martinez','marta.diaz','Marta'),(685,'2020-12-05','Modificar Persona','Se modificó la persona: Yanara  Rodríguez  Escobar','marta.diaz','Marta'),(686,'2020-12-05','Insertar Persona','Se insertó la persona: Livan  Cruz  Traba','marta.diaz','Marta'),(687,'2020-12-05','Insertar Persona','Se insertó la persona: Jorge  Marrero  Molina','marta.diaz','Marta'),(688,'2020-12-05','Insertar Persona','Se insertó la persona: Gerardo  Garcia  Perez','marta.diaz','Marta'),(689,'2020-12-05','Insertar Persona','Se insertó la persona: Nelson  Brito  López','marta.diaz','Marta'),(690,'2020-12-05','Insertar Persona','Se insertó la persona: Claudia  Remedios  Suárez','marta.diaz','Marta'),(691,'2020-12-05','Insertar Profesión','Se insertó una nueva profesión con el nombre: Fotografo','marta.diaz','Marta'),(692,'2020-12-05','Insertar Profesión','Se insertó una nueva profesión con el nombre: Camarografo','marta.diaz','Marta'),(693,'2020-12-05','Insertar Persona','Se insertó la persona: Alejandro  Vargas  Luzardo','marta.diaz','Marta'),(694,'2020-12-05','Insertar Persona','Se insertó la persona: Yasser  Exposito  Cárdenas','marta.diaz','Marta'),(695,'2020-12-05','Insertar Persona','Se insertó la persona: Jesús Antonio  Urrutia  Valencia','marta.diaz','Marta'),(696,'2020-12-05','Modificar Persona','Se modificó la persona: Yasser  Exposito  Cárdenas','marta.diaz','Marta'),(697,'2020-12-05','Modificar Persona','Se modificó la persona: Jesús Antonio  Urrutia  Valencia','marta.diaz','Marta'),(698,'2020-12-05','Insertar Persona','Se insertó la persona: Manuel Alejandro  Blanco  Martínez','marta.diaz','Marta'),(699,'2020-12-05','Insertar Profesión','Se insertó una nueva profesión con el nombre: electricista','marta.diaz','Marta'),(700,'2020-12-05','Modificar Persona','Se modificó la persona: Manuel Alejandro  Blanco  Martínez','marta.diaz','Marta'),(701,'2020-12-05','Insertar Persona','Se insertó la persona: Jorge Luis  Armengol  Rojas','marta.diaz','Marta'),(702,'2020-12-05','Insertar Persona','Se insertó la persona: Eduardo  Quintero  Ruiz','marta.diaz','Marta'),(703,'2020-12-05','Insertar Profesión','Se insertó una nueva profesión con el nombre: Luminotecnico','marta.diaz','Marta'),(704,'2020-12-05','Modificar Persona','Se modificó la persona: Eduardo  Quintero  Ruiz','marta.diaz','Marta'),(705,'2020-12-05','Insertar Persona','Se insertó la persona: Noriel  Martínez  Cruz','marta.diaz','Marta'),(706,'2020-12-05','Insertar Persona','Se insertó la persona: Ernesto  González  Martínez','marta.diaz','Marta'),(707,'2020-12-05','Insertar Persona','Se insertó la persona: Lisandra  González  Peraza','marta.diaz','Marta'),(708,'2020-12-05','Insertar Persona','Se insertó la persona: Ixchel Marina  Casado  Pérez','marta.diaz','Marta'),(709,'2020-12-05','Insertar Persona','Se insertó la persona: Rubén Isaac  Pérez  Cuéllar','marta.diaz','Marta'),(710,'2020-12-05','Insertar Profesión','Se insertó una nueva profesión con el nombre: sonidista','marta.diaz','Marta'),(711,'2020-12-05','Modificar Persona','Se modificó la persona: Lisandra  González  Peraza','marta.diaz','Marta'),(712,'2020-12-05','Modificar Persona','Se modificó la persona: Lisandra  González  Peraza','marta.diaz','Marta'),(713,'2020-12-05','Modificar Persona','Se modificó la persona: Ixchel Marina  Casado  Pérez','marta.diaz','Marta'),(714,'2020-12-05','Modificar Persona','Se modificó la persona: Rubén Isaac  Pérez  Cuéllar','marta.diaz','Marta'),(715,'2020-12-05','Insertar Persona','Se insertó la persona: José Armando  Amat  Pérez','marta.diaz','Marta'),(716,'2020-12-05','Insertar concepto','Se insertó una nuevo concepto con el nombre: Dise;ador de Banda Sonora','marta.diaz','Marta'),(717,'2020-12-05','Modificar Persona','Se modificó la persona: José Armando  Amat  Pérez','marta.diaz','Marta'),(718,'2020-12-05','Insertar Persona','Se insertó la persona: Maylén Danay  Ibarra  González','marta.diaz','Marta'),(719,'2020-12-05','Insertar concepto','Se insertó una nuevo concepto con el nombre: Musica Original','marta.diaz','Marta'),(720,'2020-12-05','Modificar Persona','Se modificó la persona: Maylén Danay  Ibarra  González','marta.diaz','Marta'),(721,'2020-12-05','Insertar Persona','Se insertó la persona: Manuel Alejandro  Pérez  Morales','marta.diaz','Marta'),(722,'2020-12-05','Insertar Profesión','Se insertó una nueva profesión con el nombre: Artista','marta.diaz','Marta'),(723,'2020-12-05','Modificar Persona','Se modificó la persona: Manuel Alejandro  Pérez  Morales','marta.diaz','Marta'),(724,'2020-12-05','Insertar Persona','Se insertó la persona: Ariel  Corrales  Sánchez','marta.diaz','Marta'),(725,'2020-12-05','Insertar concepto','Se insertó una nuevo concepto con el nombre: Dise;ador Escenografico','marta.diaz','Marta'),(726,'2020-12-05','Modificar Persona','Se modificó la persona: Ariel  Corrales  Sánchez','marta.diaz','Marta'),(727,'2020-12-05','Insertar Persona','Se insertó la persona: Ibis  González  González','marta.diaz','Marta'),(728,'2020-12-05','Insertar Profesión','Se insertó una nueva profesión con el nombre: Ambientadora','marta.diaz','Marta'),(729,'2020-12-05','Insertar concepto','Se insertó una nuevo concepto con el nombre: Dise;o de Ambientacion','marta.diaz','Marta'),(730,'2020-12-05','Modificar Persona','Se modificó la persona: Ibis  González  González','marta.diaz','Marta'),(731,'2020-12-05','Insertar Persona','Se insertó la persona: Yanisel  Duthil  Rivera','marta.diaz','Marta'),(732,'2020-12-05','Insertar Persona','Se insertó la persona: Justo Orlando  Interian  Quintana','marta.diaz','Marta'),(733,'2020-12-05','Insertar Persona','Se insertó la persona: Adrian Lázaro  Lora  Herrera','marta.diaz','Marta'),(734,'2020-12-05','Insertar Profesión','Se insertó una nueva profesión con el nombre: Montador','marta.diaz','Marta'),(735,'2020-12-05','Modificar el concepto','Se modificó el concepto con el nombre:  Montador Escenografico','marta.diaz','Marta'),(736,'2020-12-05','Modificar Persona','Se modificó la persona: Adrian Lázaro  Lora  Herrera','marta.diaz','Marta'),(737,'2020-12-05','Insertar Profesión','Se insertó una nueva profesión con el nombre: Maquillista','marta.diaz','Marta'),(738,'2020-12-05','Insertar Persona','Se insertó la persona: Teresa  García  Trimiño','marta.diaz','Marta'),(739,'2020-12-05','Insertar Persona','Se insertó la persona: Heidy Ana  Cruz  Laurencio','marta.diaz','Marta'),(740,'2020-12-05','Insertar Persona','Se insertó la persona: Lorena  Gispert  Duverger','marta.diaz','Marta'),(741,'2020-12-05','Insertar Persona','Se insertó la persona: Luismel  González  Llanes','marta.diaz','Marta'),(742,'2020-12-05','Insertar Persona','Se insertó la persona: Alain  García  Escobar','marta.diaz','Marta'),(743,'2020-12-05','Insertar Profesión','Se insertó una nueva profesión con el nombre: Dise;ador','marta.diaz','Marta'),(744,'2020-12-05','Insertar Persona','Se insertó la persona: José Andrés  Fumero  Rojas','marta.diaz','Marta'),(745,'2020-12-05','Insertar Persona','Se insertó la persona: Keidy  Ortiz  Perez','marta.diaz','Marta'),(746,'2020-12-05','Insertar concepto','Se insertó una nuevo concepto con el nombre: Construccion Escenografica','marta.diaz','Marta'),(747,'2020-12-05','Insertar Persona','Se insertó la persona: Eduardo Lázaro  Navarrete  Pérez','marta.diaz','Marta'),(748,'2020-12-05','Modificar Persona','Se modificó la persona: Keidy  Ortiz  Perez','marta.diaz','Marta'),(749,'2020-12-05','Modificar Persona','Se modificó la persona: Keidy  Ortiz  Perez','marta.diaz','Marta'),(750,'2020-12-05','Insertar Persona','Se insertó la persona: Carmen Viday Perez de Diego Perez  de Diego','marta.diaz','Marta'),(751,'2020-12-05','Insertar Persona','Se insertó la persona: Sulian  Linares  Ramos','marta.diaz','Marta'),(752,'2020-12-05','Insertar Persona','Se insertó la persona: Jelliset  Valdés  Rodríguez','marta.diaz','Marta'),(753,'2020-12-05','Insertar Persona','Se insertó la persona: María Caridad  Cruz  Balmaseda','marta.diaz','Marta'),(754,'2020-12-05','Insertar Persona','Se insertó la persona: Danay  Cruz  Estupiñan','marta.diaz','Marta'),(755,'2020-12-05','Agregar los datos generales de un proyecto','Se agregó los datos generales del proyecto: DRAMATIZADO  EL ATRACON','marta.diaz','Marta'),(756,'2020-12-05','Modificar los datos generales de un proyecto','Se modificó los datos generales del proyecto: DRAMATIZADO  EL ATRACON','marta.diaz','Marta'),(757,'2020-12-05','Modificación de las contrataciones de un proyecto','Se modificaron las contrataciones del proyecto: DRAMATIZADO  EL ATRACON','marta.diaz','Marta'),(758,'2020-12-05','Modificar los datos generales de un proyecto','Se modificó los datos generales del proyecto: DRAMATIZADO  EL ATRACON','marta.diaz','Marta'),(759,'2020-12-05','Modificación de las contrataciones de un proyecto','Se modificaron las contrataciones del proyecto: DRAMATIZADO  EL ATRACON','marta.diaz','Marta'),(760,'2020-12-05','Insertar concepto','Se insertó una nuevo concepto con el nombre: Jefe de Iluminacion ','marta.diaz','Marta'),(761,'2020-12-05','Modificar los datos generales de un proyecto','Se modificó los datos generales del proyecto: DRAMATIZADO  EL ATRACON','marta.diaz','Marta'),(762,'2020-12-05','Modificación de las contrataciones de un proyecto','Se modificaron las contrataciones del proyecto: DRAMATIZADO  EL ATRACON','marta.diaz','Marta'),(763,'2020-12-05','Modificar Persona','Se modificó la persona: Jorge Luis  Armengol  Rojas','marta.diaz','Marta'),(764,'2020-12-05','Modificar los datos generales de un proyecto','Se modificó los datos generales del proyecto: DRAMATIZADO  EL ATRACON','marta.diaz','Marta'),(765,'2020-12-05','Modificación de las contrataciones de un proyecto','Se modificaron las contrataciones del proyecto: DRAMATIZADO  EL ATRACON','marta.diaz','Marta'),(766,'2020-12-07','Modificar Persona','Se modificó la persona: Adrian Enrique  Migueles  Álvarez','marta.diaz','Marta'),(767,'2020-12-08','Insertar Persona','Se insertó la persona: Alain Hernandez Ortiz','marta.diaz','Marta'),(768,'2020-12-10','Insertar Persona','Se insertó la persona: Roberto Perez Azul','marta.diaz','Marta'),(769,'2020-12-10','Agregar los datos generales de un proyecto','Se agregó los datos generales del proyecto: ok','marta.diaz','Marta'),(770,'2020-12-10','Agregar las contrataciones de los trabajadores por cuenta propia de un proyecto','Se agregaron las contrataciones de los trabajadores por cuenta propia del proyecto: ok','marta.diaz','Marta'),(771,'2020-12-10','Modificar los datos generales de un proyecto','Se modificó los datos generales del proyecto: Documental Capaces','marta.diaz','Marta'),(772,'2020-12-10','Modificación de las contrataciones de un proyecto','Se modificaron las contrataciones del proyecto: Documental Capaces','marta.diaz','Marta'),(773,'2020-12-10','Modificar Persona','Se modificó la persona: Rosa Miriam Elizalde  Zorrilla','marta.diaz','Marta'),(774,'2020-12-10','Modificar Persona','Se modificó la persona: Beatriz  Pérez  Alonso','marta.diaz','Marta'),(775,'2020-12-10','Modificar Persona','Se modificó la persona: Rosa Miriam Elizalde  Zorrilla','marta.diaz','Marta'),(776,'2020-12-12','Agregar los datos generales de un proyecto','Se agregó los datos generales del proyecto: q','marta.diaz','Marta'),(777,'2020-12-12','Agregar las contrataciones del personal artístico de un proyecto','Se agregaron las contrataciones del personal artístico del proyecto: q','marta.diaz','Marta'),(778,'2020-12-12','Modificar los datos generales de un proyecto','Se modificó los datos generales del proyecto: ok','marta.diaz','Marta'),(779,'2020-12-12','Modificación de las contrataciones de un proyecto','Se modificaron las contrataciones del proyecto: ok','marta.diaz','Marta');
/*!40000 ALTER TABLE `traza` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `usuario`
--

DROP TABLE IF EXISTS `usuario`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `usuario` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `password` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `nombre` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `primerApellido` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `segundoApellido` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `fechaFinClave` date NOT NULL,
  `isActive` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UNIQ_2265B05DF85E0677` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `usuario`
--

LOCK TABLES `usuario` WRITE;
/*!40000 ALTER TABLE `usuario` DISABLE KEYS */;
INSERT INTO `usuario` VALUES (1,'system','$2y$12$1ddKFN/CFyEJJ6zZssqmSOkij91qYmFya5uekwAortLLVzdVzu482','Alain','Hernández','Ortiz','2020-11-26',1),(2,'marta.diaz','$2y$12$mGE.dEDnSR2wofmpgkpgnOF4DxSad1tBDV9ziOLNYaxypFHhnDuGe','Marta','Díaz','Rodríguez','2020-12-30',1);
/*!40000 ALTER TABLE `usuario` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `usuario_nivel_acceso`
--

DROP TABLE IF EXISTS `usuario_nivel_acceso`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `usuario_nivel_acceso` (
  `usuario_id` int(11) NOT NULL,
  `nivel_acceso_id` int(11) NOT NULL,
  PRIMARY KEY (`usuario_id`,`nivel_acceso_id`),
  KEY `IDX_87C79F37DB38439E` (`usuario_id`),
  KEY `IDX_87C79F375108D425` (`nivel_acceso_id`),
  CONSTRAINT `FK_87C79F375108D425` FOREIGN KEY (`nivel_acceso_id`) REFERENCES `nivel_acceso` (`id`),
  CONSTRAINT `FK_87C79F37DB38439E` FOREIGN KEY (`usuario_id`) REFERENCES `usuario` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `usuario_nivel_acceso`
--

LOCK TABLES `usuario_nivel_acceso` WRITE;
/*!40000 ALTER TABLE `usuario_nivel_acceso` DISABLE KEYS */;
INSERT INTO `usuario_nivel_acceso` VALUES (1,1),(2,1),(2,2),(2,3),(2,4);
/*!40000 ALTER TABLE `usuario_nivel_acceso` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `usuario_role`
--

DROP TABLE IF EXISTS `usuario_role`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `usuario_role` (
  `usuario_id` int(11) NOT NULL,
  `role_id` int(11) NOT NULL,
  PRIMARY KEY (`usuario_id`,`role_id`),
  KEY `IDX_3E13F07ADB38439E` (`usuario_id`),
  KEY `IDX_3E13F07AD60322AC` (`role_id`),
  CONSTRAINT `FK_3E13F07AD60322AC` FOREIGN KEY (`role_id`) REFERENCES `role` (`id`),
  CONSTRAINT `FK_3E13F07ADB38439E` FOREIGN KEY (`usuario_id`) REFERENCES `usuario` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `usuario_role`
--

LOCK TABLES `usuario_role` WRITE;
/*!40000 ALTER TABLE `usuario_role` DISABLE KEYS */;
INSERT INTO `usuario_role` VALUES (1,1),(2,2),(2,3),(2,4),(2,5);
/*!40000 ALTER TABLE `usuario_role` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2020-12-13  7:12:46
