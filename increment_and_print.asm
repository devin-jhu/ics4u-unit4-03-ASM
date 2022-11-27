;-------------------;
; 0 to 9 counter program
; By: Devin Jhu
; 2022-11-23
;-------------------;

;-------------------; SYSTEM CALLS
SYS_WRITE   equ 1   ; write to _
SYS_EXIT    equ 60  ; end program
;-------------------;

;-------------------;
STDOUT      equ 1   ; standard output
;-------------------;


section .bss
    tempLen equ 2
    temp     resb    tempLen

section .data
    message: db "showing 0 to 9: ", 10
    messageLen: equ $-message
    done: db 10, "Done.", 10
    doneLen: equ $-done
    newLine: db 10
    newLineLen: equ $-newLine


        section .text
        global _start
_start:
        ; mov 48 to r8

        ; Message describing program
        mov rax, SYS_WRITE
        mov rdi, STDOUT
        mov rsi, message
        mov rdx, messageLen
        syscall

        ; Assigning 48 to r8(0 in ascii)
        mov r8, 48

        loop:
        ; mov value of r8 into temp variable
        mov [temp], r8

        ; Increment r8(r8++)
        inc r8

        ; Print temp
        mov rax, SYS_WRITE
        mov rdi, STDOUT
        mov rsi, temp
        mov rdx, tempLen
        syscall

        ; New Line
        mov rax, SYS_WRITE
        mov rdi, STDOUT
        mov rsi, newLine
        mov rdx, newLineLen
        syscall

        ; Compare
        cmp r8, 57
        jle loop            ; Jump to loop if flag is less than or equal too

        ; Done
        mov rax, SYS_WRITE
        mov rdi, STDOUT
        mov rsi, done
        mov rdx, doneLen
        syscall

        ; SYS_EXIT SUCCESS
        mov rbx, 0
        mov rax, SYS_EXIT
        syscall
