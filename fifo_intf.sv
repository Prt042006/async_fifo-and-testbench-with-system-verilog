interface fifo_intf(input bit wr_clk_i, rd_clk_i, rst_i );
	bit wr_en_i   ; 
	bit[7:0] wdata_i; 
	bit rd_en_i   ; 
	bit[7:0] rdata_o; 
	bit full_o    ; 
	bit empty_o   ; 
	bit wr_error_o; 
	bit rd_error_o;
endinterface
