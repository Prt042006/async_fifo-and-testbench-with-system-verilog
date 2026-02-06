class fifo_env;
	wr_agent wr_agent_i=new();
	rd_agent rd_agent_i=new();
	fifo_sbd sbd =new();
	task run();
		$display("\t fifo_env run method called");
		fork
			begin
				fork                              // for running both agent congurently  
					wr_agent_i.run();
					rd_agent_i.run();
				join
			end
			sbd.run();
		join
	endtask
endclass
