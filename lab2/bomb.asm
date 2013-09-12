
bomb:     file format elf64-x86-64


Disassembly of section .init:

0000000000400a28 <_init>:
  400a28:	48 83 ec 08          	sub    $0x8,%rsp
  400a2c:	e8 0b 02 00 00       	callq  400c3c <call_gmon_start>
  400a31:	e8 8a 02 00 00       	callq  400cc0 <frame_dummy>
  400a36:	e8 e5 19 00 00       	callq  402420 <__do_global_ctors_aux>
  400a3b:	48 83 c4 08          	add    $0x8,%rsp
  400a3f:	c3                   	retq   

Disassembly of section .plt:

0000000000400a40 <printf@plt-0x10>:
  400a40:	ff 35 ea 27 20 00    	pushq  0x2027ea(%rip)        # 603230 <_GLOBAL_OFFSET_TABLE_+0x8>
  400a46:	ff 25 ec 27 20 00    	jmpq   *0x2027ec(%rip)        # 603238 <_GLOBAL_OFFSET_TABLE_+0x10>
  400a4c:	0f 1f 40 00          	nopl   0x0(%rax)

0000000000400a50 <printf@plt>:
  400a50:	ff 25 ea 27 20 00    	jmpq   *0x2027ea(%rip)        # 603240 <_GLOBAL_OFFSET_TABLE_+0x18>
  400a56:	68 00 00 00 00       	pushq  $0x0
  400a5b:	e9 e0 ff ff ff       	jmpq   400a40 <_init+0x18>

0000000000400a60 <memset@plt>:
  400a60:	ff 25 e2 27 20 00    	jmpq   *0x2027e2(%rip)        # 603248 <_GLOBAL_OFFSET_TABLE_+0x20>
  400a66:	68 01 00 00 00       	pushq  $0x1
  400a6b:	e9 d0 ff ff ff       	jmpq   400a40 <_init+0x18>

0000000000400a70 <close@plt>:
  400a70:	ff 25 da 27 20 00    	jmpq   *0x2027da(%rip)        # 603250 <_GLOBAL_OFFSET_TABLE_+0x28>
  400a76:	68 02 00 00 00       	pushq  $0x2
  400a7b:	e9 c0 ff ff ff       	jmpq   400a40 <_init+0x18>

0000000000400a80 <gethostbyname@plt>:
  400a80:	ff 25 d2 27 20 00    	jmpq   *0x2027d2(%rip)        # 603258 <_GLOBAL_OFFSET_TABLE_+0x30>
  400a86:	68 03 00 00 00       	pushq  $0x3
  400a8b:	e9 b0 ff ff ff       	jmpq   400a40 <_init+0x18>

0000000000400a90 <puts@plt>:
  400a90:	ff 25 ca 27 20 00    	jmpq   *0x2027ca(%rip)        # 603260 <_GLOBAL_OFFSET_TABLE_+0x38>
  400a96:	68 04 00 00 00       	pushq  $0x4
  400a9b:	e9 a0 ff ff ff       	jmpq   400a40 <_init+0x18>

0000000000400aa0 <exit@plt>:
  400aa0:	ff 25 c2 27 20 00    	jmpq   *0x2027c2(%rip)        # 603268 <_GLOBAL_OFFSET_TABLE_+0x40>
  400aa6:	68 05 00 00 00       	pushq  $0x5
  400aab:	e9 90 ff ff ff       	jmpq   400a40 <_init+0x18>

0000000000400ab0 <strcasecmp@plt>:
  400ab0:	ff 25 ba 27 20 00    	jmpq   *0x2027ba(%rip)        # 603270 <_GLOBAL_OFFSET_TABLE_+0x48>
  400ab6:	68 06 00 00 00       	pushq  $0x6
  400abb:	e9 80 ff ff ff       	jmpq   400a40 <_init+0x18>

0000000000400ac0 <read@plt>:
  400ac0:	ff 25 b2 27 20 00    	jmpq   *0x2027b2(%rip)        # 603278 <_GLOBAL_OFFSET_TABLE_+0x50>
  400ac6:	68 07 00 00 00       	pushq  $0x7
  400acb:	e9 70 ff ff ff       	jmpq   400a40 <_init+0x18>

0000000000400ad0 <fopen@plt>:
  400ad0:	ff 25 aa 27 20 00    	jmpq   *0x2027aa(%rip)        # 603280 <_GLOBAL_OFFSET_TABLE_+0x58>
  400ad6:	68 08 00 00 00       	pushq  $0x8
  400adb:	e9 60 ff ff ff       	jmpq   400a40 <_init+0x18>

0000000000400ae0 <__libc_start_main@plt>:
  400ae0:	ff 25 a2 27 20 00    	jmpq   *0x2027a2(%rip)        # 603288 <_GLOBAL_OFFSET_TABLE_+0x60>
  400ae6:	68 09 00 00 00       	pushq  $0x9
  400aeb:	e9 50 ff ff ff       	jmpq   400a40 <_init+0x18>

0000000000400af0 <fgets@plt>:
  400af0:	ff 25 9a 27 20 00    	jmpq   *0x20279a(%rip)        # 603290 <_GLOBAL_OFFSET_TABLE_+0x68>
  400af6:	68 0a 00 00 00       	pushq  $0xa
  400afb:	e9 40 ff ff ff       	jmpq   400a40 <_init+0x18>

0000000000400b00 <bcopy@plt>:
  400b00:	ff 25 92 27 20 00    	jmpq   *0x202792(%rip)        # 603298 <_GLOBAL_OFFSET_TABLE_+0x70>
  400b06:	68 0b 00 00 00       	pushq  $0xb
  400b0b:	e9 30 ff ff ff       	jmpq   400a40 <_init+0x18>

0000000000400b10 <__ctype_b_loc@plt>:
  400b10:	ff 25 8a 27 20 00    	jmpq   *0x20278a(%rip)        # 6032a0 <_GLOBAL_OFFSET_TABLE_+0x78>
  400b16:	68 0c 00 00 00       	pushq  $0xc
  400b1b:	e9 20 ff ff ff       	jmpq   400a40 <_init+0x18>

0000000000400b20 <sprintf@plt>:
  400b20:	ff 25 82 27 20 00    	jmpq   *0x202782(%rip)        # 6032a8 <_GLOBAL_OFFSET_TABLE_+0x80>
  400b26:	68 0d 00 00 00       	pushq  $0xd
  400b2b:	e9 10 ff ff ff       	jmpq   400a40 <_init+0x18>

0000000000400b30 <__strtol_internal@plt>:
  400b30:	ff 25 7a 27 20 00    	jmpq   *0x20277a(%rip)        # 6032b0 <_GLOBAL_OFFSET_TABLE_+0x88>
  400b36:	68 0e 00 00 00       	pushq  $0xe
  400b3b:	e9 00 ff ff ff       	jmpq   400a40 <_init+0x18>

0000000000400b40 <sscanf@plt>:
  400b40:	ff 25 72 27 20 00    	jmpq   *0x202772(%rip)        # 6032b8 <_GLOBAL_OFFSET_TABLE_+0x90>
  400b46:	68 0f 00 00 00       	pushq  $0xf
  400b4b:	e9 f0 fe ff ff       	jmpq   400a40 <_init+0x18>

0000000000400b50 <sleep@plt>:
  400b50:	ff 25 6a 27 20 00    	jmpq   *0x20276a(%rip)        # 6032c0 <_GLOBAL_OFFSET_TABLE_+0x98>
  400b56:	68 10 00 00 00       	pushq  $0x10
  400b5b:	e9 e0 fe ff ff       	jmpq   400a40 <_init+0x18>

0000000000400b60 <connect@plt>:
  400b60:	ff 25 62 27 20 00    	jmpq   *0x202762(%rip)        # 6032c8 <_GLOBAL_OFFSET_TABLE_+0xa0>
  400b66:	68 11 00 00 00       	pushq  $0x11
  400b6b:	e9 d0 fe ff ff       	jmpq   400a40 <_init+0x18>

0000000000400b70 <gethostname@plt>:
  400b70:	ff 25 5a 27 20 00    	jmpq   *0x20275a(%rip)        # 6032d0 <_GLOBAL_OFFSET_TABLE_+0xa8>
  400b76:	68 12 00 00 00       	pushq  $0x12
  400b7b:	e9 c0 fe ff ff       	jmpq   400a40 <_init+0x18>

0000000000400b80 <signal@plt>:
  400b80:	ff 25 52 27 20 00    	jmpq   *0x202752(%rip)        # 6032d8 <_GLOBAL_OFFSET_TABLE_+0xb0>
  400b86:	68 13 00 00 00       	pushq  $0x13
  400b8b:	e9 b0 fe ff ff       	jmpq   400a40 <_init+0x18>

0000000000400b90 <socket@plt>:
  400b90:	ff 25 4a 27 20 00    	jmpq   *0x20274a(%rip)        # 6032e0 <_GLOBAL_OFFSET_TABLE_+0xb8>
  400b96:	68 14 00 00 00       	pushq  $0x14
  400b9b:	e9 a0 fe ff ff       	jmpq   400a40 <_init+0x18>

0000000000400ba0 <getenv@plt>:
  400ba0:	ff 25 42 27 20 00    	jmpq   *0x202742(%rip)        # 6032e8 <_GLOBAL_OFFSET_TABLE_+0xc0>
  400ba6:	68 15 00 00 00       	pushq  $0x15
  400bab:	e9 90 fe ff ff       	jmpq   400a40 <_init+0x18>

0000000000400bb0 <alarm@plt>:
  400bb0:	ff 25 3a 27 20 00    	jmpq   *0x20273a(%rip)        # 6032f0 <_GLOBAL_OFFSET_TABLE_+0xc8>
  400bb6:	68 16 00 00 00       	pushq  $0x16
  400bbb:	e9 80 fe ff ff       	jmpq   400a40 <_init+0x18>

0000000000400bc0 <__errno_location@plt>:
  400bc0:	ff 25 32 27 20 00    	jmpq   *0x202732(%rip)        # 6032f8 <_GLOBAL_OFFSET_TABLE_+0xd0>
  400bc6:	68 17 00 00 00       	pushq  $0x17
  400bcb:	e9 70 fe ff ff       	jmpq   400a40 <_init+0x18>

0000000000400bd0 <strcpy@plt>:
  400bd0:	ff 25 2a 27 20 00    	jmpq   *0x20272a(%rip)        # 603300 <_GLOBAL_OFFSET_TABLE_+0xd8>
  400bd6:	68 18 00 00 00       	pushq  $0x18
  400bdb:	e9 60 fe ff ff       	jmpq   400a40 <_init+0x18>

0000000000400be0 <fprintf@plt>:
  400be0:	ff 25 22 27 20 00    	jmpq   *0x202722(%rip)        # 603308 <_GLOBAL_OFFSET_TABLE_+0xe0>
  400be6:	68 19 00 00 00       	pushq  $0x19
  400beb:	e9 50 fe ff ff       	jmpq   400a40 <_init+0x18>

0000000000400bf0 <write@plt>:
  400bf0:	ff 25 1a 27 20 00    	jmpq   *0x20271a(%rip)        # 603310 <_GLOBAL_OFFSET_TABLE_+0xe8>
  400bf6:	68 1a 00 00 00       	pushq  $0x1a
  400bfb:	e9 40 fe ff ff       	jmpq   400a40 <_init+0x18>

0000000000400c00 <fflush@plt>:
  400c00:	ff 25 12 27 20 00    	jmpq   *0x202712(%rip)        # 603318 <_GLOBAL_OFFSET_TABLE_+0xf0>
  400c06:	68 1b 00 00 00       	pushq  $0x1b
  400c0b:	e9 30 fe ff ff       	jmpq   400a40 <_init+0x18>

Disassembly of section .text:

0000000000400c10 <_start>:
  400c10:	31 ed                	xor    %ebp,%ebp
  400c12:	49 89 d1             	mov    %rdx,%r9
  400c15:	5e                   	pop    %rsi
  400c16:	48 89 e2             	mov    %rsp,%rdx
  400c19:	48 83 e4 f0          	and    $0xfffffffffffffff0,%rsp
  400c1d:	50                   	push   %rax
  400c1e:	54                   	push   %rsp
  400c1f:	49 c7 c0 80 23 40 00 	mov    $0x402380,%r8
  400c26:	48 c7 c1 90 23 40 00 	mov    $0x402390,%rcx
  400c2d:	48 c7 c7 e8 0c 40 00 	mov    $0x400ce8,%rdi
  400c34:	e8 a7 fe ff ff       	callq  400ae0 <__libc_start_main@plt>
  400c39:	f4                   	hlt    
  400c3a:	90                   	nop
  400c3b:	90                   	nop

0000000000400c3c <call_gmon_start>:
  400c3c:	48 83 ec 08          	sub    $0x8,%rsp
  400c40:	48 8b 05 d9 25 20 00 	mov    0x2025d9(%rip),%rax        # 603220 <_DYNAMIC+0x190>
  400c47:	48 85 c0             	test   %rax,%rax
  400c4a:	74 02                	je     400c4e <call_gmon_start+0x12>
  400c4c:	ff d0                	callq  *%rax
  400c4e:	48 83 c4 08          	add    $0x8,%rsp
  400c52:	c3                   	retq   
  400c53:	90                   	nop
  400c54:	90                   	nop
  400c55:	90                   	nop
  400c56:	90                   	nop
  400c57:	90                   	nop
  400c58:	90                   	nop
  400c59:	90                   	nop
  400c5a:	90                   	nop
  400c5b:	90                   	nop
  400c5c:	90                   	nop
  400c5d:	90                   	nop
  400c5e:	90                   	nop
  400c5f:	90                   	nop

0000000000400c60 <__do_global_dtors_aux>:
  400c60:	55                   	push   %rbp
  400c61:	48 89 e5             	mov    %rsp,%rbp
  400c64:	53                   	push   %rbx
  400c65:	48 83 ec 08          	sub    $0x8,%rsp
  400c69:	80 3d d0 2f 20 00 00 	cmpb   $0x0,0x202fd0(%rip)        # 603c40 <completed.6145>
  400c70:	75 44                	jne    400cb6 <__do_global_dtors_aux+0x56>
  400c72:	b8 80 30 60 00       	mov    $0x603080,%eax
  400c77:	48 2d 78 30 60 00    	sub    $0x603078,%rax
  400c7d:	48 c1 f8 03          	sar    $0x3,%rax
  400c81:	48 8d 58 ff          	lea    -0x1(%rax),%rbx
  400c85:	48 8b 05 ac 2f 20 00 	mov    0x202fac(%rip),%rax        # 603c38 <dtor_idx.6147>
  400c8c:	48 39 c3             	cmp    %rax,%rbx
  400c8f:	76 1e                	jbe    400caf <__do_global_dtors_aux+0x4f>
  400c91:	48 83 c0 01          	add    $0x1,%rax
  400c95:	48 89 05 9c 2f 20 00 	mov    %rax,0x202f9c(%rip)        # 603c38 <dtor_idx.6147>
  400c9c:	ff 14 c5 78 30 60 00 	callq  *0x603078(,%rax,8)
  400ca3:	48 8b 05 8e 2f 20 00 	mov    0x202f8e(%rip),%rax        # 603c38 <dtor_idx.6147>
  400caa:	48 39 c3             	cmp    %rax,%rbx
  400cad:	77 e2                	ja     400c91 <__do_global_dtors_aux+0x31>
  400caf:	c6 05 8a 2f 20 00 01 	movb   $0x1,0x202f8a(%rip)        # 603c40 <completed.6145>
  400cb6:	48 83 c4 08          	add    $0x8,%rsp
  400cba:	5b                   	pop    %rbx
  400cbb:	c9                   	leaveq 
  400cbc:	c3                   	retq   
  400cbd:	0f 1f 00             	nopl   (%rax)

0000000000400cc0 <frame_dummy>:
  400cc0:	55                   	push   %rbp
  400cc1:	48 83 3d bf 23 20 00 	cmpq   $0x0,0x2023bf(%rip)        # 603088 <__JCR_END__>
  400cc8:	00 
  400cc9:	48 89 e5             	mov    %rsp,%rbp
  400ccc:	74 16                	je     400ce4 <frame_dummy+0x24>
  400cce:	b8 00 00 00 00       	mov    $0x0,%eax
  400cd3:	48 85 c0             	test   %rax,%rax
  400cd6:	74 0c                	je     400ce4 <frame_dummy+0x24>
  400cd8:	bf 88 30 60 00       	mov    $0x603088,%edi
  400cdd:	49 89 c3             	mov    %rax,%r11
  400ce0:	c9                   	leaveq 
  400ce1:	41 ff e3             	jmpq   *%r11
  400ce4:	c9                   	leaveq 
  400ce5:	c3                   	retq   
  400ce6:	90                   	nop
  400ce7:	90                   	nop

