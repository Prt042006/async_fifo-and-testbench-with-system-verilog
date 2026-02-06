class fifo_sbd;
	wr_tx txa;
	rd_tx txb;

	task run();
		forever begin
			fifo_common::mon2sbd_wr.get(txa);
			fifo_common::mon2sbd_rd.get(txb);
			if(txa.wdata==txb.rdata) fifo_common::num_matches++;
			else fifo_common::num_mismatches++;
		end
	endtask
endclass
