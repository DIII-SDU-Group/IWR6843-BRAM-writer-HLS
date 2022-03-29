#include <ap_int.h>
#include <stdint.h>

#define BUFFER_SIZE 	32
#define BUFFER_OUT_SIZE	BUFFER_SIZE*4

void loadBuffer(ap_uint<128> buffer_in[BUFFER_SIZE], ap_uint<128> buffer[BUFFER_SIZE]);

void writeBuffer(ap_uint<128> buffer[BUFFER_SIZE], uint32_t buffer_out[BUFFER_OUT_SIZE]);

void mmWBramWriter(ap_uint<128> buffer_in[BUFFER_SIZE], uint32_t buffer_out[BUFFER_OUT_SIZE]) {
#pragma HLS INTERFACE ap_memory port=buffer_in
#pragma HLS INTERFACE ap_memory port=buffer_out
#pragma HLS INTERFACE s_axilite port=return

#pragma HLS TOP


	ap_uint<128> buffer[BUFFER_SIZE];

	loadBuffer(buffer_in, buffer);

	writeBuffer(buffer, buffer_out);

}

void loadBuffer(ap_uint<128> buffer_in[BUFFER_SIZE], ap_uint<128> buffer[BUFFER_SIZE]) {

	load_loop: for (int i = 0; i < BUFFER_SIZE; i++) {

		buffer[i] = buffer_in[i];

	}
}

void writeBuffer(ap_uint<128> buffer[BUFFER_SIZE], uint32_t buffer_out[BUFFER_OUT_SIZE]) {

		write_loop: for (int i = 0; i < BUFFER_OUT_SIZE; i++) {

			buffer_out[i] = ((uint32_t *)buffer)[i];

		}

}