0000000000400ce8 <main>:
  400ce8:	53                   	push   %rbx
  400ce9:	48 89 f3             	mov    %rsi,%rbx
  400cec:	83 ff 01             	cmp    $0x1,%edi
  400cef:	75 10                	jne    400d01 <main+0x19>
  400cf1:	48 8b 05 28 2f 20 00 	mov    0x202f28(%rip),%rax        # 603c20 <__bss_start>
  400cf8:	48 89 05 49 2f 20 00 	mov    %rax,0x202f49(%rip)        # 603c48 <infile>
  400cff:	eb 56                	jmp    400d57 <main+0x6f>
  400d01:	83 ff 02             	cmp    $0x2,%edi
  400d04:	75 35                	jne    400d3b <main+0x53>
  400d06:	be 80 24 40 00       	mov    $0x402480,%esi
  400d0b:	48 8b 7b 08          	mov    0x8(%rbx),%rdi
  400d0f:	e8 bc fd ff ff       	callq  400ad0 <fopen@plt>
  400d14:	48 89 05 2d 2f 20 00 	mov    %rax,0x202f2d(%rip)        # 603c48 <infile>
  400d1b:	48 85 c0             	test   %rax,%rax
  400d1e:	75 37                	jne    400d57 <main+0x6f>
  400d20:	48 8b 53 08          	mov    0x8(%rbx),%rdx
  400d24:	48 8b 33             	mov    (%rbx),%rsi
  400d27:	bf 82 24 40 00       	mov    $0x402482,%edi
  400d2c:	e8 1f fd ff ff       	callq  400a50 <printf@plt>
  400d31:	bf 08 00 00 00       	mov    $0x8,%edi
  400d36:	e8 65 fd ff ff       	callq  400aa0 <exit@plt>
  400d3b:	48 8b 36             	mov    (%rsi),%rsi
  400d3e:	bf 9f 24 40 00       	mov    $0x40249f,%edi
  400d43:	b8 00 00 00 00       	mov    $0x0,%eax
  400d48:	e8 03 fd ff ff       	callq  400a50 <printf@plt>
  400d4d:	bf 08 00 00 00       	mov    $0x8,%edi
  400d52:	e8 49 fd ff ff       	callq  400aa0 <exit@plt>
  400d57:	e8 65 08 00 00       	callq  4015c1 <initialize_bomb>
  400d5c:	bf 08 25 40 00       	mov    $0x402508,%edi
  400d61:	e8 2a fd ff ff       	callq  400a90 <puts@plt>
  400d66:	bf 48 25 40 00       	mov    $0x402548,%edi
  400d6b:	e8 20 fd ff ff       	callq  400a90 <puts@plt>
  400d70:	e8 22 07 00 00       	callq  401497 <read_line>
  400d75:	48 89 c7             	mov    %rax,%rdi
  400d78:	e8 1d 03 00 00       	callq  40109a <phase_1>
  400d7d:	e8 93 05 00 00       	callq  401315 <phase_defused>
  400d82:	bf 78 25 40 00       	mov    $0x402578,%edi
  400d87:	e8 04 fd ff ff       	callq  400a90 <puts@plt>
  400d8c:	e8 06 07 00 00       	callq  401497 <read_line>
  400d91:	48 89 c7             	mov    %rax,%rdi
  400d94:	e8 59 02 00 00       	callq  400ff2 <phase_2>
  400d99:	e8 77 05 00 00       	callq  401315 <phase_defused>
  400d9e:	bf b9 24 40 00       	mov    $0x4024b9,%edi
  400da3:	e8 e8 fc ff ff       	callq  400a90 <puts@plt>
  400da8:	e8 ea 06 00 00       	callq  401497 <read_line>
  400dad:	48 89 c7             	mov    %rax,%rdi
  400db0:	e8 5e 03 00 00       	callq  401113 <phase_3>
  400db5:	e8 5b 05 00 00       	callq  401315 <phase_defused>
  400dba:	bf d7 24 40 00       	mov    $0x4024d7,%edi
  400dbf:	e8 cc fc ff ff       	callq  400a90 <puts@plt>
  400dc4:	e8 ce 06 00 00       	callq  401497 <read_line>
  400dc9:	48 89 c7             	mov    %rax,%rdi
  400dcc:	e8 e5 02 00 00       	callq  4010b6 <phase_4>
  400dd1:	e8 3f 05 00 00       	callq  401315 <phase_defused>
  400dd6:	bf a8 25 40 00       	mov    $0x4025a8,%edi
  400ddb:	e8 b0 fc ff ff       	callq  400a90 <puts@plt>
  400de0:	e8 b2 06 00 00       	callq  401497 <read_line>
  400de5:	48 89 c7             	mov    %rax,%rdi
  400de8:	e8 51 02 00 00       	callq  40103e <phase_5>
  400ded:	e8 23 05 00 00       	callq  401315 <phase_defused>
  400df2:	bf e6 24 40 00       	mov    $0x4024e6,%edi
  400df7:	e8 94 fc ff ff       	callq  400a90 <puts@plt>
  400dfc:	e8 96 06 00 00       	callq  401497 <read_line>
  400e01:	48 89 c7             	mov    %rax,%rdi
  400e04:	e8 d4 00 00 00       	callq  400edd <phase_6>
  400e09:	e8 07 05 00 00       	callq  401315 <phase_defused>
  400e0e:	b8 00 00 00 00       	mov    $0x0,%eax
  400e13:	5b                   	pop    %rbx
  400e14:	c3                   	retq   
  400e15:	90                   	nop
  400e16:	90                   	nop
  400e17:	90                   	nop
  400e18:	90                   	nop
  400e19:	90                   	nop
  400e1a:	90                   	nop
  400e1b:	90                   	nop
  400e1c:	90                   	nop
  400e1d:	90                   	nop
  400e1e:	90                   	nop
  400e1f:	90                   	nop

0000000000400e20 <func4>:
  400e20:	53                   	push   %rbx
  400e21:	89 d1                	mov    %edx,%ecx
  400e23:	29 f2                	sub    %esi,%edx
  400e25:	89 d0                	mov    %edx,%eax
  400e27:	c1 e8 1f             	shr    $0x1f,%eax
  400e2a:	01 d0                	add    %edx,%eax
  400e2c:	d1 f8                	sar    %eax
  400e2e:	8d 1c 30             	lea    (%rax,%rsi,1),%ebx
  400e31:	39 fb                	cmp    %edi,%ebx
  400e33:	7e 0c                	jle    400e41 <func4+0x21>
  400e35:	8d 53 ff             	lea    -0x1(%rbx),%edx
  400e38:	e8 e3 ff ff ff       	callq  400e20 <func4>
  400e3d:	01 c3                	add    %eax,%ebx
  400e3f:	eb 10                	jmp    400e51 <func4+0x31>
  400e41:	39 fb                	cmp    %edi,%ebx
  400e43:	7d 0c                	jge    400e51 <func4+0x31>
  400e45:	8d 73 01             	lea    0x1(%rbx),%esi
  400e48:	89 ca                	mov    %ecx,%edx
  400e4a:	e8 d1 ff ff ff       	callq  400e20 <func4>
  400e4f:	01 c3                	add    %eax,%ebx
  400e51:	89 d8                	mov    %ebx,%eax
  400e53:	5b                   	pop    %rbx
  400e54:	c3                   	retq   

0000000000400e55 <fun7>:
  400e55:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
  400e5a:	48 85 ff             	test   %rdi,%rdi
  400e5d:	74 28                	je     400e87 <fun7+0x32>
  400e5f:	8b 17                	mov    (%rdi),%edx
  400e61:	39 f2                	cmp    %esi,%edx
  400e63:	7e 0c                	jle    400e71 <fun7+0x1c>
  400e65:	48 8b 7f 08          	mov    0x8(%rdi),%rdi
  400e69:	e8 e7 ff ff ff       	callq  400e55 <fun7>
  400e6e:	01 c0                	add    %eax,%eax
  400e70:	c3                   	retq   
  400e71:	b8 00 00 00 00       	mov    $0x0,%eax
  400e76:	39 f2                	cmp    %esi,%edx
  400e78:	74 0d                	je     400e87 <fun7+0x32>
  400e7a:	48 8b 7f 10          	mov    0x10(%rdi),%rdi
  400e7e:	e8 d2 ff ff ff       	callq  400e55 <fun7>
  400e83:	8d 44 00 01          	lea    0x1(%rax,%rax,1),%eax
  400e87:	f3 c3                	repz retq 

0000000000400e89 <secret_phase>:
  400e89:	53                   	push   %rbx
  400e8a:	e8 08 06 00 00       	callq  401497 <read_line>
  400e8f:	48 89 c7             	mov    %rax,%rdi
  400e92:	b9 00 00 00 00       	mov    $0x0,%ecx
  400e97:	ba 0a 00 00 00       	mov    $0xa,%edx
  400e9c:	be 00 00 00 00       	mov    $0x0,%esi
  400ea1:	e8 8a fc ff ff       	callq  400b30 <__strtol_internal@plt>
  400ea6:	89 c3                	mov    %eax,%ebx
  400ea8:	8d 40 ff             	lea    -0x1(%rax),%eax
  400eab:	3d e8 03 00 00       	cmp    $0x3e8,%eax
  400eb0:	76 05                	jbe    400eb7 <secret_phase+0x2e>
  400eb2:	e8 ea 04 00 00       	callq  4013a1 <explode_bomb>
  400eb7:	89 de                	mov    %ebx,%esi
  400eb9:	bf 80 39 60 00       	mov    $0x603980,%edi
  400ebe:	e8 92 ff ff ff       	callq  400e55 <fun7>
  400ec3:	85 c0                	test   %eax,%eax
  400ec5:	74 05                	je     400ecc <secret_phase+0x43>
  400ec7:	e8 d5 04 00 00       	callq  4013a1 <explode_bomb>
  400ecc:	bf d0 25 40 00       	mov    $0x4025d0,%edi
  400ed1:	e8 ba fb ff ff       	callq  400a90 <puts@plt>
  400ed6:	e8 3a 04 00 00       	callq  401315 <phase_defused>
  400edb:	5b                   	pop    %rbx
  400edc:	c3                   	retq   

0000000000400edd <phase_6>:
  400edd:	41 57                	push   %r15
  400edf:	41 56                	push   %r14
  400ee1:	41 55                	push   %r13
  400ee3:	41 54                	push   %r12
  400ee5:	55                   	push   %rbp
  400ee6:	53                   	push   %rbx
  400ee7:	48 83 ec 58          	sub    $0x58,%rsp
  400eeb:	48 8d 74 24 30       	lea    0x30(%rsp),%rsi
  400ef0:	e8 e2 04 00 00       	callq  4013d7 <read_six_numbers>
  400ef5:	41 bd 00 00 00 00    	mov    $0x0,%r13d
  400efb:	4c 8d 74 24 30       	lea    0x30(%rsp),%r14
  400f00:	4d 89 f7             	mov    %r14,%r15
  400f03:	4d 89 ec             	mov    %r13,%r12
  400f06:	43 8b 04 ae          	mov    (%r14,%r13,4),%eax
  400f0a:	83 e8 01             	sub    $0x1,%eax
  400f0d:	83 f8 05             	cmp    $0x5,%eax
  400f10:	76 05                	jbe    400f17 <phase_6+0x3a>
  400f12:	e8 8a 04 00 00       	callq  4013a1 <explode_bomb>
  400f17:	41 8d 5d 01          	lea    0x1(%r13),%ebx
  400f1b:	49 83 fd 05          	cmp    $0x5,%r13
  400f1f:	0f 84 aa 00 00 00    	je     400fcf <phase_6+0xf2>
  400f25:	4c 89 fd             	mov    %r15,%rbp
  400f28:	48 63 d3             	movslq %ebx,%rdx
  400f2b:	42 8b 44 a5 00       	mov    0x0(%rbp,%r12,4),%eax
  400f30:	3b 44 94 30          	cmp    0x30(%rsp,%rdx,4),%eax
  400f34:	75 05                	jne    400f3b <phase_6+0x5e>
  400f36:	e8 66 04 00 00       	callq  4013a1 <explode_bomb>
  400f3b:	83 c3 01             	add    $0x1,%ebx
  400f3e:	83 fb 05             	cmp    $0x5,%ebx
  400f41:	7e e5                	jle    400f28 <phase_6+0x4b>
  400f43:	49 83 c5 01          	add    $0x1,%r13
  400f47:	eb ba                	jmp    400f03 <phase_6+0x26>
  400f49:	48 8b 76 08          	mov    0x8(%rsi),%rsi
  400f4d:	83 c2 01             	add    $0x1,%edx
  400f50:	48 63 c1             	movslq %ecx,%rax
  400f53:	3b 54 84 30          	cmp    0x30(%rsp,%rax,4),%edx
  400f57:	7c f0                	jl     400f49 <phase_6+0x6c>
  400f59:	48 89 34 c4          	mov    %rsi,(%rsp,%rax,8)
  400f5d:	83 c1 01             	add    $0x1,%ecx
  400f60:	83 f9 05             	cmp    $0x5,%ecx
  400f63:	7f 0c                	jg     400f71 <phase_6+0x94>
  400f65:	be b0 37 60 00       	mov    $0x6037b0,%esi
  400f6a:	ba 01 00 00 00       	mov    $0x1,%edx
  400f6f:	eb df                	jmp    400f50 <phase_6+0x73>
  400f71:	48 8b 0c 24          	mov    (%rsp),%rcx
  400f75:	48 8b 44 24 08       	mov    0x8(%rsp),%rax
  400f7a:	48 89 41 08          	mov    %rax,0x8(%rcx)
  400f7e:	48 8b 54 24 10       	mov    0x10(%rsp),%rdx
  400f83:	48 89 50 08          	mov    %rdx,0x8(%rax)
  400f87:	48 8b 44 24 18       	mov    0x18(%rsp),%rax
  400f8c:	48 89 42 08          	mov    %rax,0x8(%rdx)
  400f90:	48 8b 54 24 20       	mov    0x20(%rsp),%rdx
  400f95:	48 89 50 08          	mov    %rdx,0x8(%rax)
  400f99:	48 8b 44 24 28       	mov    0x28(%rsp),%rax
  400f9e:	48 89 42 08          	mov    %rax,0x8(%rdx)
  400fa2:	48 c7 40 08 00 00 00 	movq   $0x0,0x8(%rax)
  400fa9:	00 
  400faa:	48 89 cb             	mov    %rcx,%rbx
  400fad:	bd 00 00 00 00       	mov    $0x0,%ebp
  400fb2:	48 8b 53 08          	mov    0x8(%rbx),%rdx
  400fb6:	8b 03                	mov    (%rbx),%eax
  400fb8:	3b 02                	cmp    (%rdx),%eax
  400fba:	7e 05                	jle    400fc1 <phase_6+0xe4>
  400fbc:	e8 e0 03 00 00       	callq  4013a1 <explode_bomb>
  400fc1:	48 8b 5b 08          	mov    0x8(%rbx),%rbx
  400fc5:	83 c5 01             	add    $0x1,%ebp
  400fc8:	83 fd 05             	cmp    $0x5,%ebp
  400fcb:	74 16                	je     400fe3 <phase_6+0x106>
  400fcd:	eb e3                	jmp    400fb2 <phase_6+0xd5>
  400fcf:	be b0 37 60 00       	mov    $0x6037b0,%esi
  400fd4:	ba 01 00 00 00       	mov    $0x1,%edx
  400fd9:	b9 00 00 00 00       	mov    $0x0,%ecx
  400fde:	e9 6d ff ff ff       	jmpq   400f50 <phase_6+0x73>
  400fe3:	48 83 c4 58          	add    $0x58,%rsp
  400fe7:	5b                   	pop    %rbx
  400fe8:	5d                   	pop    %rbp
  400fe9:	41 5c                	pop    %r12
  400feb:	41 5d                	pop    %r13
  400fed:	41 5e                	pop    %r14
  400fef:	41 5f                	pop    %r15
  400ff1:	c3                   	retq   

