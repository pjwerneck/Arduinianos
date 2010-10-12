

#include <Wire.h>

// endereço do HMC6352 já ajustado para 7 bits
#define ADDRESS 0x42 >> 1

byte data[2];
int heading;


void setup()
{
Serial.begin(9600);

// inicializa o i2c
Wire.begin();
}


void loop()
{
  // i2c master inicia a transmissão
  Wire.beginTransmission(ADDRESS);
  // envia o comando 'A', "get data"
  Wire.send("A");
  // encerra a transmissão
  Wire.endTransmission();
  // para responder o comando "get data" ele
  // pode demorar até 6 ms
  delay(6);

  // solicita 2 bytes
  Wire.requestFrom(ADDRESS, 2);
  int i = 0;
  while (i < 2){
    // espera até receber os 2 bytes
    if (Wire.available()){
      data[i] = Wire.receive();
      i++;
    }
  }
  // ajusta o byte mais significante e soma
  heading = (data[0] << 8) + data[1];
  
  // exibe o resultado final em graus
  Serial.println(heading/10.0);

  
  delay(500);
} 

