class wr_bfm;
	wr_tx tx;
	virtual fifo_intf vif;
	task run();
		forever begin  //infinite loop
			$display("\t\t\t wr_bfm run method called");
			vif=top.pif;
			//get tx from mailbox
			tx=new();
			fifo_common::gen2bfm_wr.get(tx);   //.get ->get used for getting output from the mailbox
							   //.put ->put used for giveing input to the mailbox
							
			//Derive the recived tx to rtl 
			fifo_common::smp.get(1);
			derive_tx(tx);   
			//observe the outputs
			tx.print("WR_BMF");
			fifo_common::bfm_count++;      //  to just know how many ittration are performed 
			fifo_common::smp.put(1);
			if(fifo_common::bfm_count == fifo_common::wr_count) begin
			
				->fifo_common::e;   //used in file rd_gen 
			end
		end
	endtask

	task derive_tx(input wr_tx tx);  //task derive_tx(wr_tx); {not correct
		@(posedge vif.wr_clk_i);
		vif.wr_en_i = tx.wr_en;	
		vif.wdata_i = tx.wdata; 
		@(posedge vif.wr_clk_i);
		tx.full = vif.wr_error_o;
		vif.wr_en_i = 0;	
		vif.wdata_i = 0; 
		repeat(tx.wr_delay)@(posedge vif.wr_clk_i);
	endtask
endclass
