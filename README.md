# riscv-operating-system

A minimalistic operating system made from scratch for the RISC-V Instruction Set Architecture

## Core Features

* **Multitasking:** Supports running multiple applications.
* **Paging:** Implements process memory isolation.
* **Exception Handling:** Manages system exceptions.
* **System Calls:** Allows user applications to request kernel services.
* **Disk I/O:** Includes a virtio-blk device driver for disk operations.
* **File System:** Basic file management capabilities.
* **Command-Line Shell:** A simple interface for user interaction.

## Getting Started / Building and Running

This project requires Clang for RISC-V and QEMU to run.

To compile and run:
```bash
./run.sh
```


This project is a personal implementation based on the "Operating System in 1000 Lines" tutorial by Seiya Nuta https://operating-system-in-1000-lines.vercel.app/en/
    
## License
MIT license
