`include "fifo.v"
module top;
	reg wr_clk_i;
	reg rd_clk_i;
	reg rst_i;
	reg wr_en_i;
	reg[7:0] wdata_i;
	reg rd_en_i;
	wire[7:0] rdata_o;
	wire full_o;
	wire empty_o;
	wire wr_error_o;
	wire rd_error_o;
	reg[30*8:1]testname;
	reg[3:0] wr_delay;
	reg[3:0] rd_delay;

	//dut instantiation
	fifo dut(wr_clk_i, rd_clk_i, rst_i, wr_en_i, wdata_i, rd_en_i, rdata_o, full_o, empty_o, wr_error_o, rd_error_o);
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
		wdata_i=0;
		wr_en_i=0;
		rd_en_i=0;
		$value$plusargs("testname=%s",testname);
		repeat(2) @(posedge wr_clk_i);//giving design time to reset everything. get it in a known state
		rst_i=0;//releasing reset
	end
	//finish logic
	initial begin
		#3000;
		$finish();
	end

//	//.fsdb file name
	initial begin
		$fsdbDumpfile("sync_fifo.fsdb");
		$fsdbDumpvars(0,top);
	end
	//.fsdb file name
//	initial begin
//		$dumpfile("sync_fifo");
//		$dumpvars(0,top);
//	end
	//scenario generation for fifo
	initial begin
		//make sure dut is ready to accept/provide data
		@(negedge rst_i);
		case(testname)
			"fifo_full_test":begin
				write_fifo(16);
			end
			"fifo_empty_test":begin
				write_fifo(16);
				read_fifo(16);
			end
			"full_error_test":begin
				write_fifo(17);
			end
			"empty_error_test":begin
				write_fifo(16);
				read_fifo(17);
			end
			"concur_wr_rd_test":begin
				fork
					write_fifo(35);
					read_fifo(35);
				join
			end
		endcase
	end
	task read_fifo(integer num_reads);
		repeat(num_reads)begin
			rd_delay=$urandom_range(1,5);
			repeat(rd_delay) @(posedge rd_clk_i);
			//#rd_delay;
			@(posedge rd_clk_i);
			rd_en_i=1;
			@(posedge rd_clk_i);
			rd_en_i=0;
		end
	endtask
	task write_fifo(integer num_writes);
		repeat(num_writes)begin
			wr_delay=$urandom_range(1,5);
			repeat(wr_delay) @(posedge wr_clk_i);
			//#wr_delay;
			@(posedge wr_clk_i);
			wdata_i=$random();
			wr_en_i=1;
			@(posedge wr_clk_i);
			wdata_i=0;
			wr_en_i=0;
		end
	endtask

endmodule
