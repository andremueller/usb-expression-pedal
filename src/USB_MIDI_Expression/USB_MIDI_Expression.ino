/*
 * USB_MIDI_Expression
 *
 */ 

#include "MIDIUSB.h"
#include "DiscreteFilter.h"

// First parameter is the event type (0x09 = note on, 0x08 = note off).
// Second parameter is note-on/note-off, combined with the channel.
// Channel can be anything between 0-15. Typically reported to the user as 1-16.
// Third parameter is the note number (48 = middle C).
// Fourth parameter is the velocity (64 = normal, 127 = fastest).

#define PIN_EXPRESSION      A0
#define PIN_X_VALUE         A1
#define PIN_Y_VALUE         A2
#define PIN_BUTTON1         11
#define PIN_BUTTON2         12

#define CTRL_EXPRESSION     11
#define CTRL_GP1_MORPH_X    16
#define CTRL_GP2_MORPH_Y    17

#define MIDI_CHANNEL        1


// butterworth lowpass filter order = 8
/*
#define N_COEFFS    9

const float COEFF_A[N_COEFFS] = {
  1.000000000000000000f,
  -4.784514894995808731f,
  10.445041065534663716f,
  -13.457719890241556016f,
  11.129331039163975703f,
  -6.025260397297650172f,
  2.079273803011876698f,
  -0.417217156989782234f,
  0.037200100704845238f
};

const float COEFF_B[N_COEFFS] = {
  2.3959644103776156e-05f,
  1.9167715283020925e-04f,
  6.7087003490573234e-04f,
  1.3417400698114647e-03f,
  1.6771750872643309e-03f,
  1.3417400698114647e-03f,
  6.7087003490573234e-04f,
  1.9167715283020925e-04f,
  2.3959644103776156e-05f
};
*/

#define N_COEFFS    3
const float COEFF_A[N_COEFFS] = { 1.00000000000000000f, -1.14298050253990091f,  0.41280159809618855f };
const float COEFF_B[N_COEFFS] = { 0.067455273889071896f, 0.134910547778143791f, 0.067455273889071896f };

DiscreteFilter    filterExpression(N_COEFFS, COEFF_A, COEFF_B);
DiscreteFilter    filterXValue(N_COEFFS, COEFF_A, COEFF_B);
DiscreteFilter    filterYValue(N_COEFFS, COEFF_A, COEFF_B);

void noteOn(byte channel, byte pitch, byte velocity) {
  midiEventPacket_t noteOn = {0x09, (uint8_t)(0x90 | channel), pitch, velocity};
  MidiUSB.sendMIDI(noteOn);
}

void noteOff(byte channel, byte pitch, byte velocity) {
  midiEventPacket_t noteOff = {0x08,  (uint8_t)(0x80 | channel), pitch, velocity};
  MidiUSB.sendMIDI(noteOff);
}

// First parameter is the event type (0x0B = control change).
// Second parameter is the event type, combined with the channel.
// Third parameter is the control number number (0-119).
// Fourth parameter is the control value (0-127).

void controlChange(byte channel, byte control, byte value) {
  midiEventPacket_t event = {0x0B,  (uint8_t)(0xB0 | channel), control, value};
  MidiUSB.sendMIDI(event);
}

void setup() {
  Serial.begin(115200);
  pinMode(LED_BUILTIN, OUTPUT);
  pinMode(PIN_BUTTON1, INPUT_PULLUP);
  pinMode(PIN_BUTTON2, INPUT_PULLUP);
  int i = 100;
  while (!Serial && --i >= 0) {
    delay(10);
  }
  Serial.println("USB_MIDI_Expression v1.0.0 " __DATE__);
}

int limit(int value, int minValue, int maxValue) {
  return max(min(value, maxValue), minValue);
}

int transform(int value) {
  int v = (int)(127.0f*((100.0f / 115.0f) * (1023.0f / (float)value - 1.0f)));
  v = limit(v, 0, 127);
  return v;
}

#define SAMPLE_TIME_MICROS 10000

void loop() {
  static int lastExpressionValue = -1;
  static int lastXValue = -1;
  static int lastYValue = -1;
  static int lightOn = 0;
  static bool lastButton1 = false;
  static bool lastButton2 = false;
  static unsigned long lastTime = 0;
  
  while (micros() < lastTime + SAMPLE_TIME_MICROS) {
    delayMicroseconds(10);
  }
  lastTime = micros();
  
  int expressionValue = limit(((int)filterExpression.update((float)analogRead(PIN_EXPRESSION))) >> 3, 0, 127);
  int xValue = transform((int)filterXValue.update((float)analogRead(PIN_X_VALUE)));
  int yValue = transform((int)filterYValue.update((float)analogRead(PIN_Y_VALUE)));
  bool button1 = !digitalRead(PIN_BUTTON1);
  bool button2 = !digitalRead(PIN_BUTTON2);
  bool changed = false;
  
  if (expressionValue != lastExpressionValue) {
    controlChange(MIDI_CHANNEL, CTRL_EXPRESSION, expressionValue);
    lastExpressionValue = expressionValue;
    changed = true;
  }
  if (xValue != lastXValue) {
    controlChange(MIDI_CHANNEL, CTRL_GP1_MORPH_X, xValue);
    lastXValue = xValue;
    changed = true;
  }
  if (yValue != lastYValue) {
    controlChange(MIDI_CHANNEL, CTRL_GP2_MORPH_Y, yValue);
    lastYValue = yValue;
    changed = true;
  }  
  if (button1 != lastButton1) {
    changed = true;
    lastButton1 = button1;
  }
  if (button2 != lastButton2) {
    changed = true;
    lastButton2 = button2;
  }
  if (changed) {
    MidiUSB.flush();
    lightOn = 10;
    digitalWrite(LED_BUILTIN, true);
    /*
    Serial.print("e=");
    Serial.println(expressionValue);
    Serial.print("x=");
    Serial.print(xValue);
    Serial.print(" ");
    Serial.println(xValue);
    Serial.print("y=");
    Serial.print(yValue);
    Serial.print(" ");
    Serial.print("b1=");
    Serial.println(button1, DEC);
    Serial.print("b2=");
    Serial.println(button2, DEC);
    */
  }
  if (lightOn > 0) {
    --lightOn; 
  } else {
    digitalWrite(LED_BUILTIN, false);
  }
}

