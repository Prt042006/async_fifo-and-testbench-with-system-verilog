class rd_gen;
	rd_tx tx;
	int delay;
	task run();
		wait(fifo_common::e.triggered);           // waiting for event to get trigered 
		$display("\t\t\t rd_gen run method called");
		case(fifo_common::testname)
			"test_wr_rd":begin
				read(fifo_common::rd_count);	
			end	
			"test_all_error":begin
				read(fifo_common::rd_count);	
			end	
			"test_empty_error":begin
				$display("entered into test_empty_error testcase");
				read(fifo_common::wr_count);
			end
			"test_concurrent_wr_rd":begin
				delay=$urandom_range(1,10);
				read(fifo_common::rd_count,delay);
			end
		endcase
	endtask
	task read(int count,int delay=0);
		repeat(count)begin
			tx=new();
			assert(tx.randomize()with {rd_en==1;rd_delay==delay;});
			fifo_common::gen2bfm_rd.put(tx);
			tx.print("RD_GEN");
		end
	endtask
endclass