0000000000400ff2 <phase_2>:
  400ff2:	55                   	push   %rbp
  400ff3:	53                   	push   %rbx
  400ff4:	48 83 ec 28          	sub    $0x28,%rsp
  400ff8:	48 89 e6             	mov    %rsp,%rsi
  400ffb:	e8 d7 03 00 00       	callq  4013d7 <read_six_numbers>
  401000:	83 3c 24 00          	cmpl   $0x0,(%rsp)
  401004:	75 07                	jne    40100d <phase_2+0x1b>
  401006:	83 7c 24 04 01       	cmpl   $0x1,0x4(%rsp)
  40100b:	74 08                	je     401015 <phase_2+0x23>
  40100d:	0f 1f 00             	nopl   (%rax)
  401010:	e8 8c 03 00 00       	callq  4013a1 <explode_bomb>
  401015:	48 8d 5c 24 08       	lea    0x8(%rsp),%rbx
  40101a:	48 8d 6c 24 18       	lea    0x18(%rsp),%rbp
  40101f:	8b 43 f8             	mov    -0x8(%rbx),%eax
  401022:	03 43 fc             	add    -0x4(%rbx),%eax
  401025:	39 03                	cmp    %eax,(%rbx)
  401027:	74 05                	je     40102e <phase_2+0x3c>
  401029:	e8 73 03 00 00       	callq  4013a1 <explode_bomb>
  40102e:	48 83 c3 04          	add    $0x4,%rbx
  401032:	48 39 eb             	cmp    %rbp,%rbx
  401035:	75 e8                	jne    40101f <phase_2+0x2d>
  401037:	48 83 c4 28          	add    $0x28,%rsp
  40103b:	5b                   	pop    %rbx
  40103c:	5d                   	pop    %rbp
  40103d:	c3                   	retq   

000000000040103e <phase_5>:
  40103e:	53                   	push   %rbx
  40103f:	48 83 ec 10          	sub    $0x10,%rsp
  401043:	48 89 fb             	mov    %rdi,%rbx
  401046:	e8 65 01 00 00       	callq  4011b0 <string_length>
  40104b:	83 f8 06             	cmp    $0x6,%eax
  40104e:	74 05                	je     401055 <phase_5+0x17>
  401050:	e8 4c 03 00 00       	callq  4013a1 <explode_bomb>
  401055:	ba 00 00 00 00       	mov    $0x0,%edx
  40105a:	48 89 e7             	mov    %rsp,%rdi
  40105d:	48 0f be 04 1a       	movsbq (%rdx,%rbx,1),%rax
  401062:	83 e0 0f             	and    $0xf,%eax
  401065:	0f b6 80 70 26 40 00 	movzbl 0x402670(%rax),%eax
  40106c:	88 04 3a             	mov    %al,(%rdx,%rdi,1)
  40106f:	48 83 c2 01          	add    $0x1,%rdx
  401073:	48 83 fa 06          	cmp    $0x6,%rdx
  401077:	75 e4                	jne    40105d <phase_5+0x1f>
  401079:	c6 44 24 06 00       	movb   $0x0,0x6(%rsp)
  40107e:	be 29 26 40 00       	mov    $0x402629,%esi
  401083:	48 89 e7             	mov    %rsp,%rdi
  401086:	e8 44 01 00 00       	callq  4011cf <strings_not_equal>
  40108b:	85 c0                	test   %eax,%eax
  40108d:	74 05                	je     401094 <phase_5+0x56>
  40108f:	e8 0d 03 00 00       	callq  4013a1 <explode_bomb>
  401094:	48 83 c4 10          	add    $0x10,%rsp
  401098:	5b                   	pop    %rbx
  401099:	c3                   	retq   

000000000040109a <phase_1>:
  40109a:	48 83 ec 08          	sub    $0x8,%rsp
  40109e:	be f8 25 40 00       	mov    $0x4025f8,%esi
  4010a3:	e8 27 01 00 00       	callq  4011cf <strings_not_equal>
  4010a8:	85 c0                	test   %eax,%eax
  4010aa:	74 05                	je     4010b1 <phase_1+0x17>
  4010ac:	e8 f0 02 00 00       	callq  4013a1 <explode_bomb>
  4010b1:	48 83 c4 08          	add    $0x8,%rsp
  4010b5:	c3                   	retq   

00000000004010b6 <phase_4>:
  4010b6:	48 83 ec 18          	sub    $0x18,%rsp
  4010ba:	48 8d 4c 24 10       	lea    0x10(%rsp),%rcx
  4010bf:	48 8d 54 24 14       	lea    0x14(%rsp),%rdx
  4010c4:	be ed 26 40 00       	mov    $0x4026ed,%esi
  4010c9:	b8 00 00 00 00       	mov    $0x0,%eax
  4010ce:	e8 6d fa ff ff       	callq  400b40 <sscanf@plt>
  4010d3:	83 f8 02             	cmp    $0x2,%eax
  4010d6:	75 0d                	jne    4010e5 <phase_4+0x2f>
  4010d8:	8b 44 24 14          	mov    0x14(%rsp),%eax
  4010dc:	85 c0                	test   %eax,%eax
  4010de:	78 05                	js     4010e5 <phase_4+0x2f>
  4010e0:	83 f8 0e             	cmp    $0xe,%eax
  4010e3:	7e 05                	jle    4010ea <phase_4+0x34>
  4010e5:	e8 b7 02 00 00       	callq  4013a1 <explode_bomb>
  4010ea:	8b 7c 24 14          	mov    0x14(%rsp),%edi
  4010ee:	ba 0e 00 00 00       	mov    $0xe,%edx
  4010f3:	be 00 00 00 00       	mov    $0x0,%esi
  4010f8:	e8 23 fd ff ff       	callq  400e20 <func4>
  4010fd:	83 f8 15             	cmp    $0x15,%eax
  401100:	75 07                	jne    401109 <phase_4+0x53>
  401102:	83 7c 24 10 15       	cmpl   $0x15,0x10(%rsp)
  401107:	74 05                	je     40110e <phase_4+0x58>
  401109:	e8 93 02 00 00       	callq  4013a1 <explode_bomb>
  40110e:	48 83 c4 18          	add    $0x18,%rsp
  401112:	c3                   	retq   

0000000000401113 <phase_3>:
  401113:	48 83 ec 18          	sub    $0x18,%rsp
  401117:	48 8d 4c 24 10       	lea    0x10(%rsp),%rcx
  40111c:	48 8d 54 24 14       	lea    0x14(%rsp),%rdx
  401121:	be ed 26 40 00       	mov    $0x4026ed,%esi
  401126:	b8 00 00 00 00       	mov    $0x0,%eax
  40112b:	e8 10 fa ff ff       	callq  400b40 <sscanf@plt>
  401130:	83 f8 01             	cmp    $0x1,%eax
  401133:	7f 05                	jg     40113a <phase_3+0x27>
  401135:	e8 67 02 00 00       	callq  4013a1 <explode_bomb>
  40113a:	83 7c 24 14 07       	cmpl   $0x7,0x14(%rsp)
  40113f:	90                   	nop
  401140:	77 47                	ja     401189 <phase_3+0x76>
  401142:	8b 44 24 14          	mov    0x14(%rsp),%eax
  401146:	ff 24 c5 30 26 40 00 	jmpq   *0x402630(,%rax,8)
  40114d:	b8 cf 02 00 00       	mov    $0x2cf,%eax
  401152:	eb 46                	jmp    40119a <phase_3+0x87>
  401154:	b8 d0 00 00 00       	mov    $0xd0,%eax
  401159:	eb 3f                	jmp    40119a <phase_3+0x87>
  40115b:	b8 c1 03 00 00       	mov    $0x3c1,%eax
  401160:	eb 38                	jmp    40119a <phase_3+0x87>
  401162:	b8 5b 01 00 00       	mov    $0x15b,%eax
  401167:	eb 31                	jmp    40119a <phase_3+0x87>
  401169:	b8 49 00 00 00       	mov    $0x49,%eax
  40116e:	66 90                	xchg   %ax,%ax
  401170:	eb 28                	jmp    40119a <phase_3+0x87>
  401172:	b8 bc 03 00 00       	mov    $0x3bc,%eax
  401177:	eb 21                	jmp    40119a <phase_3+0x87>
  401179:	b8 8c 03 00 00       	mov    $0x38c,%eax
  40117e:	66 90                	xchg   %ax,%ax
  401180:	eb 18                	jmp    40119a <phase_3+0x87>
  401182:	b8 10 02 00 00       	mov    $0x210,%eax
  401187:	eb 11                	jmp    40119a <phase_3+0x87>
  401189:	0f 1f 80 00 00 00 00 	nopl   0x0(%rax)
  401190:	e8 0c 02 00 00       	callq  4013a1 <explode_bomb>
  401195:	b8 00 00 00 00       	mov    $0x0,%eax
  40119a:	3b 44 24 10          	cmp    0x10(%rsp),%eax
  40119e:	74 05                	je     4011a5 <phase_3+0x92>
  4011a0:	e8 fc 01 00 00       	callq  4013a1 <explode_bomb>
  4011a5:	48 83 c4 18          	add    $0x18,%rsp
  4011a9:	c3                   	retq   
  4011aa:	90                   	nop
  4011ab:	90                   	nop
  4011ac:	90                   	nop
  4011ad:	90                   	nop
  4011ae:	90                   	nop
  4011af:	90                   	nop

00000000004011b0 <string_length>:
  4011b0:	b8 00 00 00 00       	mov    $0x0,%eax
  4011b5:	80 3f 00             	cmpb   $0x0,(%rdi)
  4011b8:	74 13                	je     4011cd <string_length+0x1d>
  4011ba:	48 89 fa             	mov    %rdi,%rdx
  4011bd:	0f b6 42 01          	movzbl 0x1(%rdx),%eax
  4011c1:	48 83 c2 01          	add    $0x1,%rdx
  4011c5:	84 c0                	test   %al,%al
  4011c7:	75 f4                	jne    4011bd <string_length+0xd>
  4011c9:	89 d0                	mov    %edx,%eax
  4011cb:	29 f8                	sub    %edi,%eax
  4011cd:	f3 c3                	repz retq 

00000000004011cf <strings_not_equal>:
  4011cf:	41 54                	push   %r12
  4011d1:	55                   	push   %rbp
  4011d2:	53                   	push   %rbx
  4011d3:	48 89 fd             	mov    %rdi,%rbp
  4011d6:	49 89 f4             	mov    %rsi,%r12
  4011d9:	e8 d2 ff ff ff       	callq  4011b0 <string_length>
  4011de:	89 c3                	mov    %eax,%ebx
  4011e0:	4c 89 e7             	mov    %r12,%rdi
  4011e3:	e8 c8 ff ff ff       	callq  4011b0 <string_length>
  4011e8:	39 c3                	cmp    %eax,%ebx
  4011ea:	75 32                	jne    40121e <strings_not_equal+0x4f>
  4011ec:	0f b6 45 00          	movzbl 0x0(%rbp),%eax
  4011f0:	84 c0                	test   %al,%al
  4011f2:	74 31                	je     401225 <strings_not_equal+0x56>
  4011f4:	48 89 e9             	mov    %rbp,%rcx
  4011f7:	4c 89 e2             	mov    %r12,%rdx
  4011fa:	41 3a 04 24          	cmp    (%r12),%al
  4011fe:	74 13                	je     401213 <strings_not_equal+0x44>
  401200:	eb 1c                	jmp    40121e <strings_not_equal+0x4f>
  401202:	0f b6 42 01          	movzbl 0x1(%rdx),%eax
  401206:	48 83 c1 01          	add    $0x1,%rcx
  40120a:	48 83 c2 01          	add    $0x1,%rdx
  40120e:	40 38 c6             	cmp    %al,%sil
  401211:	75 0b                	jne    40121e <strings_not_equal+0x4f>
  401213:	0f b6 71 01          	movzbl 0x1(%rcx),%esi
  401217:	40 84 f6             	test   %sil,%sil
  40121a:	75 e6                	jne    401202 <strings_not_equal+0x33>
  40121c:	eb 07                	jmp    401225 <strings_not_equal+0x56>
  40121e:	b8 01 00 00 00       	mov    $0x1,%eax
  401223:	eb 05                	jmp    40122a <strings_not_equal+0x5b>
  401225:	b8 00 00 00 00       	mov    $0x0,%eax
  40122a:	5b                   	pop    %rbx
  40122b:	5d                   	pop    %rbp
  40122c:	41 5c                	pop    %r12
  40122e:	66 90                	xchg   %ax,%ax
  401230:	c3                   	retq   

0000000000401231 <initialize_bomb_solve>:
  401231:	f3 c3                	repz retq 

0000000000401233 <invalid_phase>:
  401233:	48 83 ec 08          	sub    $0x8,%rsp
  401237:	48 89 fe             	mov    %rdi,%rsi
  40123a:	bf 80 26 40 00       	mov    $0x402680,%edi
  40123f:	b8 00 00 00 00       	mov    $0x0,%eax
  401244:	e8 07 f8 ff ff       	callq  400a50 <printf@plt>
  401249:	bf 08 00 00 00       	mov    $0x8,%edi
  40124e:	e8 4d f8 ff ff       	callq  400aa0 <exit@plt>

0000000000401253 <send_msg>:
  401253:	55                   	push   %rbp
  401254:	53                   	push   %rbx
  401255:	48 81 ec 08 40 00 00 	sub    $0x4008,%rsp
  40125c:	89 fe                	mov    %edi,%esi
  40125e:	44 8b 05 df 29 20 00 	mov    0x2029df(%rip),%r8d        # 603c44 <num_input_strings>
  401265:	49 63 c0             	movslq %r8d,%rax
  401268:	48 8d 04 80          	lea    (%rax,%rax,4),%rax
  40126c:	48 c1 e0 04          	shl    $0x4,%rax
  401270:	48 8d 90 10 3c 60 00 	lea    0x603c10(%rax),%rdx
  401277:	48 89 d7             	mov    %rdx,%rdi
  40127a:	fc                   	cld    
  40127b:	48 c7 c1 ff ff ff ff 	mov    $0xffffffffffffffff,%rcx
  401282:	b8 00 00 00 00       	mov    $0x0,%eax
  401287:	f2 ae                	repnz scas %es:(%rdi),%al
  401289:	48 f7 d1             	not    %rcx
  40128c:	48 83 c1 63          	add    $0x63,%rcx
  401290:	48 81 f9 00 20 00 00 	cmp    $0x2000,%rcx
  401297:	76 14                	jbe    4012ad <send_msg+0x5a>
  401299:	bf 68 28 40 00       	mov    $0x402868,%edi
  40129e:	e8 ad f7 ff ff       	callq  400a50 <printf@plt>
  4012a3:	bf 08 00 00 00       	mov    $0x8,%edi
  4012a8:	e8 f3 f7 ff ff       	callq  400aa0 <exit@plt>
  4012ad:	85 f6                	test   %esi,%esi
  4012af:	b9 99 26 40 00       	mov    $0x402699,%ecx
  4012b4:	b8 91 26 40 00       	mov    $0x402691,%eax
  4012b9:	48 0f 45 c8          	cmovne %rax,%rcx
  4012bd:	48 8d 9c 24 00 20 00 	lea    0x2000(%rsp),%rbx
  4012c4:	00 
  4012c5:	49 89 d1             	mov    %rdx,%r9
  4012c8:	8b 15 72 20 20 00    	mov    0x202072(%rip),%edx        # 603340 <bomb_id>
  4012ce:	be a2 26 40 00       	mov    $0x4026a2,%esi
  4012d3:	48 89 df             	mov    %rbx,%rdi
  4012d6:	b8 00 00 00 00       	mov    $0x0,%eax
  4012db:	e8 40 f8 ff ff       	callq  400b20 <sprintf@plt>
  4012e0:	48 89 e1             	mov    %rsp,%rcx
  4012e3:	ba 00 00 00 00       	mov    $0x0,%edx
  4012e8:	48 89 de             	mov    %rbx,%rsi
  4012eb:	bf 60 33 60 00       	mov    $0x603360,%edi
  4012f0:	e8 db 0f 00 00       	callq  4022d0 <driver_post>
  4012f5:	85 c0                	test   %eax,%eax
  4012f7:	79 12                	jns    40130b <send_msg+0xb8>
  4012f9:	48 89 e7             	mov    %rsp,%rdi
  4012fc:	e8 8f f7 ff ff       	callq  400a90 <puts@plt>
  401301:	bf 00 00 00 00       	mov    $0x0,%edi
  401306:	e8 95 f7 ff ff       	callq  400aa0 <exit@plt>
  40130b:	48 81 c4 08 40 00 00 	add    $0x4008,%rsp
  401312:	5b                   	pop    %rbx
  401313:	5d                   	pop    %rbp
  401314:	c3                   	retq   

