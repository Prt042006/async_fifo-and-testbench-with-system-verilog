class rd_bfm;
	rd_tx tx;
	virtual fifo_intf vif;
	task run();
		forever begin
			$display("\t\t\t rd_bfm run method called");
			vif = top.pif;
			//get tx from mailbox
			tx=new();
			//$display("before getting the tx from the read gen");
			fifo_common::gen2bfm_rd.get(tx);
			//$display("before getting the tx from the read gen");
			//derive the recived tx to rtl
			fifo_common::smp.get(1); 
			derive_tx(tx);
			//observe the output
			tx.print("WR_BFM");
			fifo_common::smp.put(1); 
			
		end
	endtask
	
	task derive_tx(rd_tx tx);
		$display("inside drive tx task of read agent");
		@(posedge vif.rd_clk_i);
		vif.rd_en_i = tx.rd_en;
		@(posedge vif.rd_clk_i);
		tx.rdata = vif.rdata_o;
		tx.empty = vif.empty_o;
		tx.rd_error = vif.rd_error_o;
		vif.rd_en_i = 0;
		repeat(tx.rd_delay)@(posedge vif.rd_clk_i);
	endtask
endclass
