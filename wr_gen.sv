class wr_gen;
	wr_tx tx;
	int delay;
	task run();
		$display("\t\t\t wr_gen run method called");
		case(fifo_common::testname)
			"test_wr":begin
				$display("entered into test_wr testcase");
				write(fifo_common::wr_count);
			end
			"test_wr_error":begin
				$display("entered into test_wr_error testcase");
				write(fifo_common::wr_count);
			end
			"test_wr_rd":begin
				$display("entered into test_wr_rd testcase");
				write(fifo_common::wr_count);
			end
			"test_wr_error":begin
				$display("entered into test_wr_rd testcase");
				write(fifo_common::wr_count);
			end
			"test_all_error":begin
				$display("entered into test_all_error testcase");
				write(fifo_common::wr_count);
			end
			"test_concurrent_wr_rd":begin
				repeat(100)begin
					delay=$urandom_range(1,10);
					write(fifo_common::wr_count,delay);
				end
			end
			
		endcase
	endtask
	task write(int count, int delay=0);
		repeat(count) begin
			tx=new();
			assert(tx.randomize() with {wr_en==1;wr_delay==delay;});/* else $error("Randomization failed!");*/  //assert -> to check line work or not
			fifo_common::gen2bfm_wr.put(tx);
			tx.print("WR_GEN");
			$display("entered");
		end
	endtask
endclass


//module to module -> port connection 
//class to module -> interface 
//class to class -> mailbox
