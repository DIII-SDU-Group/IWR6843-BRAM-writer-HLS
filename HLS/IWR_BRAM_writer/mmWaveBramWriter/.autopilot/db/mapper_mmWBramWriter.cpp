#include <systemc>
#include <vector>
#include <iostream>
#include "hls_stream.h"
#include "ap_int.h"
#include "ap_fixed.h"
using namespace std;
using namespace sc_dt;
class AESL_RUNTIME_BC {
  public:
    AESL_RUNTIME_BC(const char* name) {
      file_token.open( name);
      if (!file_token.good()) {
        cout << "Failed to open tv file " << name << endl;
        exit (1);
      }
      file_token >> mName;//[[[runtime]]]
    }
    ~AESL_RUNTIME_BC() {
      file_token.close();
    }
    int read_size () {
      int size = 0;
      file_token >> mName;//[[transaction]]
      file_token >> mName;//transaction number
      file_token >> mName;//pop_size
      size = atoi(mName.c_str());
      file_token >> mName;//[[/transaction]]
      return size;
    }
  public:
    fstream file_token;
    string mName;
};
struct __cosim_s10__ { char data[16]; };
extern "C" void mmWBramWriter(__cosim_s10__*, int*);
extern "C" void apatb_mmWBramWriter_hw(volatile void * __xlx_apatb_param_buffer_in, volatile void * __xlx_apatb_param_buffer_out) {
  // Collect __xlx_buffer_in__tmp_vec
  vector<sc_bv<128> >__xlx_buffer_in__tmp_vec;
  for (int j = 0, e = 32; j != e; ++j) {
    sc_bv<128> _xlx_tmp_sc;
    _xlx_tmp_sc.range(63, 0) = ((long long*)__xlx_apatb_param_buffer_in)[j*2+0];
    _xlx_tmp_sc.range(127, 64) = ((long long*)__xlx_apatb_param_buffer_in)[j*2+1];
    __xlx_buffer_in__tmp_vec.push_back(_xlx_tmp_sc);
  }
  int __xlx_size_param_buffer_in = 32;
  int __xlx_offset_param_buffer_in = 0;
  int __xlx_offset_byte_param_buffer_in = 0*16;
  __cosim_s10__* __xlx_buffer_in__input_buffer= new __cosim_s10__[__xlx_buffer_in__tmp_vec.size()];
  for (int i = 0; i < __xlx_buffer_in__tmp_vec.size(); ++i) {
    ((long long*)__xlx_buffer_in__input_buffer)[i*2+0] = __xlx_buffer_in__tmp_vec[i].range(63, 0).to_uint64();
    ((long long*)__xlx_buffer_in__input_buffer)[i*2+1] = __xlx_buffer_in__tmp_vec[i].range(127, 64).to_uint64();
  }
  // Collect __xlx_buffer_out__tmp_vec
  vector<sc_bv<32> >__xlx_buffer_out__tmp_vec;
  for (int j = 0, e = 129; j != e; ++j) {
    __xlx_buffer_out__tmp_vec.push_back(((int*)__xlx_apatb_param_buffer_out)[j]);
  }
  int __xlx_size_param_buffer_out = 129;
  int __xlx_offset_param_buffer_out = 0;
  int __xlx_offset_byte_param_buffer_out = 0*4;
  int* __xlx_buffer_out__input_buffer= new int[__xlx_buffer_out__tmp_vec.size()];
  for (int i = 0; i < __xlx_buffer_out__tmp_vec.size(); ++i) {
    __xlx_buffer_out__input_buffer[i] = __xlx_buffer_out__tmp_vec[i].range(31, 0).to_uint64();
  }
  // DUT call
  mmWBramWriter(__xlx_buffer_in__input_buffer, __xlx_buffer_out__input_buffer);
// print __xlx_apatb_param_buffer_in
  sc_bv<128>*__xlx_buffer_in_output_buffer = new sc_bv<128>[__xlx_size_param_buffer_in];
  for (int i = 0; i < __xlx_size_param_buffer_in; ++i) {
    char* start = (char*)(&(__xlx_buffer_in__input_buffer[__xlx_offset_param_buffer_in]));
    __xlx_buffer_in_output_buffer[i].range(63, 0) = ((long long*)start)[i*2+0];
    __xlx_buffer_in_output_buffer[i].range(127, 64) = ((long long*)start)[i*2+1];
  }
  for (int i = 0; i < __xlx_size_param_buffer_in; ++i) {
    ((long long*)__xlx_apatb_param_buffer_in)[i*2+0] = __xlx_buffer_in_output_buffer[i].range(63, 0).to_uint64();
    ((long long*)__xlx_apatb_param_buffer_in)[i*2+1] = __xlx_buffer_in_output_buffer[i].range(127, 64).to_uint64();
  }
// print __xlx_apatb_param_buffer_out
  sc_bv<32>*__xlx_buffer_out_output_buffer = new sc_bv<32>[__xlx_size_param_buffer_out];
  for (int i = 0; i < __xlx_size_param_buffer_out; ++i) {
    __xlx_buffer_out_output_buffer[i] = __xlx_buffer_out__input_buffer[i+__xlx_offset_param_buffer_out];
  }
  for (int i = 0; i < __xlx_size_param_buffer_out; ++i) {
    ((int*)__xlx_apatb_param_buffer_out)[i] = __xlx_buffer_out_output_buffer[i].to_uint64();
  }
}
