
 void setup() {
   // inicializa a porta serial
   Serial.begin(9600); 
 }
 
 void loop() {
   // le o valor do sensor
   int v = analogRead(0);
   // faz uma aproximacao
   float dist = (2914.0 / (v + 5)) - 1;
   
   // exibe o resultado
   Serial.println(dist, DEC);

   // aguarda 50ms 
   delay(50);
 }