0000000000401315 <phase_defused>:
  401315:	53                   	push   %rbx
  401316:	48 83 ec 60          	sub    $0x60,%rsp
  40131a:	bf 01 00 00 00       	mov    $0x1,%edi
  40131f:	e8 2f ff ff ff       	callq  401253 <send_msg>
  401324:	83 3d 19 29 20 00 06 	cmpl   $0x6,0x202919(%rip)        # 603c44 <num_input_strings>
  40132b:	75 6e                	jne    40139b <phase_defused+0x86>
  40132d:	48 8d 5c 24 10       	lea    0x10(%rsp),%rbx
  401332:	48 8d 4c 24 08       	lea    0x8(%rsp),%rcx
  401337:	48 8d 54 24 0c       	lea    0xc(%rsp),%rdx
  40133c:	49 89 d8             	mov    %rbx,%r8
  40133f:	be ae 26 40 00       	mov    $0x4026ae,%esi
  401344:	bf 50 3d 60 00       	mov    $0x603d50,%edi
  401349:	b8 00 00 00 00       	mov    $0x0,%eax
  40134e:	e8 ed f7 ff ff       	callq  400b40 <sscanf@plt>
  401353:	83 f8 03             	cmp    $0x3,%eax
  401356:	75 2f                	jne    401387 <phase_defused+0x72>
  401358:	be b7 26 40 00       	mov    $0x4026b7,%esi
  40135d:	48 89 df             	mov    %rbx,%rdi
  401360:	e8 6a fe ff ff       	callq  4011cf <strings_not_equal>
  401365:	85 c0                	test   %eax,%eax
  401367:	75 1e                	jne    401387 <phase_defused+0x72>
  401369:	bf 90 28 40 00       	mov    $0x402890,%edi
  40136e:	e8 1d f7 ff ff       	callq  400a90 <puts@plt>
  401373:	bf b8 28 40 00       	mov    $0x4028b8,%edi
  401378:	e8 13 f7 ff ff       	callq  400a90 <puts@plt>
  40137d:	b8 00 00 00 00       	mov    $0x0,%eax
  401382:	e8 02 fb ff ff       	callq  400e89 <secret_phase>
  401387:	bf f0 28 40 00       	mov    $0x4028f0,%edi
  40138c:	e8 ff f6 ff ff       	callq  400a90 <puts@plt>
  401391:	bf 20 29 40 00       	mov    $0x402920,%edi
  401396:	e8 f5 f6 ff ff       	callq  400a90 <puts@plt>
  40139b:	48 83 c4 60          	add    $0x60,%rsp
  40139f:	5b                   	pop    %rbx
  4013a0:	c3                   	retq   

00000000004013a1 <explode_bomb>:
  4013a1:	48 83 ec 08          	sub    $0x8,%rsp
  4013a5:	bf c1 26 40 00       	mov    $0x4026c1,%edi
  4013aa:	e8 e1 f6 ff ff       	callq  400a90 <puts@plt>
  4013af:	bf ca 26 40 00       	mov    $0x4026ca,%edi
  4013b4:	e8 d7 f6 ff ff       	callq  400a90 <puts@plt>
  4013b9:	bf 00 00 00 00       	mov    $0x0,%edi
  4013be:	e8 90 fe ff ff       	callq  401253 <send_msg>
  4013c3:	bf 68 29 40 00       	mov    $0x402968,%edi
  4013c8:	e8 c3 f6 ff ff       	callq  400a90 <puts@plt>
  4013cd:	bf 08 00 00 00       	mov    $0x8,%edi
  4013d2:	e8 c9 f6 ff ff       	callq  400aa0 <exit@plt>

00000000004013d7 <read_six_numbers>:
  4013d7:	48 83 ec 18          	sub    $0x18,%rsp
  4013db:	48 8d 4e 04          	lea    0x4(%rsi),%rcx
  4013df:	48 8d 46 14          	lea    0x14(%rsi),%rax
  4013e3:	48 89 44 24 08       	mov    %rax,0x8(%rsp)
  4013e8:	48 8d 46 10          	lea    0x10(%rsi),%rax
  4013ec:	48 89 04 24          	mov    %rax,(%rsp)
  4013f0:	4c 8d 4e 0c          	lea    0xc(%rsi),%r9
  4013f4:	4c 8d 46 08          	lea    0x8(%rsi),%r8
  4013f8:	48 89 f2             	mov    %rsi,%rdx
  4013fb:	be e1 26 40 00       	mov    $0x4026e1,%esi
  401400:	b8 00 00 00 00       	mov    $0x0,%eax
  401405:	e8 36 f7 ff ff       	callq  400b40 <sscanf@plt>
  40140a:	83 f8 05             	cmp    $0x5,%eax
  40140d:	7f 05                	jg     401414 <read_six_numbers+0x3d>
  40140f:	e8 8d ff ff ff       	callq  4013a1 <explode_bomb>
  401414:	48 83 c4 18          	add    $0x18,%rsp
  401418:	c3                   	retq   

0000000000401419 <blank_line>:
  401419:	55                   	push   %rbp
  40141a:	53                   	push   %rbx
  40141b:	48 83 ec 08          	sub    $0x8,%rsp
  40141f:	48 89 fd             	mov    %rdi,%rbp
  401422:	eb 1e                	jmp    401442 <blank_line+0x29>
  401424:	e8 e7 f6 ff ff       	callq  400b10 <__ctype_b_loc@plt>
  401429:	48 0f be d3          	movsbq %bl,%rdx
  40142d:	48 8b 00             	mov    (%rax),%rax
  401430:	f6 44 50 01 20       	testb  $0x20,0x1(%rax,%rdx,2)
  401435:	75 07                	jne    40143e <blank_line+0x25>
  401437:	b8 00 00 00 00       	mov    $0x0,%eax
  40143c:	eb 11                	jmp    40144f <blank_line+0x36>
  40143e:	48 83 c5 01          	add    $0x1,%rbp
  401442:	0f b6 5d 00          	movzbl 0x0(%rbp),%ebx
  401446:	84 db                	test   %bl,%bl
  401448:	75 da                	jne    401424 <blank_line+0xb>
  40144a:	b8 01 00 00 00       	mov    $0x1,%eax
  40144f:	48 83 c4 08          	add    $0x8,%rsp
  401453:	5b                   	pop    %rbx
  401454:	5d                   	pop    %rbp
  401455:	c3                   	retq   

0000000000401456 <skip>:
  401456:	53                   	push   %rbx
  401457:	48 63 3d e6 27 20 00 	movslq 0x2027e6(%rip),%rdi        # 603c44 <num_input_strings>
  40145e:	48 8d 3c bf          	lea    (%rdi,%rdi,4),%rdi
  401462:	48 c1 e7 04          	shl    $0x4,%rdi
  401466:	48 81 c7 60 3c 60 00 	add    $0x603c60,%rdi
  40146d:	48 8b 15 d4 27 20 00 	mov    0x2027d4(%rip),%rdx        # 603c48 <infile>
  401474:	be 50 00 00 00       	mov    $0x50,%esi
  401479:	e8 72 f6 ff ff       	callq  400af0 <fgets@plt>
  40147e:	48 89 c3             	mov    %rax,%rbx
  401481:	48 85 c0             	test   %rax,%rax
  401484:	74 0c                	je     401492 <skip+0x3c>
  401486:	48 89 c7             	mov    %rax,%rdi
  401489:	e8 8b ff ff ff       	callq  401419 <blank_line>
  40148e:	85 c0                	test   %eax,%eax
  401490:	75 c5                	jne    401457 <skip+0x1>
  401492:	48 89 d8             	mov    %rbx,%rax
  401495:	5b                   	pop    %rbx
  401496:	c3                   	retq   

0000000000401497 <read_line>:
  401497:	53                   	push   %rbx
  401498:	b8 00 00 00 00       	mov    $0x0,%eax
  40149d:	e8 b4 ff ff ff       	callq  401456 <skip>
  4014a2:	48 85 c0             	test   %rax,%rax
  4014a5:	75 6e                	jne    401515 <read_line+0x7e>
  4014a7:	48 8b 05 72 27 20 00 	mov    0x202772(%rip),%rax        # 603c20 <__bss_start>
  4014ae:	48 39 05 93 27 20 00 	cmp    %rax,0x202793(%rip)        # 603c48 <infile>
  4014b5:	75 14                	jne    4014cb <read_line+0x34>
  4014b7:	bf f3 26 40 00       	mov    $0x4026f3,%edi
  4014bc:	e8 cf f5 ff ff       	callq  400a90 <puts@plt>
  4014c1:	bf 08 00 00 00       	mov    $0x8,%edi
  4014c6:	e8 d5 f5 ff ff       	callq  400aa0 <exit@plt>
  4014cb:	bf 11 27 40 00       	mov    $0x402711,%edi
  4014d0:	e8 cb f6 ff ff       	callq  400ba0 <getenv@plt>
  4014d5:	48 85 c0             	test   %rax,%rax
  4014d8:	74 0a                	je     4014e4 <read_line+0x4d>
  4014da:	bf 00 00 00 00       	mov    $0x0,%edi
  4014df:	e8 bc f5 ff ff       	callq  400aa0 <exit@plt>
  4014e4:	48 8b 05 35 27 20 00 	mov    0x202735(%rip),%rax        # 603c20 <__bss_start>
  4014eb:	48 89 05 56 27 20 00 	mov    %rax,0x202756(%rip)        # 603c48 <infile>
  4014f2:	b8 00 00 00 00       	mov    $0x0,%eax
  4014f7:	e8 5a ff ff ff       	callq  401456 <skip>
  4014fc:	48 85 c0             	test   %rax,%rax
  4014ff:	75 14                	jne    401515 <read_line+0x7e>
  401501:	bf f3 26 40 00       	mov    $0x4026f3,%edi
  401506:	e8 85 f5 ff ff       	callq  400a90 <puts@plt>
  40150b:	bf 00 00 00 00       	mov    $0x0,%edi
  401510:	e8 8b f5 ff ff       	callq  400aa0 <exit@plt>
  401515:	48 63 05 28 27 20 00 	movslq 0x202728(%rip),%rax        # 603c44 <num_input_strings>
  40151c:	48 8d 04 80          	lea    (%rax,%rax,4),%rax
  401520:	48 c1 e0 04          	shl    $0x4,%rax
  401524:	48 8d b8 60 3c 60 00 	lea    0x603c60(%rax),%rdi
  40152b:	fc                   	cld    
  40152c:	48 c7 c1 ff ff ff ff 	mov    $0xffffffffffffffff,%rcx
  401533:	b8 00 00 00 00       	mov    $0x0,%eax
  401538:	f2 ae                	repnz scas %es:(%rdi),%al
  40153a:	48 f7 d1             	not    %rcx
  40153d:	8d 59 ff             	lea    -0x1(%rcx),%ebx
  401540:	83 fb 4e             	cmp    $0x4e,%ebx
  401543:	7e 50                	jle    401595 <read_line+0xfe>
  401545:	bf 1c 27 40 00       	mov    $0x40271c,%edi
  40154a:	e8 41 f5 ff ff       	callq  400a90 <puts@plt>
  40154f:	8b 05 ef 26 20 00    	mov    0x2026ef(%rip),%eax        # 603c44 <num_input_strings>
  401555:	8d 50 01             	lea    0x1(%rax),%edx
  401558:	89 15 e6 26 20 00    	mov    %edx,0x2026e6(%rip)        # 603c44 <num_input_strings>
  40155e:	48 98                	cltq   
  401560:	48 8d 04 80          	lea    (%rax,%rax,4),%rax
  401564:	48 c1 e0 04          	shl    $0x4,%rax
  401568:	c7 80 60 3c 60 00 2a 	movl   $0x742a2a2a,0x603c60(%rax)
  40156f:	2a 2a 74 
  401572:	c7 80 64 3c 60 00 72 	movl   $0x636e7572,0x603c64(%rax)
  401579:	75 6e 63 
  40157c:	c7 80 68 3c 60 00 61 	movl   $0x64657461,0x603c68(%rax)
  401583:	74 65 64 
  401586:	c7 80 6c 3c 60 00 2a 	movl   $0x2a2a2a,0x603c6c(%rax)
  40158d:	2a 2a 00 
  401590:	e8 0c fe ff ff       	callq  4013a1 <explode_bomb>
  401595:	8b 0d a9 26 20 00    	mov    0x2026a9(%rip),%ecx        # 603c44 <num_input_strings>
  40159b:	8d 53 ff             	lea    -0x1(%rbx),%edx
  40159e:	48 63 d2             	movslq %edx,%rdx
  4015a1:	48 63 c1             	movslq %ecx,%rax
  4015a4:	48 8d 04 80          	lea    (%rax,%rax,4),%rax
  4015a8:	48 c1 e0 04          	shl    $0x4,%rax
  4015ac:	48 05 60 3c 60 00    	add    $0x603c60,%rax
  4015b2:	c6 04 10 00          	movb   $0x0,(%rax,%rdx,1)
  4015b6:	83 c1 01             	add    $0x1,%ecx
  4015b9:	89 0d 85 26 20 00    	mov    %ecx,0x202685(%rip)        # 603c44 <num_input_strings>
  4015bf:	5b                   	pop    %rbx
  4015c0:	c3                   	retq   

00000000004015c1 <initialize_bomb>:
  4015c1:	55                   	push   %rbp
  4015c2:	53                   	push   %rbx
  4015c3:	48 81 ec 48 20 00 00 	sub    $0x2048,%rsp
  4015ca:	be 83 16 40 00       	mov    $0x401683,%esi
  4015cf:	bf 02 00 00 00       	mov    $0x2,%edi
  4015d4:	e8 a7 f5 ff ff       	callq  400b80 <signal@plt>
  4015d9:	48 8d bc 24 00 20 00 	lea    0x2000(%rsp),%rdi
  4015e0:	00 
  4015e1:	be 40 00 00 00       	mov    $0x40,%esi
  4015e6:	e8 85 f5 ff ff       	callq  400b70 <gethostname@plt>
  4015eb:	85 c0                	test   %eax,%eax
  4015ed:	75 1b                	jne    40160a <initialize_bomb+0x49>
  4015ef:	48 8b 3d aa 23 20 00 	mov    0x2023aa(%rip),%rdi        # 6039a0 <host_table>
  4015f6:	bb 00 00 00 00       	mov    $0x0,%ebx
  4015fb:	48 8d ac 24 00 20 00 	lea    0x2000(%rsp),%rbp
  401602:	00 
  401603:	48 85 ff             	test   %rdi,%rdi
  401606:	75 16                	jne    40161e <initialize_bomb+0x5d>
  401608:	eb 5b                	jmp    401665 <initialize_bomb+0xa4>
  40160a:	bf 90 29 40 00       	mov    $0x402990,%edi
  40160f:	e8 7c f4 ff ff       	callq  400a90 <puts@plt>
  401614:	bf 08 00 00 00       	mov    $0x8,%edi
  401619:	e8 82 f4 ff ff       	callq  400aa0 <exit@plt>
  40161e:	48 89 ee             	mov    %rbp,%rsi
  401621:	e8 8a f4 ff ff       	callq  400ab0 <strcasecmp@plt>
  401626:	85 c0                	test   %eax,%eax
  401628:	74 13                	je     40163d <initialize_bomb+0x7c>
  40162a:	48 8b 3c dd a8 39 60 	mov    0x6039a8(,%rbx,8),%rdi
  401631:	00 
  401632:	48 83 c3 01          	add    $0x1,%rbx
  401636:	48 85 ff             	test   %rdi,%rdi
  401639:	74 2a                	je     401665 <initialize_bomb+0xa4>
  40163b:	eb e1                	jmp    40161e <initialize_bomb+0x5d>
  40163d:	48 89 e7             	mov    %rsp,%rdi
  401640:	e8 9b 00 00 00       	callq  4016e0 <init_driver>
  401645:	85 c0                	test   %eax,%eax
  401647:	79 30                	jns    401679 <initialize_bomb+0xb8>
  401649:	48 89 e6             	mov    %rsp,%rsi
  40164c:	bf 37 27 40 00       	mov    $0x402737,%edi
  401651:	b8 00 00 00 00       	mov    $0x0,%eax
  401656:	e8 f5 f3 ff ff       	callq  400a50 <printf@plt>
  40165b:	bf 08 00 00 00       	mov    $0x8,%edi
  401660:	e8 3b f4 ff ff       	callq  400aa0 <exit@plt>
  401665:	bf c8 29 40 00       	mov    $0x4029c8,%edi
  40166a:	e8 21 f4 ff ff       	callq  400a90 <puts@plt>
  40166f:	bf 08 00 00 00       	mov    $0x8,%edi
  401674:	e8 27 f4 ff ff       	callq  400aa0 <exit@plt>
  401679:	48 81 c4 48 20 00 00 	add    $0x2048,%rsp
  401680:	5b                   	pop    %rbx
  401681:	5d                   	pop    %rbp
  401682:	c3                   	retq   

