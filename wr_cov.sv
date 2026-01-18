class wr_cov;
	wr_tx tx;
	//we will write coverpoints inside covergroup 
	//we will write bins inside coverpoint
	//covergroup is dynamic in nature 
	covergroup wr_gp;
		WR_EN_CP: coverpoint tx.wr_en
		{
			bins WRITE ={1'b1};
			ignore_bins WRITE_IGN = {1'b0};
		}
		WDATA_CP: coverpoint tx.wdata 
		{
			option.auto_bin_max=4;              //what it mean?
		}
		FULL_CP: coverpoint tx.full
		{
		bins FULL_1 = {1'b1};
		bins FULL_0 = {1'b0};
		}
		WR_ERROR_CP: coverpoint tx.wr_error
		{
		bins WR_ERROR_1 = {1'b1};
		bins WR_ERROR_0 = {1'b0};
		}
	endgroup
	function new();
		wr_gp=new();
	endfunction 
	task run();
		$display("\t\t\t wr_cov run method called");
		//get the tx from monitor
		//sample the coverage 
		forever begin 
			fifo_common::mon2cov_wr.get(tx);
			wr_gp.sample();                  //once it get the transection, it will apply this transection to the covergroup
		end
	endtask
endclass
