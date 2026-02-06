class rd_tx;
	rand bit rd_en;
	rand bit[7:0] rdata;
	bit empty;
	bit rd_error;
	rand int rd_delay;
	function void print(string name="RD_TX");
		$display("Time=%0t\tcomp=%0s\trd_en=%0d\trdata=%0h\tEmpty=%0d\trd_erro=%0d",$time,name,rd_en,rdata,empty,rd_error);
//		$display("Time=%0t",$time);
//		$display("Accessing component=%0s\t",name);
//		$display("RD_En=%0d",rd_en);
//		$display("Rdata=%0d",rdata);
//		$display("empty=%0d\t",empty);
//		$display("Rd_Error=%0d\t",rd_error);
	endfunction 
	constraint rd_delay_c
	{
		soft rd_delay ==0;
	}
endclass 

		
	
