
#include "BasicSerial3INT.h"

#include <avr/io.h>
#include <avr/interrupt.h>
#include <util/delay.h>
#include <stdlib.h>

void serOut(const char* str) {
	while (*str) TxByte (*str++);
}

int main() {
	cli();
	char buf[4];
	while(1) {
		for(uint8_t i=0;i<=128;i++) {
			itoa(i,buf,10);
			OSCCAL=i;
			serOut("***** OSCCAL=");
			serOut(buf);
			serOut(" *****\r\n");
			// _delay_ms(100);
		}
	}
	return 0;
}

