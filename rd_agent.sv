class rd_agent;
	rd_gen rd_gen_i=new();
	rd_bfm rd_bfm_i=new();
	rd_mon rd_mon_i=new();
	rd_cov rd_cov_i=new();
	task run();
		$display("\t\t rd_agent run method called");
		fork
			rd_gen_i.run();
			rd_bfm_i.run();
			rd_mon_i.run();
			rd_cov_i.run();
		join
	endtask
endclass
