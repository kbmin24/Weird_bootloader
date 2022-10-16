@echo off
nasm weirdboot.asm -f bin -o weirdboot.bin
"C:\Program Files\qemu\qemu-system-i386.exe" -L . -boot c -m 256 -hda "weirdboot.bin" -soundhw all -M pc