0000000000401683 <sig_handler>:
  401683:	48 83 ec 08          	sub    $0x8,%rsp
  401687:	bf 00 2a 40 00       	mov    $0x402a00,%edi
  40168c:	e8 ff f3 ff ff       	callq  400a90 <puts@plt>
  401691:	bf 03 00 00 00       	mov    $0x3,%edi
  401696:	e8 b5 f4 ff ff       	callq  400b50 <sleep@plt>
  40169b:	bf 51 27 40 00       	mov    $0x402751,%edi
  4016a0:	b8 00 00 00 00       	mov    $0x0,%eax
  4016a5:	e8 a6 f3 ff ff       	callq  400a50 <printf@plt>
  4016aa:	48 8b 3d 7f 25 20 00 	mov    0x20257f(%rip),%rdi        # 603c30 <stdout@@GLIBC_2.2.5>
  4016b1:	e8 4a f5 ff ff       	callq  400c00 <fflush@plt>
  4016b6:	bf 01 00 00 00       	mov    $0x1,%edi
  4016bb:	e8 90 f4 ff ff       	callq  400b50 <sleep@plt>
  4016c0:	bf 59 27 40 00       	mov    $0x402759,%edi
  4016c5:	e8 c6 f3 ff ff       	callq  400a90 <puts@plt>
  4016ca:	bf 10 00 00 00       	mov    $0x10,%edi
  4016cf:	e8 cc f3 ff ff       	callq  400aa0 <exit@plt>
  4016d4:	90                   	nop
  4016d5:	90                   	nop
  4016d6:	90                   	nop
  4016d7:	90                   	nop
  4016d8:	90                   	nop
  4016d9:	90                   	nop
  4016da:	90                   	nop
  4016db:	90                   	nop
  4016dc:	90                   	nop
  4016dd:	90                   	nop
  4016de:	90                   	nop
  4016df:	90                   	nop

00000000004016e0 <init_driver>:
  4016e0:	41 54                	push   %r12
  4016e2:	55                   	push   %rbp
  4016e3:	53                   	push   %rbx
  4016e4:	48 83 ec 10          	sub    $0x10,%rsp
  4016e8:	48 89 fd             	mov    %rdi,%rbp
  4016eb:	be 01 00 00 00       	mov    $0x1,%esi
  4016f0:	bf 0d 00 00 00       	mov    $0xd,%edi
  4016f5:	e8 86 f4 ff ff       	callq  400b80 <signal@plt>
  4016fa:	be 01 00 00 00       	mov    $0x1,%esi
  4016ff:	bf 1d 00 00 00       	mov    $0x1d,%edi
  401704:	e8 77 f4 ff ff       	callq  400b80 <signal@plt>
  401709:	be 01 00 00 00       	mov    $0x1,%esi
  40170e:	bf 1d 00 00 00       	mov    $0x1d,%edi
  401713:	e8 68 f4 ff ff       	callq  400b80 <signal@plt>
  401718:	ba 00 00 00 00       	mov    $0x0,%edx
  40171d:	be 01 00 00 00       	mov    $0x1,%esi
  401722:	bf 02 00 00 00       	mov    $0x2,%edi
  401727:	e8 64 f4 ff ff       	callq  400b90 <socket@plt>
  40172c:	41 89 c4             	mov    %eax,%r12d
  40172f:	85 c0                	test   %eax,%eax
  401731:	79 4f                	jns    401782 <init_driver+0xa2>
  401733:	c7 45 00 45 72 72 6f 	movl   $0x6f727245,0x0(%rbp)
  40173a:	c7 45 04 72 3a 20 43 	movl   $0x43203a72,0x4(%rbp)
  401741:	c7 45 08 6c 69 65 6e 	movl   $0x6e65696c,0x8(%rbp)
  401748:	c7 45 0c 74 20 75 6e 	movl   $0x6e752074,0xc(%rbp)
  40174f:	c7 45 10 61 62 6c 65 	movl   $0x656c6261,0x10(%rbp)
  401756:	c7 45 14 20 74 6f 20 	movl   $0x206f7420,0x14(%rbp)
  40175d:	c7 45 18 63 72 65 61 	movl   $0x61657263,0x18(%rbp)
  401764:	c7 45 1c 74 65 20 73 	movl   $0x73206574,0x1c(%rbp)
  40176b:	c7 45 20 6f 63 6b 65 	movl   $0x656b636f,0x20(%rbp)
  401772:	66 c7 45 24 74 00    	movw   $0x74,0x24(%rbp)
  401778:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
  40177d:	e9 27 01 00 00       	jmpq   4018a9 <init_driver+0x1c9>
  401782:	bf 58 2a 40 00       	mov    $0x402a58,%edi
  401787:	e8 f4 f2 ff ff       	callq  400a80 <gethostbyname@plt>
  40178c:	48 85 c0             	test   %rax,%rax
  40178f:	75 69                	jne    4017fa <init_driver+0x11a>
  401791:	c7 45 00 45 72 72 6f 	movl   $0x6f727245,0x0(%rbp)
  401798:	c7 45 04 72 3a 20 44 	movl   $0x44203a72,0x4(%rbp)
  40179f:	c7 45 08 4e 53 20 69 	movl   $0x6920534e,0x8(%rbp)
  4017a6:	c7 45 0c 73 20 75 6e 	movl   $0x6e752073,0xc(%rbp)
  4017ad:	c7 45 10 61 62 6c 65 	movl   $0x656c6261,0x10(%rbp)
  4017b4:	c7 45 14 20 74 6f 20 	movl   $0x206f7420,0x14(%rbp)
  4017bb:	c7 45 18 72 65 73 6f 	movl   $0x6f736572,0x18(%rbp)
  4017c2:	c7 45 1c 6c 76 65 20 	movl   $0x2065766c,0x1c(%rbp)
  4017c9:	c7 45 20 73 65 72 76 	movl   $0x76726573,0x20(%rbp)
  4017d0:	c7 45 24 65 72 20 61 	movl   $0x61207265,0x24(%rbp)
  4017d7:	c7 45 28 64 64 72 65 	movl   $0x65726464,0x28(%rbp)
  4017de:	66 c7 45 2c 73 73    	movw   $0x7373,0x2c(%rbp)
  4017e4:	c6 45 2e 00          	movb   $0x0,0x2e(%rbp)
  4017e8:	44 89 e7             	mov    %r12d,%edi
  4017eb:	e8 80 f2 ff ff       	callq  400a70 <close@plt>
  4017f0:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
  4017f5:	e9 af 00 00 00       	jmpq   4018a9 <init_driver+0x1c9>
  4017fa:	48 c7 04 24 00 00 00 	movq   $0x0,(%rsp)
  401801:	00 
  401802:	48 c7 44 24 08 00 00 	movq   $0x0,0x8(%rsp)
  401809:	00 00 
  40180b:	66 c7 04 24 02 00    	movw   $0x2,(%rsp)
  401811:	48 8d 74 24 04       	lea    0x4(%rsp),%rsi
  401816:	48 63 50 14          	movslq 0x14(%rax),%rdx
  40181a:	48 8b 40 18          	mov    0x18(%rax),%rax
  40181e:	48 8b 38             	mov    (%rax),%rdi
  401821:	e8 da f2 ff ff       	callq  400b00 <bcopy@plt>
  401826:	66 c7 44 24 02 00 50 	movw   $0x5000,0x2(%rsp)
  40182d:	ba 10 00 00 00       	mov    $0x10,%edx
  401832:	48 89 e6             	mov    %rsp,%rsi
  401835:	44 89 e7             	mov    %r12d,%edi
  401838:	e8 23 f3 ff ff       	callq  400b60 <connect@plt>
  40183d:	85 c0                	test   %eax,%eax
  40183f:	79 51                	jns    401892 <init_driver+0x1b2>
  401841:	c7 45 00 45 72 72 6f 	movl   $0x6f727245,0x0(%rbp)
  401848:	c7 45 04 72 3a 20 55 	movl   $0x55203a72,0x4(%rbp)
  40184f:	c7 45 08 6e 61 62 6c 	movl   $0x6c62616e,0x8(%rbp)
  401856:	c7 45 0c 65 20 74 6f 	movl   $0x6f742065,0xc(%rbp)
  40185d:	c7 45 10 20 63 6f 6e 	movl   $0x6e6f6320,0x10(%rbp)
  401864:	c7 45 14 6e 65 63 74 	movl   $0x7463656e,0x14(%rbp)
  40186b:	c7 45 18 20 74 6f 20 	movl   $0x206f7420,0x18(%rbp)
  401872:	c7 45 1c 73 65 72 76 	movl   $0x76726573,0x1c(%rbp)
  401879:	66 c7 45 20 65 72    	movw   $0x7265,0x20(%rbp)
  40187f:	c6 45 22 00          	movb   $0x0,0x22(%rbp)
  401883:	44 89 e7             	mov    %r12d,%edi
  401886:	e8 e5 f1 ff ff       	callq  400a70 <close@plt>
  40188b:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
  401890:	eb 17                	jmp    4018a9 <init_driver+0x1c9>
  401892:	44 89 e7             	mov    %r12d,%edi
  401895:	e8 d6 f1 ff ff       	callq  400a70 <close@plt>
  40189a:	66 c7 45 00 4f 4b    	movw   $0x4b4f,0x0(%rbp)
  4018a0:	c6 45 02 00          	movb   $0x0,0x2(%rbp)
  4018a4:	b8 00 00 00 00       	mov    $0x0,%eax
  4018a9:	48 83 c4 10          	add    $0x10,%rsp
  4018ad:	5b                   	pop    %rbx
  4018ae:	5d                   	pop    %rbp
  4018af:	41 5c                	pop    %r12
  4018b1:	c3                   	retq   

00000000004018b2 <init_timeout>:
  4018b2:	53                   	push   %rbx
  4018b3:	89 fb                	mov    %edi,%ebx
  4018b5:	85 ff                	test   %edi,%edi
  4018b7:	74 1e                	je     4018d7 <init_timeout+0x25>
  4018b9:	be 48 23 40 00       	mov    $0x402348,%esi
  4018be:	bf 0e 00 00 00       	mov    $0xe,%edi
  4018c3:	e8 b8 f2 ff ff       	callq  400b80 <signal@plt>
  4018c8:	85 db                	test   %ebx,%ebx
  4018ca:	bf 00 00 00 00       	mov    $0x0,%edi
  4018cf:	0f 49 fb             	cmovns %ebx,%edi
  4018d2:	e8 d9 f2 ff ff       	callq  400bb0 <alarm@plt>
  4018d7:	5b                   	pop    %rbx
  4018d8:	c3                   	retq   

00000000004018d9 <rio_readlineb>:
  4018d9:	41 57                	push   %r15
  4018db:	41 56                	push   %r14
  4018dd:	41 55                	push   %r13
  4018df:	41 54                	push   %r12
  4018e1:	55                   	push   %rbp
  4018e2:	53                   	push   %rbx
  4018e3:	48 83 ec 18          	sub    $0x18,%rsp
  4018e7:	48 89 fb             	mov    %rdi,%rbx
  4018ea:	49 89 d7             	mov    %rdx,%r15
  4018ed:	49 89 f5             	mov    %rsi,%r13
  4018f0:	49 89 f6             	mov    %rsi,%r14
  4018f3:	41 bc 01 00 00 00    	mov    $0x1,%r12d
  4018f9:	48 83 fa 01          	cmp    $0x1,%rdx
  4018fd:	77 3b                	ja     40193a <rio_readlineb+0x61>
  4018ff:	e9 7e 00 00 00       	jmpq   401982 <rio_readlineb+0xa9>
  401904:	48 8d 6b 10          	lea    0x10(%rbx),%rbp
  401908:	ba 00 20 00 00       	mov    $0x2000,%edx
  40190d:	48 89 ee             	mov    %rbp,%rsi
  401910:	8b 3b                	mov    (%rbx),%edi
  401912:	e8 a9 f1 ff ff       	callq  400ac0 <read@plt>
  401917:	89 43 04             	mov    %eax,0x4(%rbx)
  40191a:	85 c0                	test   %eax,%eax
  40191c:	79 14                	jns    401932 <rio_readlineb+0x59>
  40191e:	e8 9d f2 ff ff       	callq  400bc0 <__errno_location@plt>
  401923:	83 38 04             	cmpl   $0x4,(%rax)
  401926:	74 12                	je     40193a <rio_readlineb+0x61>
  401928:	48 c7 c0 ff ff ff ff 	mov    $0xffffffffffffffff,%rax
  40192f:	90                   	nop
  401930:	eb 67                	jmp    401999 <rio_readlineb+0xc0>
  401932:	85 c0                	test   %eax,%eax
  401934:	74 5e                	je     401994 <rio_readlineb+0xbb>
  401936:	48 89 6b 08          	mov    %rbp,0x8(%rbx)
  40193a:	83 7b 04 00          	cmpl   $0x0,0x4(%rbx)
  40193e:	66 90                	xchg   %ax,%ax
  401940:	7e c2                	jle    401904 <rio_readlineb+0x2b>
  401942:	48 8b 43 08          	mov    0x8(%rbx),%rax
  401946:	0f b6 00             	movzbl (%rax),%eax
  401949:	88 44 24 17          	mov    %al,0x17(%rsp)
  40194d:	48 83 43 08 01       	addq   $0x1,0x8(%rbx)
  401952:	83 6b 04 01          	subl   $0x1,0x4(%rbx)
  401956:	43 88 44 2c ff       	mov    %al,-0x1(%r12,%r13,1)
  40195b:	49 83 c6 01          	add    $0x1,%r14
  40195f:	80 7c 24 17 0a       	cmpb   $0xa,0x17(%rsp)
  401964:	75 0f                	jne    401975 <rio_readlineb+0x9c>
  401966:	eb 23                	jmp    40198b <rio_readlineb+0xb2>
  401968:	b8 00 00 00 00       	mov    $0x0,%eax
  40196d:	49 83 fc 01          	cmp    $0x1,%r12
  401971:	74 31                	je     4019a4 <rio_readlineb+0xcb>
  401973:	eb 16                	jmp    40198b <rio_readlineb+0xb2>
  401975:	49 83 c4 01          	add    $0x1,%r12
  401979:	4d 39 fc             	cmp    %r15,%r12
  40197c:	75 bc                	jne    40193a <rio_readlineb+0x61>
  40197e:	66 90                	xchg   %ax,%ax
  401980:	eb 09                	jmp    40198b <rio_readlineb+0xb2>
  401982:	49 89 f6             	mov    %rsi,%r14
  401985:	41 bc 01 00 00 00    	mov    $0x1,%r12d
  40198b:	41 c6 06 00          	movb   $0x0,(%r14)
  40198f:	4c 89 e0             	mov    %r12,%rax
  401992:	eb 10                	jmp    4019a4 <rio_readlineb+0xcb>
  401994:	b8 00 00 00 00       	mov    $0x0,%eax
  401999:	85 c0                	test   %eax,%eax
  40199b:	74 cb                	je     401968 <rio_readlineb+0x8f>
  40199d:	48 c7 c0 ff ff ff ff 	mov    $0xffffffffffffffff,%rax
  4019a4:	48 83 c4 18          	add    $0x18,%rsp
  4019a8:	5b                   	pop    %rbx
  4019a9:	5d                   	pop    %rbp
  4019aa:	41 5c                	pop    %r12
  4019ac:	41 5d                	pop    %r13
  4019ae:	41 5e                	pop    %r14
  4019b0:	41 5f                	pop    %r15
  4019b2:	c3                   	retq   

