class fifo_common;
	static string testname;        // passing string for different test case defined in run.sh file 
	static mailbox gen2bfm_wr=new();
	static mailbox gen2bfm_rd=new();
	static semaphore smp = new(1); //for writing and reading ek baad ek (matlab ek bar likha fir baar read kiya and so on)
	static event e;               // first all write happens then it starts to reading 
	static int bfm_count;
	static int wr_count=5;        //no. of itreation you want perform in wr_bfm
	static int rd_count=5;        //no. of itreation you want perform in rd_bfm
	static mailbox mon2cov_wr = new();
	static mailbox mon2cov_rd = new();

endclass
