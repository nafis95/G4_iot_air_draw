-- Copyright 1986-2018 Xilinx, Inc. All Rights Reserved.
-- --------------------------------------------------------------------------------
-- Tool Version: Vivado v.2018.2 (win64) Build 2258646 Thu Jun 14 20:03:12 MDT 2018
-- Date        : Sat Feb 23 00:48:24 2019
-- Host        : DESKTOP-4H39SC0 running 64-bit major release  (build 9200)
-- Command     : write_vhdl -force -mode funcsim
--               D:/ClassProject/ece532/Project/proj_2/myproj/project_1.srcs/sources_1/bd/hdmi/ip/hdmi_microblaze_0_xlconcat_0/hdmi_microblaze_0_xlconcat_0_sim_netlist.vhdl
-- Design      : hdmi_microblaze_0_xlconcat_0
-- Purpose     : This VHDL netlist is a functional simulation representation of the design and should not be modified or
--               synthesized. This netlist cannot be used for SDF annotated simulation.
-- Device      : xc7a200tsbg484-1
-- --------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity hdmi_microblaze_0_xlconcat_0 is
  port (
    In0 : in STD_LOGIC_VECTOR ( 0 to 0 );
    In1 : in STD_LOGIC_VECTOR ( 0 to 0 );
    In2 : in STD_LOGIC_VECTOR ( 0 to 0 );
    In3 : in STD_LOGIC_VECTOR ( 0 to 0 );
    In4 : in STD_LOGIC_VECTOR ( 0 to 0 );
    In5 : in STD_LOGIC_VECTOR ( 0 to 0 );
    In6 : in STD_LOGIC_VECTOR ( 0 to 0 );
    In7 : in STD_LOGIC_VECTOR ( 0 to 0 );
    In8 : in STD_LOGIC_VECTOR ( 0 to 0 );
    In9 : in STD_LOGIC_VECTOR ( 0 to 0 );
    dout : out STD_LOGIC_VECTOR ( 9 downto 0 )
  );
  attribute NotValidForBitStream : boolean;
  attribute NotValidForBitStream of hdmi_microblaze_0_xlconcat_0 : entity is true;
  attribute CHECK_LICENSE_TYPE : string;
  attribute CHECK_LICENSE_TYPE of hdmi_microblaze_0_xlconcat_0 : entity is "hdmi_microblaze_0_xlconcat_0,xlconcat_v2_1_1_xlconcat,{}";
  attribute DowngradeIPIdentifiedWarnings : string;
  attribute DowngradeIPIdentifiedWarnings of hdmi_microblaze_0_xlconcat_0 : entity is "yes";
  attribute X_CORE_INFO : string;
  attribute X_CORE_INFO of hdmi_microblaze_0_xlconcat_0 : entity is "xlconcat_v2_1_1_xlconcat,Vivado 2018.2";
end hdmi_microblaze_0_xlconcat_0;

architecture STRUCTURE of hdmi_microblaze_0_xlconcat_0 is
  signal \^in0\ : STD_LOGIC_VECTOR ( 0 to 0 );
  signal \^in1\ : STD_LOGIC_VECTOR ( 0 to 0 );
  signal \^in2\ : STD_LOGIC_VECTOR ( 0 to 0 );
  signal \^in3\ : STD_LOGIC_VECTOR ( 0 to 0 );
  signal \^in4\ : STD_LOGIC_VECTOR ( 0 to 0 );
  signal \^in5\ : STD_LOGIC_VECTOR ( 0 to 0 );
  signal \^in6\ : STD_LOGIC_VECTOR ( 0 to 0 );
  signal \^in7\ : STD_LOGIC_VECTOR ( 0 to 0 );
  signal \^in8\ : STD_LOGIC_VECTOR ( 0 to 0 );
  signal \^in9\ : STD_LOGIC_VECTOR ( 0 to 0 );
begin
  \^in0\(0) <= In0(0);
  \^in1\(0) <= In1(0);
  \^in2\(0) <= In2(0);
  \^in3\(0) <= In3(0);
  \^in4\(0) <= In4(0);
  \^in5\(0) <= In5(0);
  \^in6\(0) <= In6(0);
  \^in7\(0) <= In7(0);
  \^in8\(0) <= In8(0);
  \^in9\(0) <= In9(0);
  dout(9) <= \^in9\(0);
  dout(8) <= \^in8\(0);
  dout(7) <= \^in7\(0);
  dout(6) <= \^in6\(0);
  dout(5) <= \^in5\(0);
  dout(4) <= \^in4\(0);
  dout(3) <= \^in3\(0);
  dout(2) <= \^in2\(0);
  dout(1) <= \^in1\(0);
  dout(0) <= \^in0\(0);
end STRUCTURE;