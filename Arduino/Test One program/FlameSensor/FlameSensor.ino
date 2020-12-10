#define  flamePin1  A1 // задаем имя для порта A1
#define  flamePin2  A2 // задаем имя для порта A2

int  flame1, flame2;

void setup()
{
   Serial.begin(9600);
   pinMode(flamePin1, INPUT);
   pinMode(flamePin2, INPUT);
}

void loop()
{

   flame1 = digitalRead(flamePin1);  // считываем данные с датчика
   if (flame1 == HIGH)
      Serial.println("1 - Peace..."); 
   else
      Serial.println("1 - Fire!"); 

  flame2 = digitalRead(flamePin2);  // считываем данные с датчика
   if (flame2 == HIGH)
      Serial.println("2 - Peace..."); 
   else
      Serial.println("2- Fire!"); 
}
