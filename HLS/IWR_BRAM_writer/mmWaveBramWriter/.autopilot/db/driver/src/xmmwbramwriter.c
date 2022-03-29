// ==============================================================
// Vitis HLS - High-Level Synthesis from C, C++ and OpenCL v2020.2 (64-bit)
// Copyright 1986-2020 Xilinx, Inc. All Rights Reserved.
// ==============================================================
/***************************** Include Files *********************************/
#include "xmmwbramwriter.h"

/************************** Function Implementation *************************/
#ifndef __linux__
int XMmwbramwriter_CfgInitialize(XMmwbramwriter *InstancePtr, XMmwbramwriter_Config *ConfigPtr) {
    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(ConfigPtr != NULL);

    InstancePtr->Control_BaseAddress = ConfigPtr->Control_BaseAddress;
    InstancePtr->IsReady = XIL_COMPONENT_IS_READY;

    return XST_SUCCESS;
}
#endif

void XMmwbramwriter_Start(XMmwbramwriter *InstancePtr) {
    u32 Data;

    Xil_AssertVoid(InstancePtr != NULL);
    Xil_AssertVoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    Data = XMmwbramwriter_ReadReg(InstancePtr->Control_BaseAddress, XMMWBRAMWRITER_CONTROL_ADDR_AP_CTRL) & 0x80;
    XMmwbramwriter_WriteReg(InstancePtr->Control_BaseAddress, XMMWBRAMWRITER_CONTROL_ADDR_AP_CTRL, Data | 0x01);
}

u32 XMmwbramwriter_IsDone(XMmwbramwriter *InstancePtr) {
    u32 Data;

    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    Data = XMmwbramwriter_ReadReg(InstancePtr->Control_BaseAddress, XMMWBRAMWRITER_CONTROL_ADDR_AP_CTRL);
    return (Data >> 1) & 0x1;
}

u32 XMmwbramwriter_IsIdle(XMmwbramwriter *InstancePtr) {
    u32 Data;

    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    Data = XMmwbramwriter_ReadReg(InstancePtr->Control_BaseAddress, XMMWBRAMWRITER_CONTROL_ADDR_AP_CTRL);
    return (Data >> 2) & 0x1;
}

u32 XMmwbramwriter_IsReady(XMmwbramwriter *InstancePtr) {
    u32 Data;

    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    Data = XMmwbramwriter_ReadReg(InstancePtr->Control_BaseAddress, XMMWBRAMWRITER_CONTROL_ADDR_AP_CTRL);
    // check ap_start to see if the pcore is ready for next input
    return !(Data & 0x1);
}

void XMmwbramwriter_EnableAutoRestart(XMmwbramwriter *InstancePtr) {
    Xil_AssertVoid(InstancePtr != NULL);
    Xil_AssertVoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    XMmwbramwriter_WriteReg(InstancePtr->Control_BaseAddress, XMMWBRAMWRITER_CONTROL_ADDR_AP_CTRL, 0x80);
}

void XMmwbramwriter_DisableAutoRestart(XMmwbramwriter *InstancePtr) {
    Xil_AssertVoid(InstancePtr != NULL);
    Xil_AssertVoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    XMmwbramwriter_WriteReg(InstancePtr->Control_BaseAddress, XMMWBRAMWRITER_CONTROL_ADDR_AP_CTRL, 0);
}

void XMmwbramwriter_InterruptGlobalEnable(XMmwbramwriter *InstancePtr) {
    Xil_AssertVoid(InstancePtr != NULL);
    Xil_AssertVoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    XMmwbramwriter_WriteReg(InstancePtr->Control_BaseAddress, XMMWBRAMWRITER_CONTROL_ADDR_GIE, 1);
}

void XMmwbramwriter_InterruptGlobalDisable(XMmwbramwriter *InstancePtr) {
    Xil_AssertVoid(InstancePtr != NULL);
    Xil_AssertVoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    XMmwbramwriter_WriteReg(InstancePtr->Control_BaseAddress, XMMWBRAMWRITER_CONTROL_ADDR_GIE, 0);
}

void XMmwbramwriter_InterruptEnable(XMmwbramwriter *InstancePtr, u32 Mask) {
    u32 Register;

    Xil_AssertVoid(InstancePtr != NULL);
    Xil_AssertVoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    Register =  XMmwbramwriter_ReadReg(InstancePtr->Control_BaseAddress, XMMWBRAMWRITER_CONTROL_ADDR_IER);
    XMmwbramwriter_WriteReg(InstancePtr->Control_BaseAddress, XMMWBRAMWRITER_CONTROL_ADDR_IER, Register | Mask);
}

void XMmwbramwriter_InterruptDisable(XMmwbramwriter *InstancePtr, u32 Mask) {
    u32 Register;

    Xil_AssertVoid(InstancePtr != NULL);
    Xil_AssertVoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    Register =  XMmwbramwriter_ReadReg(InstancePtr->Control_BaseAddress, XMMWBRAMWRITER_CONTROL_ADDR_IER);
    XMmwbramwriter_WriteReg(InstancePtr->Control_BaseAddress, XMMWBRAMWRITER_CONTROL_ADDR_IER, Register & (~Mask));
}

void XMmwbramwriter_InterruptClear(XMmwbramwriter *InstancePtr, u32 Mask) {
    Xil_AssertVoid(InstancePtr != NULL);
    Xil_AssertVoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    XMmwbramwriter_WriteReg(InstancePtr->Control_BaseAddress, XMMWBRAMWRITER_CONTROL_ADDR_ISR, Mask);
}

u32 XMmwbramwriter_InterruptGetEnabled(XMmwbramwriter *InstancePtr) {
    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    return XMmwbramwriter_ReadReg(InstancePtr->Control_BaseAddress, XMMWBRAMWRITER_CONTROL_ADDR_IER);
}

u32 XMmwbramwriter_InterruptGetStatus(XMmwbramwriter *InstancePtr) {
    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    return XMmwbramwriter_ReadReg(InstancePtr->Control_BaseAddress, XMMWBRAMWRITER_CONTROL_ADDR_ISR);
}

