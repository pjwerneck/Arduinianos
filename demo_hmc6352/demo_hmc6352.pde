

#include <Wire.h>

// endereço do HMC6352 já ajustado para 7 bits
#define ADDRESS 0x42 >> 1

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
  if (2 <= Wire.available()){
    // ajusta o byte mais significante e soma
    heading = Wire.receive();
    heading = heading << 8;
    heading += Wire.receive();
  }   
  
  // exibe o resultado final em graus
  Serial.println(heading/10.0);

  
  delay(500);
} 

