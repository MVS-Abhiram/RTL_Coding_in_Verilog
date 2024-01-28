Hi guys,

In the file siso.v and siso_tb.v I have implemented a shift right serial in serial out register.

In the files siso_shl_buf.v and siso_shl_buf_tb.v, e we will be seeing how to design a shift left - Serial in serial out shift register, such that every first 2 clocks the shifting happens and the next two clock cycles register acts as a buffer. Here is an implementation of an 4 bit register.
