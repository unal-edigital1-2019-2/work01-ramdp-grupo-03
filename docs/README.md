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


