#include <ap_int.h>
#include <stdint.h>

#define BUFFER_SIZE 	32
#define BUFFER_OUT_SIZE	BUFFER_SIZE*4+1

uint32_t loadBuffer(ap_uint<128> buffer_in[BUFFER_SIZE], ap_uint<128> buffer[BUFFER_SIZE]);

void writeBuffer(ap_uint<128> buffer[BUFFER_SIZE], uint32_t buffer_out[BUFFER_OUT_SIZE], int n_points);

void mmWBramWriter(ap_uint<128> buffer_in[BUFFER_SIZE], uint32_t buffer_out[BUFFER_OUT_SIZE]) {
#pragma HLS INTERFACE ap_memory port=buffer_in
#pragma HLS INTERFACE ap_memory storage_type=ram_1p port=buffer_out
#pragma HLS INTERFACE s_axilite port=return
#pragma HLS TOP

	ap_uint<128> buffer[BUFFER_SIZE];

	int n_points = loadBuffer(buffer_in, buffer);

	writeBuffer(buffer, buffer_out, n_points);

}

uint32_t loadBuffer(ap_uint<128> buffer_in[BUFFER_SIZE], ap_uint<128> buffer[BUFFER_SIZE]) {

	uint32_t n_points = BUFFER_SIZE;
	bool last_point = false;

	load_loop: for (int i = 0; i < BUFFER_SIZE; i++) {

		if (buffer_in[i] == 0 && !last_point) {

			n_points = i;
			last_point = true;

		}

		if (!last_point) {
			buffer[i] = buffer_in[i];
		} else {
			buffer[i] = 0;
		}

	}

	return n_points;
}

void writeBuffer(ap_uint<128> buffer[BUFFER_SIZE], uint32_t buffer_out[BUFFER_OUT_SIZE], int n_points) {

		buffer_out[0] = (uint32_t)n_points;

		write_loop: for (int i = 0; i < n_points; i++) {
#pragma HLS PIPELINE off

			buffer_out[1+i*4] 	= (uint32_t)(buffer[i].range(127, 96));
			buffer_out[1+i*4+1] 	= (uint32_t)(buffer[i].range(95, 64));
			buffer_out[1+i*4+2] 	= (uint32_t)(buffer[i].range(63, 32));
			buffer_out[1+i*4+3] 	= (uint32_t)(buffer[i].range(31, 0));

		}

}


