`include "fifo.v"
`include "fifo_common.sv"
`include "fifo_intf.sv"
`include "rd_tx.sv"
`include "rd_cov.sv"
`include "rd_mon.sv"
`include "rd_bfm.sv"
`include "rd_gen.sv"
`include "rd_agent.sv"
`include "wr_tx.sv"
`include "wr_cov.sv"
`include "wr_mon.sv"
`include "wr_bfm.sv"
`include "wr_gen.sv"
`include "wr_agent.sv"
`include "fifo_sbd.sv"
`include "fifo_env.sv"
module top;
	bit wr_clk_i;
	bit rd_clk_i;
	bit rst_i;
	//interface isntantiation
	fifo_intf pif(wr_clk_i,rd_clk_i,rst_i);

	//create env instance and run it
	fifo_env env=new();
	initial begin
		@(negedge rst_i);
		$display("top module functionality started");
		env.run();
	end

	//dut instantiation
	fifo dut(.wr_clk_i(pif.wr_clk_i)	,
		 .rd_clk_i (pif.rd_clk_i)     , 
		.rst_i	   (pif.rst_i)     , 
		.wr_en_i   (pif.wr_en_i)     , 
		.wdata_i   (pif.wdata_i)     , 
		.rd_en_i   (pif.rd_en_i)     , 
		.rdata_o   (pif.rdata_o)     , 
		.full_o	   (pif.full_o)     , 
		.empty_o   (pif.empty_o)     , 
		.wr_error_o(pif.wr_error_o)	, 
		.rd_error_o(pif.rd_error_o)		
	);
	//connection by position
	//wr_clk generation
	always begin
		wr_clk_i=0;	#5;
		wr_clk_i=1;	#5;
	end
	//if #5=5ns, TP=10ns
	//rd_clk generation
	always begin
		rd_clk_i=0;	#7;
		rd_clk_i=1;	#7;
	end
	
	//rst generation
	initial begin
		rst_i=1;//applying reset
		$value$plusargs("testname=%s",fifo_common::testname);
		repeat(2) @(posedge wr_clk_i);//giving design time to reset everything. get it in a known state
		rst_i=0;//releasing reset
	end
	//finish logic
	initial begin
		#15000;
		if(fifo_common::num_matches==0 && fifo_common::num_mismatches!=0)begin
			$display("test failed::\t matches=%d\ttmismatches=%d",fifo_common::num_matches,fifo_common::num_mismatches);
		end
		else begin 
			$display("test passed::\t matches=%d\ttmismatches=%d",fifo_common::num_matches,fifo_common::num_mismatches);
		end
		#10;
		$finish();
	end

//	//.fsdb file name
	initial begin
		$fsdbDumpfile("async_fifo.fsdb");
		$fsdbDumpvars(0,top);
	end
	//.fsdb file name
//	initial begin
//		$dumpfile("sync_fifo");
//		$dumpvars(0,top);
//	end
endmodule
