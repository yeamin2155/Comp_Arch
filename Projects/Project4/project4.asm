; Purpose: The implementation of Project 4 - Number multiplication program
; Using only add/sub/inc/dec for calculations
%include "asm_io.inc"

; initialized data
segment .data
    prompt_msg      db  "Enter your favorite number: ", 0
    start_msg       db  "Starting number: ", 0
    times10_msg     db  "Number * 10: ", 0
    times72_msg     db  "Number * 72: ", 0
    times81_msg     db  "Number * 81: ", 0

; uninitialized data
segment .bss
    number resd 1               ; Reserve space for input number

segment .text
        global  asm_main
asm_main:
        enter   0,0            ; Setup routine
        pusha                  ; Save all registers

        ; Print prompt and get input
        mov     eax, prompt_msg
        call    print_string   ; Display prompt
        call    read_int       ; Get number from user
        mov     [number], eax  ; Store input number
        call    print_nl       ; Print newline

        ; Display starting number
        mov     eax, start_msg
        call    print_string
        mov     eax, [number]
        call    print_int
        call    print_nl

        ; Calculate and display number * 10
        mov     eax, times10_msg
        call    print_string
        mov     eax, [number]  ; Get original number
        mov     ebx, eax       ; Save a copy
        add     eax, eax       ; *2
        add     eax, eax       ; *4
        add     eax, eax       ; *8
        add     eax, ebx       ; *9
        add     eax, ebx       ; *10
        call    print_int
        call    print_nl

        ; Calculate and display number * 72
        mov     eax, times72_msg
        call    print_string
        mov     eax, [number]  ; Get original number
        mov     ebx, eax       ; Save original
        add     eax, eax       ; *2
        add     eax, eax       ; *4
        add     eax, eax       ; *8
        mov     ecx, eax       ; Save *8 in ecx
        add     eax, eax       ; *16
        add     eax, eax       ; *32
        add     eax, eax       ; *64
        add     eax, ebx       ; *65
        add     eax, ecx       ; *73
        sub     eax, ebx       ; *72
        call    print_int
        call    print_nl

        ; Calculate and display number * 81
        mov     eax, times81_msg
        call    print_string
        mov     eax, [number]  ; Get original number
        mov     ebx, eax       ; Save original
        add     eax, eax       ; *2
        add     eax, eax       ; *4
        add     eax, eax       ; *8
        mov     ecx, eax       ; Save *8 in ecx
        add     eax, eax       ; *16
        add     eax, eax       ; *32
        add     eax, eax       ; *64
        add     eax, ebx       ; *65
        add     eax, ecx       ; *73
        add     eax, ecx       ; *81
        call    print_int
        call    print_nl

        popa                   ; Restore all registers
        mov     eax, 0        ; Return back to C
        leave                 
        ret
