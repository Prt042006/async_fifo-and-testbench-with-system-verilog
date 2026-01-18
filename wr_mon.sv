class wr_mon;
	wr_tx tx;
	virtual fifo_intf vif;
	task run();
		//take the interface signals 
		//Assign that to tx signals
		forever begin
			//$display("\t\t\t wr_mon run method called");
			vif=top.pif;
			@(posedge vif.wr_clk_i);
			//rand bit wr_en;                            //we have to capture these four data from interface and monitor them
			//rand bit [7:0] wdata;
			//bit full;
			//bit wr_error;
			if(vif.wr_en_i==1)begin                      //without this 'if' it will monitor the data till the end of clock/whole time duration
				tx=new();
				tx.wr_en = vif.wr_en_i;
				tx.wdata = vif.wdata_i;
				tx.full  = vif.full_o;
				tx.wr_error = vif.wr_error_o;
				fifo_common::mon2cov_wr.put(tx);
				tx.print("WR_MON");
			end
		end
	endtask
endclass
