class rd_cov;
	rd_tx tx;
	//we will write coverpoints inside covergroup 
	//we will write bins inside coverpoint
	//covergroup is dynamic in nature 
	covergroup rd_gp;
		RD_EN_CP: coverpoint tx.rd_en
		{
			bins READ ={1'b1};
			ignore_bins READ_IGN = {1'b0};
		}
		RDATA_CP: coverpoint tx.rdata 
		{
			option.auto_bin_max=4;              //what it mean?
		}
		EMPTY_CP: coverpoint tx.empty
		{
		bins EMPTY_1 = {1'b1};
		bins EMPTY_0 = {1'b0};
		}
		RD_ERROR_CP: coverpoint tx.rd_error
		{
		bins RD_ERROR_1 = {1'b1};
		bins RD_ERROR_0 = {1'b0};
		}
	endgroup
	function new();
		rd_gp=new();
	endfunction 
	task run();
		$display("\t\t\t rd_cov run method called");
		//get the tx from monitor
		//sample the coverage 
		forever begin 
			fifo_common::mon2cov_rd.get(tx);
			rd_gp.sample();                  //once it get the transection, it will apply this transection to the covergroup
		end
	endtask
endclass