00000000004019b3 <submitr>:
  4019b3:	41 57                	push   %r15
  4019b5:	41 56                	push   %r14
  4019b7:	41 55                	push   %r13
  4019b9:	41 54                	push   %r12
  4019bb:	55                   	push   %rbp
  4019bc:	53                   	push   %rbx
  4019bd:	48 81 ec 78 a0 00 00 	sub    $0xa078,%rsp
  4019c4:	48 89 7c 24 28       	mov    %rdi,0x28(%rsp)
  4019c9:	89 f5                	mov    %esi,%ebp
  4019cb:	48 89 54 24 20       	mov    %rdx,0x20(%rsp)
  4019d0:	48 89 4c 24 18       	mov    %rcx,0x18(%rsp)
  4019d5:	4c 89 44 24 10       	mov    %r8,0x10(%rsp)
  4019da:	4d 89 cf             	mov    %r9,%r15
  4019dd:	4c 8b b4 24 b0 a0 00 	mov    0xa0b0(%rsp),%r14
  4019e4:	00 
  4019e5:	c7 84 24 4c 20 00 00 	movl   $0x0,0x204c(%rsp)
  4019ec:	00 00 00 00 
  4019f0:	ba 00 00 00 00       	mov    $0x0,%edx
  4019f5:	be 01 00 00 00       	mov    $0x1,%esi
  4019fa:	bf 02 00 00 00       	mov    $0x2,%edi
  4019ff:	e8 8c f1 ff ff       	callq  400b90 <socket@plt>
  401a04:	41 89 c5             	mov    %eax,%r13d
  401a07:	85 c0                	test   %eax,%eax
  401a09:	79 58                	jns    401a63 <submitr+0xb0>
  401a0b:	41 c7 06 45 72 72 6f 	movl   $0x6f727245,(%r14)
  401a12:	41 c7 46 04 72 3a 20 	movl   $0x43203a72,0x4(%r14)
  401a19:	43 
  401a1a:	41 c7 46 08 6c 69 65 	movl   $0x6e65696c,0x8(%r14)
  401a21:	6e 
  401a22:	41 c7 46 0c 74 20 75 	movl   $0x6e752074,0xc(%r14)
  401a29:	6e 
  401a2a:	41 c7 46 10 61 62 6c 	movl   $0x656c6261,0x10(%r14)
  401a31:	65 
  401a32:	41 c7 46 14 20 74 6f 	movl   $0x206f7420,0x14(%r14)
  401a39:	20 
  401a3a:	41 c7 46 18 63 72 65 	movl   $0x61657263,0x18(%r14)
  401a41:	61 
  401a42:	41 c7 46 1c 74 65 20 	movl   $0x73206574,0x1c(%r14)
  401a49:	73 
  401a4a:	41 c7 46 20 6f 63 6b 	movl   $0x656b636f,0x20(%r14)
  401a51:	65 
  401a52:	66 41 c7 46 24 74 00 	movw   $0x74,0x24(%r14)
  401a59:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
  401a5e:	e9 5b 08 00 00       	jmpq   4022be <submitr+0x90b>
  401a63:	48 8b 7c 24 28       	mov    0x28(%rsp),%rdi
  401a68:	e8 13 f0 ff ff       	callq  400a80 <gethostbyname@plt>
  401a6d:	48 85 c0             	test   %rax,%rax
  401a70:	0f 85 85 00 00 00    	jne    401afb <submitr+0x148>
  401a76:	41 c7 06 45 72 72 6f 	movl   $0x6f727245,(%r14)
  401a7d:	41 c7 46 04 72 3a 20 	movl   $0x44203a72,0x4(%r14)
  401a84:	44 
  401a85:	41 c7 46 08 4e 53 20 	movl   $0x6920534e,0x8(%r14)
  401a8c:	69 
  401a8d:	41 c7 46 0c 73 20 75 	movl   $0x6e752073,0xc(%r14)
  401a94:	6e 
  401a95:	41 c7 46 10 61 62 6c 	movl   $0x656c6261,0x10(%r14)
  401a9c:	65 
  401a9d:	41 c7 46 14 20 74 6f 	movl   $0x206f7420,0x14(%r14)
  401aa4:	20 
  401aa5:	41 c7 46 18 72 65 73 	movl   $0x6f736572,0x18(%r14)
  401aac:	6f 
  401aad:	41 c7 46 1c 6c 76 65 	movl   $0x2065766c,0x1c(%r14)
  401ab4:	20 
  401ab5:	41 c7 46 20 41 75 74 	movl   $0x6f747541,0x20(%r14)
  401abc:	6f 
  401abd:	41 c7 46 24 6c 61 62 	movl   $0x2062616c,0x24(%r14)
  401ac4:	20 
  401ac5:	41 c7 46 28 73 65 72 	movl   $0x76726573,0x28(%r14)
  401acc:	76 
  401acd:	41 c7 46 2c 65 72 20 	movl   $0x61207265,0x2c(%r14)
  401ad4:	61 
  401ad5:	41 c7 46 30 64 64 72 	movl   $0x65726464,0x30(%r14)
  401adc:	65 
  401add:	66 41 c7 46 34 73 73 	movw   $0x7373,0x34(%r14)
  401ae4:	41 c6 46 36 00       	movb   $0x0,0x36(%r14)
  401ae9:	44 89 ef             	mov    %r13d,%edi
  401aec:	e8 7f ef ff ff       	callq  400a70 <close@plt>
  401af1:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
  401af6:	e9 c3 07 00 00       	jmpq   4022be <submitr+0x90b>
  401afb:	48 8d 9c 24 60 a0 00 	lea    0xa060(%rsp),%rbx
  401b02:	00 
  401b03:	48 c7 84 24 60 a0 00 	movq   $0x0,0xa060(%rsp)
  401b0a:	00 00 00 00 00 
  401b0f:	48 c7 84 24 68 a0 00 	movq   $0x0,0xa068(%rsp)
  401b16:	00 00 00 00 00 
  401b1b:	66 c7 84 24 60 a0 00 	movw   $0x2,0xa060(%rsp)
  401b22:	00 02 00 
  401b25:	48 8d 73 04          	lea    0x4(%rbx),%rsi
  401b29:	48 63 50 14          	movslq 0x14(%rax),%rdx
  401b2d:	48 8b 40 18          	mov    0x18(%rax),%rax
  401b31:	48 8b 38             	mov    (%rax),%rdi
  401b34:	e8 c7 ef ff ff       	callq  400b00 <bcopy@plt>
  401b39:	89 e8                	mov    %ebp,%eax
  401b3b:	66 c1 c8 08          	ror    $0x8,%ax
  401b3f:	66 89 84 24 62 a0 00 	mov    %ax,0xa062(%rsp)
  401b46:	00 
  401b47:	ba 10 00 00 00       	mov    $0x10,%edx
  401b4c:	48 89 de             	mov    %rbx,%rsi
  401b4f:	44 89 ef             	mov    %r13d,%edi
  401b52:	e8 09 f0 ff ff       	callq  400b60 <connect@plt>
  401b57:	85 c0                	test   %eax,%eax
  401b59:	79 75                	jns    401bd0 <submitr+0x21d>
  401b5b:	41 c7 06 45 72 72 6f 	movl   $0x6f727245,(%r14)
  401b62:	41 c7 46 04 72 3a 20 	movl   $0x55203a72,0x4(%r14)
  401b69:	55 
  401b6a:	41 c7 46 08 6e 61 62 	movl   $0x6c62616e,0x8(%r14)
  401b71:	6c 
  401b72:	41 c7 46 0c 65 20 74 	movl   $0x6f742065,0xc(%r14)
  401b79:	6f 
  401b7a:	41 c7 46 10 20 63 6f 	movl   $0x6e6f6320,0x10(%r14)
  401b81:	6e 
  401b82:	41 c7 46 14 6e 65 63 	movl   $0x7463656e,0x14(%r14)
  401b89:	74 
  401b8a:	41 c7 46 18 20 74 6f 	movl   $0x206f7420,0x18(%r14)
  401b91:	20 
  401b92:	41 c7 46 1c 74 68 65 	movl   $0x20656874,0x1c(%r14)
  401b99:	20 
  401b9a:	41 c7 46 20 41 75 74 	movl   $0x6f747541,0x20(%r14)
  401ba1:	6f 
  401ba2:	41 c7 46 24 6c 61 62 	movl   $0x2062616c,0x24(%r14)
  401ba9:	20 
  401baa:	41 c7 46 28 73 65 72 	movl   $0x76726573,0x28(%r14)
  401bb1:	76 
  401bb2:	66 41 c7 46 2c 65 72 	movw   $0x7265,0x2c(%r14)
  401bb9:	41 c6 46 2e 00       	movb   $0x0,0x2e(%r14)
  401bbe:	44 89 ef             	mov    %r13d,%edi
  401bc1:	e8 aa ee ff ff       	callq  400a70 <close@plt>
  401bc6:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
  401bcb:	e9 ee 06 00 00       	jmpq   4022be <submitr+0x90b>
  401bd0:	48 c7 c3 ff ff ff ff 	mov    $0xffffffffffffffff,%rbx
  401bd7:	4c 89 ff             	mov    %r15,%rdi
  401bda:	41 b8 00 00 00 00    	mov    $0x0,%r8d
  401be0:	fc                   	cld    
  401be1:	48 89 d9             	mov    %rbx,%rcx
  401be4:	44 89 c0             	mov    %r8d,%eax
  401be7:	f2 ae                	repnz scas %es:(%rdi),%al
  401be9:	48 89 ce             	mov    %rcx,%rsi
  401bec:	48 f7 d6             	not    %rsi
  401bef:	48 8b 7c 24 20       	mov    0x20(%rsp),%rdi
  401bf4:	48 89 d9             	mov    %rbx,%rcx
  401bf7:	f2 ae                	repnz scas %es:(%rdi),%al
  401bf9:	48 89 ca             	mov    %rcx,%rdx
  401bfc:	48 f7 d2             	not    %rdx
  401bff:	48 8b 7c 24 18       	mov    0x18(%rsp),%rdi
  401c04:	48 89 d9             	mov    %rbx,%rcx
  401c07:	f2 ae                	repnz scas %es:(%rdi),%al
  401c09:	49 89 c9             	mov    %rcx,%r9
  401c0c:	49 f7 d1             	not    %r9
  401c0f:	48 8b 7c 24 10       	mov    0x10(%rsp),%rdi
  401c14:	48 89 d9             	mov    %rbx,%rcx
  401c17:	f2 ae                	repnz scas %es:(%rdi),%al
  401c19:	48 f7 d1             	not    %rcx
  401c1c:	49 8d 44 11 7e       	lea    0x7e(%r9,%rdx,1),%rax
  401c21:	48 8d 4c 01 ff       	lea    -0x1(%rcx,%rax,1),%rcx
  401c26:	48 8d 44 76 fd       	lea    -0x3(%rsi,%rsi,2),%rax
  401c2b:	48 01 c1             	add    %rax,%rcx
  401c2e:	48 81 f9 00 20 00 00 	cmp    $0x2000,%rcx
  401c35:	76 7e                	jbe    401cb5 <submitr+0x302>
  401c37:	41 c7 06 45 72 72 6f 	movl   $0x6f727245,(%r14)
  401c3e:	41 c7 46 04 72 3a 20 	movl   $0x52203a72,0x4(%r14)
  401c45:	52 
  401c46:	41 c7 46 08 65 73 75 	movl   $0x6c757365,0x8(%r14)
  401c4d:	6c 
  401c4e:	41 c7 46 0c 74 20 73 	movl   $0x74732074,0xc(%r14)
  401c55:	74 
  401c56:	41 c7 46 10 72 69 6e 	movl   $0x676e6972,0x10(%r14)
  401c5d:	67 
  401c5e:	41 c7 46 14 20 74 6f 	movl   $0x6f6f7420,0x14(%r14)
  401c65:	6f 
  401c66:	41 c7 46 18 20 6c 61 	movl   $0x72616c20,0x18(%r14)
  401c6d:	72 
  401c6e:	41 c7 46 1c 67 65 2e 	movl   $0x202e6567,0x1c(%r14)
  401c75:	20 
  401c76:	41 c7 46 20 49 6e 63 	movl   $0x72636e49,0x20(%r14)
  401c7d:	72 
  401c7e:	41 c7 46 24 65 61 73 	movl   $0x65736165,0x24(%r14)
  401c85:	65 
  401c86:	41 c7 46 28 20 53 55 	movl   $0x42555320,0x28(%r14)
  401c8d:	42 
  401c8e:	41 c7 46 2c 4d 49 54 	movl   $0x5254494d,0x2c(%r14)
  401c95:	52 
  401c96:	41 c7 46 30 5f 4d 41 	movl   $0x58414d5f,0x30(%r14)
  401c9d:	58 
  401c9e:	41 c7 46 34 42 55 46 	movl   $0x465542,0x34(%r14)
  401ca5:	00 
  401ca6:	44 89 ef             	mov    %r13d,%edi
  401ca9:	e8 c2 ed ff ff       	callq  400a70 <close@plt>
  401cae:	89 d8                	mov    %ebx,%eax
  401cb0:	e9 09 06 00 00       	jmpq   4022be <submitr+0x90b>
  401cb5:	4c 8d a4 24 50 40 00 	lea    0x4050(%rsp),%r12
  401cbc:	00 
  401cbd:	ba 00 20 00 00       	mov    $0x2000,%edx
  401cc2:	be 00 00 00 00       	mov    $0x0,%esi
  401cc7:	4c 89 e7             	mov    %r12,%rdi
  401cca:	e8 91 ed ff ff       	callq  400a60 <memset@plt>
  401ccf:	4c 89 fd             	mov    %r15,%rbp
  401cd2:	4c 89 ff             	mov    %r15,%rdi
  401cd5:	fc                   	cld    
  401cd6:	48 c7 c1 ff ff ff ff 	mov    $0xffffffffffffffff,%rcx
  401cdd:	b8 00 00 00 00       	mov    $0x0,%eax
  401ce2:	f2 ae                	repnz scas %es:(%rdi),%al
  401ce4:	48 f7 d1             	not    %rcx
  401ce7:	8d 59 fe             	lea    -0x2(%rcx),%ebx
  401cea:	83 fb ff             	cmp    $0xffffffffffffffff,%ebx
  401ced:	0f 84 e6 04 00 00    	je     4021d9 <submitr+0x826>
  401cf3:	4c 8d 7c 24 30       	lea    0x30(%rsp),%r15
  401cf8:	0f b6 55 00          	movzbl 0x0(%rbp),%edx
  401cfc:	80 fa 2a             	cmp    $0x2a,%dl
  401cff:	74 26                	je     401d27 <submitr+0x374>
  401d01:	80 fa 2d             	cmp    $0x2d,%dl
  401d04:	74 21                	je     401d27 <submitr+0x374>
  401d06:	80 fa 2e             	cmp    $0x2e,%dl
  401d09:	74 1c                	je     401d27 <submitr+0x374>
  401d0b:	80 fa 5f             	cmp    $0x5f,%dl
  401d0e:	66 90                	xchg   %ax,%ax
  401d10:	74 15                	je     401d27 <submitr+0x374>
  401d12:	8d 42 d0             	lea    -0x30(%rdx),%eax
  401d15:	3c 09                	cmp    $0x9,%al
  401d17:	76 0e                	jbe    401d27 <submitr+0x374>
  401d19:	8d 42 bf             	lea    -0x41(%rdx),%eax
  401d1c:	3c 19                	cmp    $0x19,%al
  401d1e:	76 07                	jbe    401d27 <submitr+0x374>
  401d20:	8d 42 9f             	lea    -0x61(%rdx),%eax
  401d23:	3c 19                	cmp    $0x19,%al
  401d25:	77 0a                	ja     401d31 <submitr+0x37e>
  401d27:	41 88 14 24          	mov    %dl,(%r12)
  401d2b:	49 83 c4 01          	add    $0x1,%r12
  401d2f:	eb 52                	jmp    401d83 <submitr+0x3d0>
  401d31:	80 fa 20             	cmp    $0x20,%dl
  401d34:	75 0b                	jne    401d41 <submitr+0x38e>
  401d36:	41 c6 04 24 2b       	movb   $0x2b,(%r12)
  401d3b:	49 83 c4 01          	add    $0x1,%r12
  401d3f:	eb 42                	jmp    401d83 <submitr+0x3d0>
  401d41:	8d 42 e0             	lea    -0x20(%rdx),%eax
  401d44:	3c 5f                	cmp    $0x5f,%al
  401d46:	76 05                	jbe    401d4d <submitr+0x39a>
  401d48:	80 fa 09             	cmp    $0x9,%dl
  401d4b:	75 4b                	jne    401d98 <submitr+0x3e5>
  401d4d:	0f b6 d2             	movzbl %dl,%edx
  401d50:	be 30 2b 40 00       	mov    $0x402b30,%esi
  401d55:	4c 89 ff             	mov    %r15,%rdi
  401d58:	b8 00 00 00 00       	mov    $0x0,%eax
  401d5d:	e8 be ed ff ff       	callq  400b20 <sprintf@plt>
  401d62:	0f b6 44 24 30       	movzbl 0x30(%rsp),%eax
  401d67:	41 88 04 24          	mov    %al,(%r12)
  401d6b:	0f b6 44 24 31       	movzbl 0x31(%rsp),%eax
  401d70:	41 88 44 24 01       	mov    %al,0x1(%r12)
  401d75:	0f b6 44 24 32       	movzbl 0x32(%rsp),%eax
  401d7a:	41 88 44 24 02       	mov    %al,0x2(%r12)
  401d7f:	49 83 c4 03          	add    $0x3,%r12
  401d83:	83 eb 01             	sub    $0x1,%ebx
  401d86:	83 fb ff             	cmp    $0xffffffffffffffff,%ebx
  401d89:	0f 84 4a 04 00 00    	je     4021d9 <submitr+0x826>
  401d8f:	48 83 c5 01          	add    $0x1,%rbp
  401d93:	e9 60 ff ff ff       	jmpq   401cf8 <submitr+0x345>
  401d98:	41 c7 06 45 72 72 6f 	movl   $0x6f727245,(%r14)
  401d9f:	41 c7 46 04 72 3a 20 	movl   $0x52203a72,0x4(%r14)
  401da6:	52 
  401da7:	41 c7 46 08 65 73 75 	movl   $0x6c757365,0x8(%r14)
  401dae:	6c 
  401daf:	41 c7 46 0c 74 20 73 	movl   $0x74732074,0xc(%r14)
  401db6:	74 
  401db7:	41 c7 46 10 72 69 6e 	movl   $0x676e6972,0x10(%r14)
  401dbe:	67 
  401dbf:	41 c7 46 14 20 63 6f 	movl   $0x6e6f6320,0x14(%r14)
  401dc6:	6e 
  401dc7:	41 c7 46 18 74 61 69 	movl   $0x6e696174,0x18(%r14)
  401dce:	6e 
  401dcf:	41 c7 46 1c 73 20 61 	movl   $0x6e612073,0x1c(%r14)
  401dd6:	6e 
  401dd7:	41 c7 46 20 20 69 6c 	movl   $0x6c6c6920,0x20(%r14)
  401dde:	6c 
  401ddf:	41 c7 46 24 65 67 61 	movl   $0x6c616765,0x24(%r14)
  401de6:	6c 
  401de7:	41 c7 46 28 20 6f 72 	movl   $0x20726f20,0x28(%r14)
  401dee:	20 
  401def:	41 c7 46 2c 75 6e 70 	movl   $0x72706e75,0x2c(%r14)
  401df6:	72 
  401df7:	41 c7 46 30 69 6e 74 	movl   $0x61746e69,0x30(%r14)
  401dfe:	61 
  401dff:	41 c7 46 34 62 6c 65 	movl   $0x20656c62,0x34(%r14)
  401e06:	20 
  401e07:	41 c7 46 38 63 68 61 	movl   $0x72616863,0x38(%r14)
  401e0e:	72 
  401e0f:	41 c7 46 3c 61 63 74 	movl   $0x65746361,0x3c(%r14)
  401e16:	65 
  401e17:	66 41 c7 46 40 72 2e 	movw   $0x2e72,0x40(%r14)
  401e1e:	41 c6 46 42 00       	movb   $0x0,0x42(%r14)
  401e23:	44 89 ef             	mov    %r13d,%edi
  401e26:	e8 45 ec ff ff       	callq  400a70 <close@plt>
  401e2b:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
  401e30:	e9 89 04 00 00       	jmpq   4022be <submitr+0x90b>
  401e35:	48 01 c5             	add    %rax,%rbp
  401e38:	48 89 da             	mov    %rbx,%rdx
  401e3b:	48 89 ee             	mov    %rbp,%rsi
  401e3e:	44 89 ef             	mov    %r13d,%edi
  401e41:	e8 aa ed ff ff       	callq  400bf0 <write@plt>
  401e46:	48 85 c0             	test   %rax,%rax
  401e49:	7f 0f                	jg     401e5a <submitr+0x4a7>
  401e4b:	e8 70 ed ff ff       	callq  400bc0 <__errno_location@plt>
  401e50:	83 38 04             	cmpl   $0x4,(%rax)
  401e53:	75 0f                	jne    401e64 <submitr+0x4b1>
  401e55:	b8 00 00 00 00       	mov    $0x0,%eax
  401e5a:	48 29 c3             	sub    %rax,%rbx
  401e5d:	75 d6                	jne    401e35 <submitr+0x482>
  401e5f:	4d 85 e4             	test   %r12,%r12
  401e62:	79 79                	jns    401edd <submitr+0x52a>
  401e64:	41 c7 06 45 72 72 6f 	movl   $0x6f727245,(%r14)
  401e6b:	41 c7 46 04 72 3a 20 	movl   $0x43203a72,0x4(%r14)
  401e72:	43 
  401e73:	41 c7 46 08 6c 69 65 	movl   $0x6e65696c,0x8(%r14)
  401e7a:	6e 
  401e7b:	41 c7 46 0c 74 20 75 	movl   $0x6e752074,0xc(%r14)
  401e82:	6e 
  401e83:	41 c7 46 10 61 62 6c 	movl   $0x656c6261,0x10(%r14)
  401e8a:	65 
  401e8b:	41 c7 46 14 20 74 6f 	movl   $0x206f7420,0x14(%r14)
  401e92:	20 
  401e93:	41 c7 46 18 77 72 69 	movl   $0x74697277,0x18(%r14)
  401e9a:	74 
  401e9b:	41 c7 46 1c 65 20 74 	movl   $0x6f742065,0x1c(%r14)
  401ea2:	6f 
  401ea3:	41 c7 46 20 20 74 68 	movl   $0x65687420,0x20(%r14)
  401eaa:	65 
  401eab:	41 c7 46 24 20 41 75 	movl   $0x74754120,0x24(%r14)
  401eb2:	74 
  401eb3:	41 c7 46 28 6f 6c 61 	movl   $0x62616c6f,0x28(%r14)
  401eba:	62 
  401ebb:	41 c7 46 2c 20 73 65 	movl   $0x72657320,0x2c(%r14)
  401ec2:	72 
  401ec3:	41 c7 46 30 76 65 72 	movl   $0x726576,0x30(%r14)
  401eca:	00 
  401ecb:	44 89 ef             	mov    %r13d,%edi
  401ece:	e8 9d eb ff ff       	callq  400a70 <close@plt>
  401ed3:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
  401ed8:	e9 e1 03 00 00       	jmpq   4022be <submitr+0x90b>
  401edd:	44 89 ac 24 50 80 00 	mov    %r13d,0x8050(%rsp)
  401ee4:	00 
  401ee5:	c7 84 24 54 80 00 00 	movl   $0x0,0x8054(%rsp)
  401eec:	00 00 00 00 
  401ef0:	48 8d bc 24 50 80 00 	lea    0x8050(%rsp),%rdi
  401ef7:	00 
  401ef8:	48 8d 47 10          	lea    0x10(%rdi),%rax
  401efc:	48 89 84 24 58 80 00 	mov    %rax,0x8058(%rsp)
  401f03:	00 
  401f04:	48 8d b4 24 50 60 00 	lea    0x6050(%rsp),%rsi
  401f0b:	00 
  401f0c:	ba 00 20 00 00       	mov    $0x2000,%edx
  401f11:	e8 c3 f9 ff ff       	callq  4018d9 <rio_readlineb>
  401f16:	48 85 c0             	test   %rax,%rax
  401f19:	0f 8f 90 00 00 00    	jg     401faf <submitr+0x5fc>
  401f1f:	41 c7 06 45 72 72 6f 	movl   $0x6f727245,(%r14)
  401f26:	41 c7 46 04 72 3a 20 	movl   $0x43203a72,0x4(%r14)
  401f2d:	43 
  401f2e:	41 c7 46 08 6c 69 65 	movl   $0x6e65696c,0x8(%r14)
  401f35:	6e 
  401f36:	41 c7 46 0c 74 20 75 	movl   $0x6e752074,0xc(%r14)
  401f3d:	6e 
  401f3e:	41 c7 46 10 61 62 6c 	movl   $0x656c6261,0x10(%r14)
  401f45:	65 
  401f46:	41 c7 46 14 20 74 6f 	movl   $0x206f7420,0x14(%r14)
  401f4d:	20 
  401f4e:	41 c7 46 18 72 65 61 	movl   $0x64616572,0x18(%r14)
  401f55:	64 
  401f56:	41 c7 46 1c 20 66 69 	movl   $0x72696620,0x1c(%r14)
  401f5d:	72 
  401f5e:	41 c7 46 20 73 74 20 	movl   $0x68207473,0x20(%r14)
  401f65:	68 
  401f66:	41 c7 46 24 65 61 64 	movl   $0x65646165,0x24(%r14)
  401f6d:	65 
  401f6e:	41 c7 46 28 72 20 66 	movl   $0x72662072,0x28(%r14)
  401f75:	72 
  401f76:	41 c7 46 2c 6f 6d 20 	movl   $0x41206d6f,0x2c(%r14)
  401f7d:	41 
  401f7e:	41 c7 46 30 75 74 6f 	movl   $0x6c6f7475,0x30(%r14)
  401f85:	6c 
  401f86:	41 c7 46 34 61 62 20 	movl   $0x73206261,0x34(%r14)
  401f8d:	73 
  401f8e:	41 c7 46 38 65 72 76 	movl   $0x65767265,0x38(%r14)
  401f95:	65 
  401f96:	66 41 c7 46 3c 72 00 	movw   $0x72,0x3c(%r14)
  401f9d:	44 89 ef             	mov    %r13d,%edi
  401fa0:	e8 cb ea ff ff       	callq  400a70 <close@plt>
  401fa5:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
  401faa:	e9 0f 03 00 00       	jmpq   4022be <submitr+0x90b>
  401faf:	48 8d 5c 24 40       	lea    0x40(%rsp),%rbx
  401fb4:	48 8d 8c 24 4c 20 00 	lea    0x204c(%rsp),%rcx
  401fbb:	00 
  401fbc:	48 8d 94 24 50 20 00 	lea    0x2050(%rsp),%rdx
  401fc3:	00 
  401fc4:	48 8d bc 24 50 60 00 	lea    0x6050(%rsp),%rdi
  401fcb:	00 
  401fcc:	49 89 d8             	mov    %rbx,%r8
  401fcf:	be 37 2b 40 00       	mov    $0x402b37,%esi
  401fd4:	b8 00 00 00 00       	mov    $0x0,%eax
  401fd9:	e8 62 eb ff ff       	callq  400b40 <sscanf@plt>
  401fde:	8b 94 24 4c 20 00 00 	mov    0x204c(%rsp),%edx
  401fe5:	81 fa c8 00 00 00    	cmp    $0xc8,%edx
  401feb:	74 4a                	je     402037 <submitr+0x684>
  401fed:	48 89 d9             	mov    %rbx,%rcx
  401ff0:	be 78 2a 40 00       	mov    $0x402a78,%esi
  401ff5:	4c 89 f7             	mov    %r14,%rdi
  401ff8:	b8 00 00 00 00       	mov    $0x0,%eax
  401ffd:	e8 1e eb ff ff       	callq  400b20 <sprintf@plt>
  402002:	44 89 ef             	mov    %r13d,%edi
  402005:	e8 66 ea ff ff       	callq  400a70 <close@plt>
  40200a:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
  40200f:	e9 aa 02 00 00       	jmpq   4022be <submitr+0x90b>
  402014:	48 8d b4 24 50 60 00 	lea    0x6050(%rsp),%rsi
  40201b:	00 
  40201c:	48 8d bc 24 50 80 00 	lea    0x8050(%rsp),%rdi
  402023:	00 
  402024:	ba 00 20 00 00       	mov    $0x2000,%edx
  402029:	e8 ab f8 ff ff       	callq  4018d9 <rio_readlineb>
  40202e:	48 85 c0             	test   %rax,%rax
  402031:	0f 8e 06 02 00 00    	jle    40223d <submitr+0x88a>
  402037:	48 8d b4 24 50 60 00 	lea    0x6050(%rsp),%rsi
  40203e:	00 
  40203f:	0f b6 94 24 50 60 00 	movzbl 0x6050(%rsp),%edx
  402046:	00 
  402047:	0f b6 05 00 0b 00 00 	movzbl 0xb00(%rip),%eax        # 402b4e <array.3308+0x4de>
  40204e:	39 c2                	cmp    %eax,%edx
  402050:	75 c2                	jne    402014 <submitr+0x661>
  402052:	0f b6 94 24 51 60 00 	movzbl 0x6051(%rsp),%edx
  402059:	00 
  40205a:	0f b6 05 ee 0a 00 00 	movzbl 0xaee(%rip),%eax        # 402b4f <array.3308+0x4df>
  402061:	39 c2                	cmp    %eax,%edx
  402063:	75 af                	jne    402014 <submitr+0x661>
  402065:	0f b6 94 24 52 60 00 	movzbl 0x6052(%rsp),%edx
  40206c:	00 
  40206d:	0f b6 05 dc 0a 00 00 	movzbl 0xadc(%rip),%eax        # 402b50 <array.3308+0x4e0>
  402074:	39 c2                	cmp    %eax,%edx
  402076:	75 9c                	jne    402014 <submitr+0x661>
  402078:	48 8d bc 24 50 80 00 	lea    0x8050(%rsp),%rdi
  40207f:	00 
  402080:	ba 00 20 00 00       	mov    $0x2000,%edx
  402085:	e8 4f f8 ff ff       	callq  4018d9 <rio_readlineb>
  40208a:	48 85 c0             	test   %rax,%rax
  40208d:	0f 8f 91 00 00 00    	jg     402124 <submitr+0x771>
  402093:	41 c7 06 45 72 72 6f 	movl   $0x6f727245,(%r14)
  40209a:	41 c7 46 04 72 3a 20 	movl   $0x43203a72,0x4(%r14)
  4020a1:	43 
  4020a2:	41 c7 46 08 6c 69 65 	movl   $0x6e65696c,0x8(%r14)
  4020a9:	6e 
  4020aa:	41 c7 46 0c 74 20 75 	movl   $0x6e752074,0xc(%r14)
  4020b1:	6e 
  4020b2:	41 c7 46 10 61 62 6c 	movl   $0x656c6261,0x10(%r14)
  4020b9:	65 
  4020ba:	41 c7 46 14 20 74 6f 	movl   $0x206f7420,0x14(%r14)
  4020c1:	20 
  4020c2:	41 c7 46 18 72 65 61 	movl   $0x64616572,0x18(%r14)
  4020c9:	64 
  4020ca:	41 c7 46 1c 20 73 74 	movl   $0x61747320,0x1c(%r14)
  4020d1:	61 
  4020d2:	41 c7 46 20 74 75 73 	movl   $0x20737574,0x20(%r14)
  4020d9:	20 
  4020da:	41 c7 46 24 6d 65 73 	movl   $0x7373656d,0x24(%r14)
  4020e1:	73 
  4020e2:	41 c7 46 28 61 67 65 	movl   $0x20656761,0x28(%r14)
  4020e9:	20 
  4020ea:	41 c7 46 2c 66 72 6f 	movl   $0x6d6f7266,0x2c(%r14)
  4020f1:	6d 
  4020f2:	41 c7 46 30 20 41 75 	movl   $0x74754120,0x30(%r14)
  4020f9:	74 
  4020fa:	41 c7 46 34 6f 6c 61 	movl   $0x62616c6f,0x34(%r14)
  402101:	62 
  402102:	41 c7 46 38 20 73 65 	movl   $0x72657320,0x38(%r14)
  402109:	72 
  40210a:	41 c7 46 3c 76 65 72 	movl   $0x726576,0x3c(%r14)
  402111:	00 
  402112:	44 89 ef             	mov    %r13d,%edi
  402115:	e8 56 e9 ff ff       	callq  400a70 <close@plt>
  40211a:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
  40211f:	e9 9a 01 00 00       	jmpq   4022be <submitr+0x90b>
  402124:	48 8d b4 24 50 60 00 	lea    0x6050(%rsp),%rsi
  40212b:	00 
  40212c:	4c 89 f7             	mov    %r14,%rdi
  40212f:	e8 9c ea ff ff       	callq  400bd0 <strcpy@plt>
  402134:	44 89 ef             	mov    %r13d,%edi
  402137:	e8 34 e9 ff ff       	callq  400a70 <close@plt>
  40213c:	4d 89 f0             	mov    %r14,%r8
  40213f:	45 0f b6 0e          	movzbl (%r14),%r9d
  402143:	0f b6 05 fe 09 00 00 	movzbl 0x9fe(%rip),%eax        # 402b48 <array.3308+0x4d8>
  40214a:	41 39 c1             	cmp    %eax,%r9d
  40214d:	75 30                	jne    40217f <submitr+0x7cc>
  40214f:	41 0f b6 56 01       	movzbl 0x1(%r14),%edx
  402154:	0f b6 05 ee 09 00 00 	movzbl 0x9ee(%rip),%eax        # 402b49 <array.3308+0x4d9>
  40215b:	39 c2                	cmp    %eax,%edx
  40215d:	75 20                	jne    40217f <submitr+0x7cc>
  40215f:	41 0f b6 56 02       	movzbl 0x2(%r14),%edx
  402164:	0f b6 05 df 09 00 00 	movzbl 0x9df(%rip),%eax        # 402b4a <array.3308+0x4da>
  40216b:	39 c2                	cmp    %eax,%edx
  40216d:	75 10                	jne    40217f <submitr+0x7cc>
  40216f:	41 0f b6 56 03       	movzbl 0x3(%r14),%edx
  402174:	0f b6 05 d0 09 00 00 	movzbl 0x9d0(%rip),%eax        # 402b4b <array.3308+0x4db>
  40217b:	39 c2                	cmp    %eax,%edx
  40217d:	74 46                	je     4021c5 <submitr+0x812>
  40217f:	4c 89 f6             	mov    %r14,%rsi
  402182:	bf 4c 2b 40 00       	mov    $0x402b4c,%edi
  402187:	b9 05 00 00 00       	mov    $0x5,%ecx
  40218c:	fc                   	cld    
  40218d:	f3 a6                	repz cmpsb %es:(%rdi),%ds:(%rsi)
  40218f:	0f 97 c2             	seta   %dl
  402192:	0f 92 c0             	setb   %al
  402195:	38 c2                	cmp    %al,%dl
  402197:	74 2c                	je     4021c5 <submitr+0x812>
  402199:	0f b6 05 b1 09 00 00 	movzbl 0x9b1(%rip),%eax        # 402b51 <array.3308+0x4e1>
  4021a0:	41 39 c1             	cmp    %eax,%r9d
  4021a3:	75 2a                	jne    4021cf <submitr+0x81c>
  4021a5:	41 0f b6 50 01       	movzbl 0x1(%r8),%edx
  4021aa:	0f b6 05 a1 09 00 00 	movzbl 0x9a1(%rip),%eax        # 402b52 <array.3308+0x4e2>
  4021b1:	39 c2                	cmp    %eax,%edx
  4021b3:	75 1a                	jne    4021cf <submitr+0x81c>
  4021b5:	41 0f b6 50 02       	movzbl 0x2(%r8),%edx
  4021ba:	0f b6 05 92 09 00 00 	movzbl 0x992(%rip),%eax        # 402b53 <array.3308+0x4e3>
  4021c1:	39 c2                	cmp    %eax,%edx
  4021c3:	75 0a                	jne    4021cf <submitr+0x81c>
  4021c5:	b8 00 00 00 00       	mov    $0x0,%eax
  4021ca:	e9 ef 00 00 00       	jmpq   4022be <submitr+0x90b>
  4021cf:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
  4021d4:	e9 e5 00 00 00       	jmpq   4022be <submitr+0x90b>
  4021d9:	48 8d ac 24 50 60 00 	lea    0x6050(%rsp),%rbp
  4021e0:	00 
  4021e1:	48 8b 44 24 28       	mov    0x28(%rsp),%rax
  4021e6:	48 89 04 24          	mov    %rax,(%rsp)
  4021ea:	4c 8d 8c 24 50 40 00 	lea    0x4050(%rsp),%r9
  4021f1:	00 
  4021f2:	4c 8b 44 24 10       	mov    0x10(%rsp),%r8
  4021f7:	48 8b 4c 24 18       	mov    0x18(%rsp),%rcx
  4021fc:	48 8b 54 24 20       	mov    0x20(%rsp),%rdx
  402201:	be a8 2a 40 00       	mov    $0x402aa8,%esi
  402206:	48 89 ef             	mov    %rbp,%rdi
  402209:	b8 00 00 00 00       	mov    $0x0,%eax
  40220e:	e8 0d e9 ff ff       	callq  400b20 <sprintf@plt>
  402213:	48 89 ef             	mov    %rbp,%rdi
  402216:	fc                   	cld    
  402217:	48 c7 c1 ff ff ff ff 	mov    $0xffffffffffffffff,%rcx
  40221e:	b8 00 00 00 00       	mov    $0x0,%eax
  402223:	f2 ae                	repnz scas %es:(%rdi),%al
  402225:	48 f7 d1             	not    %rcx
  402228:	49 89 cc             	mov    %rcx,%r12
  40222b:	49 83 ec 01          	sub    $0x1,%r12
  40222f:	0f 84 a8 fc ff ff    	je     401edd <submitr+0x52a>
  402235:	4c 89 e3             	mov    %r12,%rbx
  402238:	e9 fb fb ff ff       	jmpq   401e38 <submitr+0x485>
  40223d:	41 c7 06 45 72 72 6f 	movl   $0x6f727245,(%r14)
  402244:	41 c7 46 04 72 3a 20 	movl   $0x43203a72,0x4(%r14)
  40224b:	43 
  40224c:	41 c7 46 08 6c 69 65 	movl   $0x6e65696c,0x8(%r14)
  402253:	6e 
  402254:	41 c7 46 0c 74 20 75 	movl   $0x6e752074,0xc(%r14)
  40225b:	6e 
  40225c:	41 c7 46 10 61 62 6c 	movl   $0x656c6261,0x10(%r14)
  402263:	65 
  402264:	41 c7 46 14 20 74 6f 	movl   $0x206f7420,0x14(%r14)
  40226b:	20 
  40226c:	41 c7 46 18 72 65 61 	movl   $0x64616572,0x18(%r14)
  402273:	64 
  402274:	41 c7 46 1c 20 68 65 	movl   $0x61656820,0x1c(%r14)
  40227b:	61 
  40227c:	41 c7 46 20 64 65 72 	movl   $0x73726564,0x20(%r14)
  402283:	73 
  402284:	41 c7 46 24 20 66 72 	movl   $0x6f726620,0x24(%r14)
  40228b:	6f 
  40228c:	41 c7 46 28 6d 20 41 	movl   $0x7541206d,0x28(%r14)
  402293:	75 
  402294:	41 c7 46 2c 74 6f 6c 	movl   $0x616c6f74,0x2c(%r14)
  40229b:	61 
  40229c:	41 c7 46 30 62 20 73 	movl   $0x65732062,0x30(%r14)
  4022a3:	65 
  4022a4:	41 c7 46 34 72 76 65 	movl   $0x72657672,0x34(%r14)
  4022ab:	72 
  4022ac:	41 c6 46 38 00       	movb   $0x0,0x38(%r14)
  4022b1:	44 89 ef             	mov    %r13d,%edi
  4022b4:	e8 b7 e7 ff ff       	callq  400a70 <close@plt>
  4022b9:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
  4022be:	48 81 c4 78 a0 00 00 	add    $0xa078,%rsp
  4022c5:	5b                   	pop    %rbx
  4022c6:	5d                   	pop    %rbp
  4022c7:	41 5c                	pop    %r12
  4022c9:	41 5d                	pop    %r13
  4022cb:	41 5e                	pop    %r14
  4022cd:	41 5f                	pop    %r15
  4022cf:	c3                   	retq   

