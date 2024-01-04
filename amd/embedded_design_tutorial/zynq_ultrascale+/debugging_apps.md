
## Debugging Standalone Applications with the Vitis Debugger

This chapter describes debug possibilities with the design flow you have already been working with. The first option is debugging with software using the Vitis™ debugger.

The Vitis debugger provides the following debug capabilities:

- Debugging of programs on Arm® Cortex™-A53, Arm® Cortex™-R5F, and MicroBlaze™ processor architectures (heterogeneous multi-processor hardware system debugging)
- Debugging of programs on hardware boards
- Debugging on remote hardware systems
- A feature-rich IDE to debug programs
- A Tool Command Language (Tcl) interface for running test scripts and automation

The Vitis debugger enables you to see what is happening to a program while it executes. You can set breakpoints or watchpoints to stop the processor, step through program execution, view the program variables and stack, and view the contents of the memory in the system.

The Vitis debugger supports debugging through Xilinx® System Debugger.

## Xilinx System Debugger

The Xilinx System Debugger uses the Xilinx hardware server as the underlying debug engine. The Vitis IDE translates each user interface action into a sequence of Target Communication Framework (TCF) commands. It then processes the output from System Debugger to display the current state of the program being debugged. It communicates to the processor on the hardware using Xilinx hardware server.

The debug workflow is described in the following figure.
