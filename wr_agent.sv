class wr_agent;
	wr_gen wr_gen_i=new();
	wr_bfm wr_bfm_i=new();
	wr_mon wr_mon_i=new();
	wr_cov wr_cov_i=new();
	task run();
		$display("\t\t wr_agent run method called");
		fork
			wr_gen_i.run();
			wr_bfm_i.run();
			wr_mon_i.run();
			wr_cov_i.run();
		join
	endtask
endclass