00000000004022d0 <driver_post>:
  4022d0:	53                   	push   %rbx
  4022d1:	48 83 ec 10          	sub    $0x10,%rsp
  4022d5:	48 89 cb             	mov    %rcx,%rbx
  4022d8:	85 d2                	test   %edx,%edx
  4022da:	74 1f                	je     4022fb <driver_post+0x2b>
  4022dc:	bf 54 2b 40 00       	mov    $0x402b54,%edi
  4022e1:	b8 00 00 00 00       	mov    $0x0,%eax
  4022e6:	e8 65 e7 ff ff       	callq  400a50 <printf@plt>
  4022eb:	66 c7 03 4f 4b       	movw   $0x4b4f,(%rbx)
  4022f0:	c6 43 02 00          	movb   $0x0,0x2(%rbx)
  4022f4:	b8 00 00 00 00       	mov    $0x0,%eax
  4022f9:	eb 47                	jmp    402342 <driver_post+0x72>
  4022fb:	48 85 ff             	test   %rdi,%rdi
  4022fe:	74 34                	je     402334 <driver_post+0x64>
  402300:	0f b6 17             	movzbl (%rdi),%edx
  402303:	0f b6 05 46 08 00 00 	movzbl 0x846(%rip),%eax        # 402b50 <array.3308+0x4e0>
  40230a:	39 c2                	cmp    %eax,%edx
  40230c:	74 26                	je     402334 <driver_post+0x64>
  40230e:	48 89 0c 24          	mov    %rcx,(%rsp)
  402312:	49 89 f1             	mov    %rsi,%r9
  402315:	41 b8 6b 2b 40 00    	mov    $0x402b6b,%r8d
  40231b:	48 89 f9             	mov    %rdi,%rcx
  40231e:	ba 73 2b 40 00       	mov    $0x402b73,%edx
  402323:	be 50 00 00 00       	mov    $0x50,%esi
  402328:	bf 58 2a 40 00       	mov    $0x402a58,%edi
  40232d:	e8 81 f6 ff ff       	callq  4019b3 <submitr>
  402332:	eb 0e                	jmp    402342 <driver_post+0x72>
  402334:	66 c7 03 4f 4b       	movw   $0x4b4f,(%rbx)
  402339:	c6 43 02 00          	movb   $0x0,0x2(%rbx)
  40233d:	b8 00 00 00 00       	mov    $0x0,%eax
  402342:	48 83 c4 10          	add    $0x10,%rsp
  402346:	5b                   	pop    %rbx
  402347:	c3                   	retq   

