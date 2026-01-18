vcs -full64 -sverilog -debug_access+r -kdb top.sv -cm line+cond+tgl+fsm+assert+branch

./simv +testname=test_wr_rd -cm line+cond+tgl+fsm+assert+branch
