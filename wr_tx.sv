class wr_tx;
	rand bit wr_en;
	rand bit[7:0] wdata;
	bit full;
	bit wr_error;
	rand int wr_delay;
	function void print(string name="WR_TX");
		$display("Time=%0t\tcomp=%0s\tWr_en=%0d\tWdata=%0h\tFull=%0d\tWr_erro=%0d",$time,name,wr_en,wdata,full,wr_error);
//		$display("#################################");
//		$display("Time=%0t",$time);
//		$display("Accessing component=%0s\t",name);
//		$display("WR_En=%0d\t",wr_en);
//		$display("full=%0d\t",full);
//		$display("Wdata=%0d\t",wdata);
//		$display("Wr_Error=%0d\t",wr_error);
//		$display("#################################");
	endfunction 
	constraint wr_delay_c
	{
		soft wr_delay==0;
	}
endclass

		
		
	 
