// ==============================================================
// Vitis HLS - High-Level Synthesis from C, C++ and OpenCL v2020.2 (64-bit)
// Copyright 1986-2020 Xilinx, Inc. All Rights Reserved.
// ==============================================================
#ifndef XMMWBRAMWRITER_H
#define XMMWBRAMWRITER_H

#ifdef __cplusplus
extern "C" {
#endif

/***************************** Include Files *********************************/
#ifndef __linux__
#include "xil_types.h"
#include "xil_assert.h"
#include "xstatus.h"
#include "xil_io.h"
#else
#include <stdint.h>
#include <assert.h>
#include <dirent.h>
#include <fcntl.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <sys/mman.h>
#include <unistd.h>
#include <stddef.h>
#endif
#include "xmmwbramwriter_hw.h"

/**************************** Type Definitions ******************************/
#ifdef __linux__
typedef uint8_t u8;
typedef uint16_t u16;
typedef uint32_t u32;
typedef uint64_t u64;
#else
typedef struct {
    u16 DeviceId;
    u32 Control_BaseAddress;
} XMmwbramwriter_Config;
#endif

typedef struct {
    u64 Control_BaseAddress;
    u32 IsReady;
} XMmwbramwriter;

typedef u32 word_type;

/***************** Macros (Inline Functions) Definitions *********************/
#ifndef __linux__
#define XMmwbramwriter_WriteReg(BaseAddress, RegOffset, Data) \
    Xil_Out32((BaseAddress) + (RegOffset), (u32)(Data))
#define XMmwbramwriter_ReadReg(BaseAddress, RegOffset) \
    Xil_In32((BaseAddress) + (RegOffset))
#else
#define XMmwbramwriter_WriteReg(BaseAddress, RegOffset, Data) \
    *(volatile u32*)((BaseAddress) + (RegOffset)) = (u32)(Data)
#define XMmwbramwriter_ReadReg(BaseAddress, RegOffset) \
    *(volatile u32*)((BaseAddress) + (RegOffset))

#define Xil_AssertVoid(expr)    assert(expr)
#define Xil_AssertNonvoid(expr) assert(expr)

#define XST_SUCCESS             0
#define XST_DEVICE_NOT_FOUND    2
#define XST_OPEN_DEVICE_FAILED  3
#define XIL_COMPONENT_IS_READY  1
#endif

/************************** Function Prototypes *****************************/
#ifndef __linux__
int XMmwbramwriter_Initialize(XMmwbramwriter *InstancePtr, u16 DeviceId);
XMmwbramwriter_Config* XMmwbramwriter_LookupConfig(u16 DeviceId);
int XMmwbramwriter_CfgInitialize(XMmwbramwriter *InstancePtr, XMmwbramwriter_Config *ConfigPtr);
#else
int XMmwbramwriter_Initialize(XMmwbramwriter *InstancePtr, const char* InstanceName);
int XMmwbramwriter_Release(XMmwbramwriter *InstancePtr);
#endif

void XMmwbramwriter_Start(XMmwbramwriter *InstancePtr);
u32 XMmwbramwriter_IsDone(XMmwbramwriter *InstancePtr);
u32 XMmwbramwriter_IsIdle(XMmwbramwriter *InstancePtr);
u32 XMmwbramwriter_IsReady(XMmwbramwriter *InstancePtr);
void XMmwbramwriter_EnableAutoRestart(XMmwbramwriter *InstancePtr);
void XMmwbramwriter_DisableAutoRestart(XMmwbramwriter *InstancePtr);


void XMmwbramwriter_InterruptGlobalEnable(XMmwbramwriter *InstancePtr);
void XMmwbramwriter_InterruptGlobalDisable(XMmwbramwriter *InstancePtr);
void XMmwbramwriter_InterruptEnable(XMmwbramwriter *InstancePtr, u32 Mask);
void XMmwbramwriter_InterruptDisable(XMmwbramwriter *InstancePtr, u32 Mask);
void XMmwbramwriter_InterruptClear(XMmwbramwriter *InstancePtr, u32 Mask);
u32 XMmwbramwriter_InterruptGetEnabled(XMmwbramwriter *InstancePtr);
u32 XMmwbramwriter_InterruptGetStatus(XMmwbramwriter *InstancePtr);

#ifdef __cplusplus
}
#endif

#endif
