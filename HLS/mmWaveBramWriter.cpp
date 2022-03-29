#include <ap_int.h>
#include <stdint.h>

#define BUFFER_SIZE 	32
#define BUFFER_OUT_SIZE	BUFFER_SIZE*4+1

int loadBuffer(ap_uint<128> buffer_in[BUFFER_SIZE], ap_uint<128> buffer[BUFFER_SIZE]);

void writeBuffer(ap_uint<128> buffer[BUFFER_SIZE], uint32_t buffer_out[BUFFER_OUT_SIZE], int n_points);

void mmWBramWriter(ap_uint<128> buffer_in[BUFFER_SIZE], uint32_t buffer_out[BUFFER_OUT_SIZE]) {
#pragma HLS INTERFACE ap_memory port=buffer_in
#pragma HLS INTERFACE ap_memory port=buffer_out
#pragma HLS INTERFACE s_axilite port=return
#pragma HLS TOP

	ap_uint<128> buffer[BUFFER_SIZE];

	int n_points = loadBuffer(buffer_in, buffer);

	writeBuffer(buffer, buffer_out, n_points);

}

int loadBuffer(ap_uint<128> buffer_in[BUFFER_SIZE], ap_uint<128> buffer[BUFFER_SIZE]) {

	int n_points = BUFFER_SIZE;

	load_loop: for (int i = 0; i < BUFFER_SIZE; i++) {

		if (!buffer_in[i] && n_points == BUFFER_SIZE) {

			n_points = i;

		}

		buffer[i] = buffer_in[i];

	}

	return BUFFER_SIZE;
}

void writeBuffer(ap_uint<128> buffer[BUFFER_SIZE], uint32_t buffer_out[BUFFER_OUT_SIZE], int n_points) {

		buffer_out[0] = (uint32_t)n_points;

		write_loop: for (int i = 0; i < n_points*4; i++) {

			buffer_out[i+1] = ((uint32_t *)buffer)[i];

		}

}


