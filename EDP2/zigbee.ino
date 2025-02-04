//MADE BY ANGAD DHAWAN
//ZERO CONTRIBUTION BY OTHERS
int ir1 = A0;
int ir2 = A1;
int count = 0;
int l, r;

void setup() {
  Serial.begin(9600);
  pinMode(ir1, INPUT);
  pinMode(ir2, INPUT);
  pinMode(5, OUTPUT);
  pinMode(6, OUTPUT);
  pinMode(7, OUTPUT);
  pinMode(8, OUTPUT);
}

void forward() {
  digitalWrite(5, HIGH);
  digitalWrite(6, LOW);
  digitalWrite(7, LOW);
  digitalWrite(8, HIGH);
}

void backward() {
  digitalWrite(5, LOW);
  digitalWrite(6, HIGH);
  digitalWrite(7, HIGH);
  digitalWrite(8, LOW);
}

void left() {
  digitalWrite(5, HIGH);
  digitalWrite(6, LOW);
  digitalWrite(7, LOW);
  digitalWrite(8, LOW);
}

void right() {
  digitalWrite(5, LOW);
  digitalWrite(6, LOW);
  digitalWrite(7, LOW);
  digitalWrite(8, HIGH);
}

void stop() {
  digitalWrite(5, LOW);
  digitalWrite(6, LOW);
  digitalWrite(7, LOW);
  digitalWrite(8, LOW);
}

long st = millis();
long endt;
int flag = 0;

void loop() {
  if (Serial.read() == 'K' || flag == 1) {
    flag = 1;
    l = digitalRead(ir1);
    r = digitalRead(ir2);
    if (l == 1 && r == 1) {
      forward();
    }
    if (l == 1 && r == 0) {
      right();
    }
    if (l == 0 && r == 1) {
      left();
    }
    if (l == 0 && r == 0) {
      endt = millis();
      if ((endt - st) > 1000) {
        count++;
        st = millis();
      }
      if (count == 1) {
        forward();
        Serial.print("forward: ");
        Serial.println(count);
      }
      if (count == 2) {
        left();
        Serial.print("left: ");
        Serial.println(count);
      }
      if (count == 3) {
        forward();
        Serial.print("forward: ");
        Serial.println(count);
      }
      if (count == 4) {
        forward();
        Serial.print("forward: ");
        Serial.println(count);
      }
      if (count == 5) {
        left();
        Serial.print("left: ");
        Serial.println(count);
        delay(300);
      }
      if (count == 6) {
        forward();
        Serial.print("forward: ");
        Serial.println(count);
      }
      if (count > 6) {
        stop();
        Serial.print("stop: ");
        Serial.println(count);
        count = 0;
        flag = 0;
      }
    }
  }

  if (Serial.read() == 'S') {
    backward();
  }
}