0000000000402348 <sigalrm_handler>:
  402348:	48 83 ec 08          	sub    $0x8,%rsp
  40234c:	ba 00 00 00 00       	mov    $0x0,%edx
  402351:	be 08 2b 40 00       	mov    $0x402b08,%esi
  402356:	48 8b 3d cb 18 20 00 	mov    0x2018cb(%rip),%rdi        # 603c28 <stderr@@GLIBC_2.2.5>
  40235d:	b8 00 00 00 00       	mov    $0x0,%eax
  402362:	e8 79 e8 ff ff       	callq  400be0 <fprintf@plt>
  402367:	bf 01 00 00 00       	mov    $0x1,%edi
  40236c:	e8 2f e7 ff ff       	callq  400aa0 <exit@plt>
  402371:	90                   	nop
  402372:	90                   	nop
  402373:	90                   	nop
  402374:	90                   	nop
  402375:	90                   	nop
  402376:	90                   	nop
  402377:	90                   	nop
  402378:	90                   	nop
  402379:	90                   	nop
  40237a:	90                   	nop
  40237b:	90                   	nop
  40237c:	90                   	nop
  40237d:	90                   	nop
  40237e:	90                   	nop
  40237f:	90                   	nop

0000000000402380 <__libc_csu_fini>:
  402380:	f3 c3                	repz retq 
  402382:	0f 1f 80 00 00 00 00 	nopl   0x0(%rax)
  402389:	0f 1f 80 00 00 00 00 	nopl   0x0(%rax)

0000000000402390 <__libc_csu_init>:
  402390:	4c 89 64 24 e0       	mov    %r12,-0x20(%rsp)
  402395:	4c 89 6c 24 e8       	mov    %r13,-0x18(%rsp)
  40239a:	4c 8d 25 c3 0c 20 00 	lea    0x200cc3(%rip),%r12        # 603064 <__fini_array_end>
  4023a1:	4c 89 74 24 f0       	mov    %r14,-0x10(%rsp)
  4023a6:	4c 89 7c 24 f8       	mov    %r15,-0x8(%rsp)
  4023ab:	49 89 f6             	mov    %rsi,%r14
  4023ae:	48 89 5c 24 d0       	mov    %rbx,-0x30(%rsp)
  4023b3:	48 89 6c 24 d8       	mov    %rbp,-0x28(%rsp)
  4023b8:	48 83 ec 38          	sub    $0x38,%rsp
  4023bc:	41 89 ff             	mov    %edi,%r15d
  4023bf:	49 89 d5             	mov    %rdx,%r13
  4023c2:	e8 61 e6 ff ff       	callq  400a28 <_init>
  4023c7:	48 8d 05 96 0c 20 00 	lea    0x200c96(%rip),%rax        # 603064 <__fini_array_end>
  4023ce:	49 29 c4             	sub    %rax,%r12
  4023d1:	49 c1 fc 03          	sar    $0x3,%r12
  4023d5:	4d 85 e4             	test   %r12,%r12
  4023d8:	74 1e                	je     4023f8 <__libc_csu_init+0x68>
  4023da:	31 ed                	xor    %ebp,%ebp
  4023dc:	48 89 c3             	mov    %rax,%rbx
  4023df:	90                   	nop
  4023e0:	48 83 c5 01          	add    $0x1,%rbp
  4023e4:	4c 89 ea             	mov    %r13,%rdx
  4023e7:	4c 89 f6             	mov    %r14,%rsi
  4023ea:	44 89 ff             	mov    %r15d,%edi
  4023ed:	ff 13                	callq  *(%rbx)
  4023ef:	48 83 c3 08          	add    $0x8,%rbx
  4023f3:	49 39 ec             	cmp    %rbp,%r12
  4023f6:	75 e8                	jne    4023e0 <__libc_csu_init+0x50>
  4023f8:	48 8b 5c 24 08       	mov    0x8(%rsp),%rbx
  4023fd:	48 8b 6c 24 10       	mov    0x10(%rsp),%rbp
  402402:	4c 8b 64 24 18       	mov    0x18(%rsp),%r12
  402407:	4c 8b 6c 24 20       	mov    0x20(%rsp),%r13
  40240c:	4c 8b 74 24 28       	mov    0x28(%rsp),%r14
  402411:	4c 8b 7c 24 30       	mov    0x30(%rsp),%r15
  402416:	48 83 c4 38          	add    $0x38,%rsp
  40241a:	c3                   	retq   
  40241b:	90                   	nop
  40241c:	90                   	nop
  40241d:	90                   	nop
  40241e:	90                   	nop
  40241f:	90                   	nop

0000000000402420 <__do_global_ctors_aux>:
  402420:	55                   	push   %rbp
  402421:	48 89 e5             	mov    %rsp,%rbp
  402424:	53                   	push   %rbx
  402425:	bb 68 30 60 00       	mov    $0x603068,%ebx
  40242a:	48 83 ec 08          	sub    $0x8,%rsp
  40242e:	48 8b 05 33 0c 20 00 	mov    0x200c33(%rip),%rax        # 603068 <__CTOR_LIST__>
  402435:	48 83 f8 ff          	cmp    $0xffffffffffffffff,%rax
  402439:	74 14                	je     40244f <__do_global_ctors_aux+0x2f>
  40243b:	0f 1f 44 00 00       	nopl   0x0(%rax,%rax,1)
  402440:	48 83 eb 08          	sub    $0x8,%rbx
  402444:	ff d0                	callq  *%rax
  402446:	48 8b 03             	mov    (%rbx),%rax
  402449:	48 83 f8 ff          	cmp    $0xffffffffffffffff,%rax
  40244d:	75 f1                	jne    402440 <__do_global_ctors_aux+0x20>
  40244f:	48 83 c4 08          	add    $0x8,%rsp
  402453:	5b                   	pop    %rbx
  402454:	c9                   	leaveq 
  402455:	c3                   	retq   
  402456:	90                   	nop
  402457:	90                   	nop

Disassembly of section .fini:

0000000000402458 <_fini>:
  402458:	48 83 ec 08          	sub    $0x8,%rsp
  40245c:	e8 ff e7 ff ff       	callq  400c60 <__do_global_dtors_aux>
  402461:	48 83 c4 08          	add    $0x8,%rsp
  402465:	c3                   	retq   
