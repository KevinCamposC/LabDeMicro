#include <pic14/pic12f683.h>
 
//To compile:
//sdcc -mpic14 -p16f675 blink.c
 
//To program the chip using picp:
//Assuming /dev/ttyUSB0 is the serial port.
 
//Erase the chip:
//picp /dev/ttyUSB0 16f887 -ef
 
//Write the program:
//picp /dev/ttyUSB0 16f887 -wp blink.hex
 
//Write the configuration words (optional):
//picp /dev/ttyUSB0 16f887 -wc 0x2ff4 0x3fff
 
//Doing it all at once: erasing, programming, and reading back config words:
//picp /dev/ttyUSB0 16f887 -ef -wp blink.hex -rc
 
//To program the chip using pk2cmd:
//pk2cmd -M -PPIC16f887 -Fblink.hex

void delay(unsigned int tiempo)
{
	unsigned int m;
	unsigned int n;

	for(m=0;m<tiempo;m++)
	  for(n=0;n<1275;n++);
}

//////////////////////////////////////////////////////////
unsigned int counter = 0; // Contador
// Patrones posibles para los displays de 7 segmentos, 0-9
const int patterns[10] = {
    //Segmentos correspondientes
//GPIO4210
    0b0000, // 0
    0b0001, // 1
    0b0010, // 2
    0b0011, // 3
    0b0100, // 4
    0b0101, // 5
    0b0110, // 6
    0b0111, // 7
    0b1000, // 8
    0b1001  // 9
};

// Funcion que toma el numero aleatorio y guarda su valor de unidades
int num_unidades(int num) {
    int unidades = num % 10;
    return unidades;
}

// Funcion que toma el numero aleatorio y guarda su valor de decenas
int num_decenas(int num) {
    int decenas = num / 10;
    return decenas;
}

// Funcion para crear numeros pseudo aleatorios entre 0 y 99
unsigned int generateRandomNumber() {
    counter += 0xDEADBEEF;
    unsigned int random = (counter % 100); // Limitacion del rango entre 0 y 99
    return random;
}

// Funcion que toma las unidades, los convierte a binario para 
// que funcione con los displays
int binario_u(int unidades, int j) {
        if (unidades == j) {
            unidades = patterns[j]; // Toma el valor en binario
        }
		return unidades;
}

// Funcion que toma las decenas, los convierte a binario para 
// que funcione con los displays
int binario_d(int decenas, int j) {
        if (decenas == j) {
            decenas = patterns[j]; // Toma el valor en binario
        }
        return decenas;
}
	//////////////////////////////////////////////////////////
 
void main(void)
{
	// Configuracion del MCU
    TRISIO = 0b00001000; //Poner todos los pines como salidas
	GPIO = 0x00; //Poner pines en bajo
    ANSEL = 0b00001000; // Set GP3 as digital input

/////////////////////////////////////////////////////////////
int j = 0; // Contador de bolas
    // Para el circuito implementado se tiene que:
    // b0 = GP0, b1 = GP1, b2 = GP2, b3 = GP4, GP3 es el boton.
    unsigned int arreglo[10]; // Arreglo para guardar numeros aleatorios
    
    while (j < 1) {
        for (int i = 0; i < 10; ++i) {
            arreglo[i] = -1; // Inicializar el arreglo con -1 (porque este numero no puede salir)
        }
        
        int indice = 0;
        while (indice < 1) {
            unsigned int num_generado = generateRandomNumber();
            int duplicado = 0;
            
            // Para que no salgan numeros repetidos
            for (int i = 0; i < 10; ++i) {
                if (arreglo[i] == num_generado) {
                    duplicado = 1;
                    break;
                }
            }
            if (!duplicado) {
                arreglo[indice] = num_generado;
                indice++; // En este caso el numero no es duplicado, entonces se agrega
            }
        }
        int unidad = num_unidades(arreglo[j]);
        int decena = num_decenas(arreglo[j]);
        int unidades_bin = binario_u(unidad, j);
        int decenas_bin = binario_d(decena, j);
        
        // Separar los valores de las decenas en binario aplicando una mascara
        int b3d = (decenas_bin >> 3) & 1; // Bit 3 (MSB)
        int b2d = (decenas_bin >> 2) & 1; // Bit 2
        int b1d = (decenas_bin >> 1) & 1; // Bit 1
        int b0d = decenas_bin & 1; // Bit 0 (LSB)
        
        // Separar los valores de las unidades en binario aplicando una mascara
        int b3u = (unidades_bin >> 3) & 1; // Bit 3 (MSB)
        int b2u = (unidades_bin >> 2) & 1; // Bit 2
        int b1u = (unidades_bin >> 1) & 1; // Bit 1
        int b0u = unidades_bin & 1; // Bit 0 (LSB)
        ++j;

		    //Loop forever
	while ( 1 )
		    {
				// Mostrar unidades
					GP5 = 0x00; // Se prende en bajo
					GP0 = b0u;
					GP1 = b1u;
					GP2 = b2u;
					GP4 = b3u;
					delay(100);
					
					// Limpiar registros
					GP0 = 0x00;
					GP1 = 0x00;
					GP2 = 0x00;
					GP4 = 0x00;
					
					// Mostrar decenas
					GP5 = ~GP5; // Encender decenas
					GP0 = b0d;
					GP1 = b1d;
					GP2 = b2d;
					GP4 = b3d;
					delay(100);
					
					// Limpiar registros
					GP0 = 0x00;
					GP1 = 0x00;
					GP2 = 0x00;
					GP4 = 0x00;
			}
    }
/////////////////////////////////////////////////////////////

}