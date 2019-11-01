## Aquí se debe  documentar todo el proceso del proyecto acorde a cada paquete de trabajo

# Grupo de trabajo 03

### Ericson Brayan Mesa Orjuela

### Oscar Mauricio Saavedra Gonzalez

### Sergio Andres Gerena Gomez

### Emiro Andres Lara Ruiz

## Respuestas

### Pregunta 1. ¿Cuál es el tamaño máximo de buffer de memoria que puede crear?

4860kb o 607.5kB


### Pregunta 2. ¿Cuál formato y tamaño de imagen de la cámara OV7670 que se ajusta mejor al tamaño de memoria calculado en la pregunta 1?

Vamos a usar la resolución 320x240 pixeles y el formato RGB con dos Bytes por pixel (5,6,5).
Con este formato y resolución se requieren 153.6kB de memoria para la pantalla.

### Pregunta 3. ¿Cuáles son los registros de configuración de la cámara OV7670 que permiten tener la configuración dada en la pregunta 2?

* **Habilitar el escalado**. 

 Dirección 0D, COM4 Bit[5:4] (00:Full window,

 01:1/2 window,

 10:1/4 window,

 11:1/4 window) (Average option, same value as COM17).

Dirección 42, COM17 Bit[7:6] (00:Normal,

 01:1/2,

 10:1/4,

 11:1/4)


* **Configurar el formato y tamaño del pixel**. 

Dirección 40, COM15 Bit[5:4]=01.

Dirección 12, COM7 Bit[2] (

Output Format - RGB selection), 

Bit[1] (Color Bar), 

Bit[0] (Output form - Raw RGB).


* **Para test de barra de colores**. 

	Dirección 70, SCALING_XSC Bit[7] y 

Bit[6:0] (Horizontal scale factor)

	Dirección 71, SCALING_YSC Bit[7] y 

Bit[6:0] (Vertical scale factor)

(XBit[7], YBit[7]) (00: No test output,
01: Shifting "1"

* **Reestablecer todos los registros**. 

Dirección 12, COM7 Bit[7] (SCCB Register Reset, 0: No change, 1: Resets all registers to default values)

## Proceso realizado

Primeramente se busco en el datasheet el tamaño de memoria blockRAM en la Nexys 4, ya que esta es la memoria disponible por la misma para la creacion de la RAM, esta memoria es de 607.5 kB, con este valor se procedio a calcular el tamaño del formato ha emplear teniendo en cuenta que se usara el RGB565 lo cual implica que cada pixel ocupa 2 Bytes, para estos calculos se uso  el siguiente parametro:

1P= 2 Bytes

De esta manera, disponemos en realidad de 303750 pixeles, a continuacion se muestra la cantidad de pixeles necesarios para cada una de las configuraciones de la camara

(640*480)=307200 P 

(320*240)=76800 P

de esta forma se decidio por la configuracion de (320*240), una vez decidido este parametro, se procede a encontrar los valores de AW y DW, el DW lo tenemos por el formato como tal (RGB565) el cual sera los bits empleados para el desplazamiento lo cual sera de 16, para AW se tiene que:

(320 * 240) * 16=16 * 2^AW

De esto tenemos como respuesta 16.2288 lo que se aproxima a 17 para evitar que falten registros, de esta manera tenemos los parametros AW y DW siendo respectivamente 17 y 16.

Por consiguiente y a manera de conclusion, se opto por trabajar en el formato RGB565, empleando como FPGA  la nexys 4, y en un tamaño de ventana de (320 * 240).

