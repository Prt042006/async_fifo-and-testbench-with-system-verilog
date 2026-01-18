class rd_mon;
	rd_tx tx;
	virtual fifo_intf vif;
	task run();
		//take the interface signals 
		//Assign that to tx signals
		forever begin
			//$display("\t\t\t rd_mon run method called");
			vif=top.pif;
			@(posedge vif.rd_clk_i);
			//rand bit rd_en;                    //we have to capture these four data from interface and monitor them
			//rand bit [7:0] rdata;
			//bit empty;
			//bit rd_error;
			if(vif.rd_en_i==1)begin             //without this 'if' it will monitor the data till the end of clock/whole time duration
				tx=new();
				tx.rd_en = vif.rd_en_i;
				tx.rdata = vif.rdata_o;
				tx.empty  = vif.empty_o;
				tx.rd_error = vif.rd_error_o;
				fifo_common::mon2cov_rd.put(tx);
				tx.print("RD_MON");
			end
		end
	endtask
endclass
