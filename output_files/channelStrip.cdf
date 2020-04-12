/* Quartus Prime Version 18.1.0 Build 625 09/12/2018 SJ Lite Edition */
JedecChain;
	FileRevision(JESD32A);
	DefaultMfr(6E);

	P ActionCode(Ign)
		Device PartName(SOCVHPS) MfrSpec(OpMask(0));
	P ActionCode(Cfg)
		Device PartName(5CSEMA4U23) Path("C:/Users/John Matson/Documents/Admin/Repositories/Projects/fpga-channel-strip/output_files/") File("channelStrip.sof") MfrSpec(OpMask(1));

ChainEnd;

AlteraBegin;
	ChainType(JTAG);
AlteraEnd;
