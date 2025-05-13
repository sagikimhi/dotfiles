speedata_run_simulator.pl - Running Testbench Simulator

Script will look inside the current <block>_sim/sim/ folder,
for [1;34;40m'sim_args.all'[0m file, as well as simulator-specific [1;34;40m'sim_args.<simulator>'[0m file
and if ANY of them (one or both) exists, 
the file's content is added to the command line inside -sim_add_cmd '<file_content>' !
This is useful to include a common simulator arguments that are used across all runs,
	e.g.: +UVM_NO_SUMMARY
Options:
  General Options : 
   -> -dry_run         - Only print the commands to be executed, without executing them. use for debugging script
   -> <-workrun=X>     - to run with NON standard librraies suffixed by X
   -> -ram=NUM         - request NUM GB of RAM from NC when dispatching the compiler/simulator job
   -> -logname=NAME    - Change the default Name run.log file, to <NAME>
   -> -technology=TECHNOLOGY>        - Optional Technology Override
   -> -mem_tech=Memory TECHNOLOGY>   - Optional Memory Technology Override
   -> -localmem                      - use to take local version of memories library.
   -> -real_mem_mode                 - use to take full memory model (default is use sim-optimized model).
   -> -xilinx          - for xilinx environment run
   -> -clean={all|workrun|comp|csrc} - clean (delete) the output folder(s) before starting the run ! 
                                       Selected destination folder content will be removed !!
                                       'workrun', 'comp(ilation)', 'csrc' 
                                       flags will clean the specified folder and sub folders.
                                       [1;32;41m'all' flag will remove also vmgr regressions folder[0m
   -> -sure            - (-clean extra flag) skip confirmation prompt before cleaning - USE WITH CAUTION !!!
   -> -set=SET for NC Data Set
   -> -nodump          - do not dump waves (default is dump all, by loading '<block>_xcl.tcl')
   -> -tcl=<file.tcl>  - replace default wavedump file with user customized one (default is probe all levels, by loading '<block>_xcl.tcl')
   -> -sim_add_cmd="PARAMETERS"    - Comma Seperated ADDED Comamnds to Simulator - no spaces allowed

  Compile Options : 
   -> -debug= XCL : {none|tb_only|all|all+macros} 
              VCS : {none|all} 
              - default is 'none' for both simulators/compiler, to enable faster simulator performance (but no debug access)
   -> -compile_only    - Compile and elaborate the testbench/design but do not run
   -> -access=rw       - Change access options to design (default is '+r' only) 
   -> -coven           - Enable Coverage collection of all kinds (code, functional, formal)

  Runtime Options : 
   -> -test=TEST       - There is no Default Test. Not relevant for -compile_only/-list_only flags
   -> -gui             - RUN in GUI Mode
   -> -run_only - use existing compilation and only run the test (forced to 1 if randomseed == 1
   -> -seed=SEED       - Default is SEED==1
   -> -batchm          - Will run without The Interactive Mode
                         Default Mode is interactive
                         Will be forced if randomseed with multiple cpus is used
   -> -uvm_verbosity=VERBOSITY
   -> -stop_error_num=NUM - Stop Run after NUM Of Bad Tests
   -> -randomseed=NUM_RUNS - Rerun The test with automatically generated random seeds NUM_RUNS times - forces the run_only flag
   -> -numcpu=NUM - Use NUM of parallel regression runs (Valid only when randomseed == 1
   -> -vip_lic=vip_list  = Comma Separated list of VIP licenses required for the run.
                           Example : -vip_lic=axi_monitor,axi_master

  Tool specific Options : 
     XCelium Options : 
       -> -simulator="VCS|XCL"  (default is XCL, if not specified)
       -> -xcl_ver=##.##.### - select a different version than the one pointed by 'current' for XCelium
       -> -nofast      = (XCL flag) do not use fast recompilation (default is fast recompile)
       -> -gcc_ver=gnu++## - (XCL flag) change the default gcc version used (17) for c compilations and SO support
       -> -vmanager    = special mode for running jobs under VMANAGER regression launcher.
                         not to be used on shell command lines !!!
           -> -comp_dir = MANDATORY with -vmanager flag, location of central compilation.
       When Compile flag -coven is set :
            Will look for <block>_sim/cov/<block>.ccf file and auto-load it, if present
            -> -ccf_file <ccf_file_path>  = (XCL flag) Only when Coverage enabled (-coven), loads the user-specified file,
                                       instead of default <block>.ccf
       -> -xcl_fsdb        = enable dumping of FSDB and/or VPD using system calls : { $fsdbDumpfile(), $vcdplusfile(), $vcdpluson() , etc. }
       -> -fs_grp=<FairShareGroup> = set the FairShare group for the nc Job. - used to prioritize the jobs over regression jobs
       -> -noxprop         = disable x-propagation feature (default if xprop enabled in CAT mode !)
       -> -foxxprop        = enable x-propagation feature in FOX mode (more strict than the default CAT mode !)
       -> -ida={int|pp|fr} = enable Cadence Indago Debug Analyzer , Modes : 
                             INTeractive, Post-Processing or Flow Recording debug info dumping.
       -> -vwdb            = enable Cadence Indago Debug Analyzer new waveform database format. CURRENTLY ONLY WORKS WITH -ida=pp
       -> -uvmhome=UVM_LIB = change the default (CDNS-1.2) UVM library used to the supplied library. available libs: 
       ->                    { CDNS-1.1d; CDNS-1.2; CDNS-1.2-ML; CDNS-IEEE }
       -> -setenv=<ENVVAR=Value>   = pass environment variables with values to the XCelium Command line
     VCS Options : 
       -> -simv=NAME - Change The default name of the VCS simv executable
       -> -vcslint     = Activater VCS +lint=TFIPC-L option

  List build Options : 
   -> -nolist          - Do Not Generate Automatic List
   -> -list_only       - Only Generate Automatic List
   -> -loglist         - Log the Generated Automatic List run (to <block>_build_list.log)
   -> -tag=<tag_list>  - TAGdesign,TAGVerification  - Design/Verification TAGS
   -> -tag_only        - Do not do a local Search
   -> -listc="PARAMETERS" - Comma Sepearted List Creation Parameters to build_module_list - no spaces allowed


  To select specific help topics  : 
    -> -help_topic={general compilation run-time tools list}
    example :
         speedata_run_simulator.pl -help -help_topic=tools


