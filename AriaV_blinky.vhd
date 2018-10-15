------------------------------------------------------------------------------
-- Title:       a5gx_starter_golden_top.vhd                                   
-- Rev:         Rev 1.0                                                     
------------------------------------------------------------------------------
-- Description: Golden Top file contains Arria V GX FPGA Starter Kit		
--              Rev C board pins and I/O standards.                         
------------------------------------------------------------------------------
-- Revision History:                                                        
-- Rev 1.0: Initial release															
------------------------------------------------------------------------------
-------- 1 ------- 2 ------- 3 ------- 4 ------- 5 ------- 6 ------- 7 ------7
-------- 0 ------- 0 ------- 0 ------- 0 ------- 0 ------- 0 ------- 0 ------8
------------------------------------------------------------------------------
--Copyright 2012 Altera Corporation. All rights reserved.  Altera products
--are protected under numerous U.S. and foreign patents, maskwork rights,
--copyrights and other intellectual property laws.
--                 
--This reference design file, and your use thereof, is subject to and
--governed by the terms and conditions of the applicable Altera Reference
--Design License Agreement.  By using this reference design file, you
--indicate your acceptance of such terms and conditions between you and
--Altera Corporation.  In the event that you do not agree with such terms and
--conditions, you may not use the reference design file. Please promptly                         
--destroy any copies you have made.
--
--This reference design file being provided on an "as-is" basis and as an
--accommodation and therefore all warranties, representations or guarantees
--of any kind (whether express, implied or statutory) including, without
--limitation, warranties of merchantability, non-infringement, or fitness for
--a particular purpose, are specifically disclaimed.  By making this
--reference design file available, Altera expressly does not recommend,
--suggest or require that this reference design file be used in combination 
--with any other product not provided by Altera
------------------------------------------------------------------------------

--
-- First try to accomodate a MC and communicate with the MSCB system
-- FW, feb 2016
--
library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use ieee.std_logic_unsigned.all;

entity AriaV_blinky is
	port 
	(
	--Refclk & Clkout
	--clkin: 22
--	--clkout: 1
--	clk_148_p		: in std_logic;--					1.5-V PCML, default 148.5MHz
--	refclk1_ql0_p	: in std_logic;--					1.5-V PCML, default 409.6MHz
--	refclk2_ql1_p	: in std_logic;--					1.5-V PCML, default 125MHz
--	refclk1_qr0_p	: in std_logic;--					1.5-V PCML, default 156.25MHz
	refclk2_qr1_p	: in std_logic;--					1.5-V PCML, default 125MHz
--	refclk3_qr1_p	: in std_logic;--					1.5-V PCML, HSMC CLKIN2 (differential)
--	clk_125_p		: in std_logic;--					LVDS, default 125MHz
--	clkintop_125_p	: in std_logic;--					LVDS, default 125MHz
--	clkinbot_125_p	: in std_logic;--					LVDS, default 125MHz
--	clkintop_100_p	: in std_logic;--					LVDS, default 100MHz
--	clkinbot_100_p	: in std_logic;--					LVDS, default 100MHz
	clkin_50_top	: in std_logic;--					2.5V, default 50MHz
--	clkin_50_bot	: in std_logic;--					2.5V, default 50MHz
	clkout_sma		: out std_logic;--					2.5V
--
--	--SMA connector interface
--	--xcvr: 1
--	sma_xcvr_tx_p	: out std_logic;--				1.5-V PCML, SMA Receive	
--	sma_xcvr_rx_p	: in std_logic;--					1.5-V PCML, SMA Transmit	
--	
--	--PCIe edge connector interface
--	--xcvr: 8
--	--IO: 8
--	pcie_tx_p		: out std_logic_vector(7 downto 0);--	1.5-V PCML, PCIe Transmit Data
--	pcie_rx_p		: in std_logic_vector(7 downto 0);--	1.5-V PCML, PCIe Receive Data-req's OCT
--	pcie_refclk_p	: in std_logic;--	 	 						HCSL, PCIe Clock- Terminate on MB	
--	pcie_perstn		: in std_logic;--	 							2.5V, PCIe Reset
--	pcie_led_g2		: out std_logic;--		 					2.5V, PCIe GEN2 LED indicator
--	pcie_waken		: out std_logic;--			 				2.5V, PCIe Wake-Up
--	pcie_led_x1		: out std_logic;--		 					2.5V, PCIe x1 LED indicator
--	pcie_led_x4		: out std_logic;--		 					2.5V, PCIe x4 LED indicator
--	pcie_led_x8		: out std_logic;--			 				2.5V, PCIe x8 LED indicator
--	pcie_smbdat		: inout std_logic;--							2.5V, SMBus Clock
--	pcie_smbclk		: out std_logic;--		 					2.5V, SMBus Data
--
--	--SDI cable driver/equalizer interface 
--	--xcvr: 1
--	--IO: 9
--	sdi_tx_p			: out std_logic;--						1.5-V PCML, SDI Video Output
--	sdi_rx_p			: in std_logic;--							1.5-V PCML, SDI Video Input-req's OCT
--	sdi_rx_bypass	: in std_logic;--							2.5V, Receive Bypass
--	sdi_tx_sd_hdn	: out std_logic;--						2.5V, HD Mode Enable
--	sdi_tx_en		: out std_logic;--						2.5V, Transmit Enable
--	sdi_rx_en		: out std_logic;--						2.5V, Receive Enable - Tri-state
--	sdi_scl			: out std_logic;--						2.5V, Cable driver I2C SCL
--	sdi_sda			: inout std_logic;--						2.5V, Cable driver I2C SDA
--	sdi_fault		: in std_logic;--							2.5V, Cable driver Fault
--	sdi_clk148_up	: out std_logic;--						2.5V, VCO Frequency Up
--	sdi_clk148_dn	: out std_logic;--						2.5V, VCO Frequency Down
--
--	--HDMI interface
--	--IO: 4
--	--XCVR: 4 (TX only)
--	hdmi_tx_i2c_scl	: out std_logic;--							2.5V, DDC SCL
--	hdmi_tx_i2c_sda	: inout std_logic;--							2.5V, DDC SDA
--	hdmi_tx_oen			: out std_logic;--							2.5V, HDMI Transmit enable
--	hdmi_tx_hpd			: in std_logic;--								2.5V, HDMI Hot Plug Detect
--	hdmi_tx_p			: out std_logic_vector(2 downto 0);--	1.5-V PCML, HDMI Transmit Data (2.7Gbps max)
--	hdmi_tx_clkout_p	: out std_logic;--							1.5-V PCML, HDMI Transmit Clock (270MHz max)
--
--   --HIGH-SPEED-MEZZANINE-CARD interface ------------//198 pins
--   --xcvr: 8
--   --IO: 85
--
--   --Bank 1 (transceivers)   	
	hsma_tx_p	: out std_logic_vector(1 downto 0);--			1.5-V PCML, HSMA Transmit Data
	hsma_rx_p	: in std_logic_vector(1 downto 0);--			1.5-V PCML, HSMA Receive Data-req's OCT
--	
--	--Bank 1, 2 & 3 (non-transceiver)
--	hsma_sda				: inout std_logic;--         					2.5V, SMBus Data   
--	hsma_scl				: out std_logic;--         					2.5V, SMBus Clock 
--	hsma_prsntn			: in std_logic;--									2.5V, HSMC Presence Detect Input   
--	hsma_clk_out0		: out std_logic;--	   						2.5V, Primary single-ended CLKOUT
--	hsma_clk_in0	 	: in std_logic;--	   							2.5V, Primary single-ended CLKIN
--	hsma_clk_out_p		: out std_logic_vector(2 downto 1);--		LVDS, Primary & Secondary Source-Sync CLKOUT
--	hsma_clk_in_p		: in std_logic_vector(2 downto 1);--		LVDS, Primary & Secondary Source-Sync CLKIN
--	hsma_d				: inout std_logic_vector(3 downto 0);--	2.5V, Dedicated CMOS IO
--	hsma_tx_d_p			: out std_logic_vector(16 downto 0);--		LVDS, LVDS Sounce-Sync Output
--	hsma_rx_d_p			: in std_logic_vector(16 downto 0);--		LVDS, LVDS Sounce-Sync Input

-- HSMC-Port-A / santaluz -- 107 pins
-- leds
   hsma_sl_stat_led    : out   std_logic_vector(7 downto 0); -- User LEDs
   hsma_sl_rx_led      : out   std_logic_vector(7 downto 0); -- User LEDs
   hsma_sl_tx_led      : out   std_logic_vector(7 downto 0); -- User LEDs
-- slow control (TODO)
   hsma_sl_tx_disable  : out   std_logic_vector(7 downto 0);
   hsma_sl_rate_sel    : out   std_logic_vector(7 downto 0); -- sfp+ have two modes
   hsma_sl_sfp_present : in    std_logic_vector(7 downto 0); -- detect hardware
   hsma_sl_sfp_scl     : out   std_logic_vector(7 downto 0); -- slow control clock
   hsma_sl_sfp_sda     : inout std_logic_vector(7 downto 0); -- slow control signal 
   hsma_sl_rx_loss     : in    std_logic_vector(7 downto 0); -- hardware signal loss
   hsma_sl_tx_fault : in std_logic_vector(7 downto 0); -- ... fault
--  sma_sl_ : out std_logic_vector(7 downto 0);



--	
--	--DDR3 x32 Devices Interface
--	--IO: 70
--	ddr3top_ck_p		: out std_logic;--								DIFFERENTIAL 1.5-V SSTL CLASS I, Diff Clock - Pos
	ddr3top_ck_n		: out std_logic;--								DIFFERENTIAL 1.5-V SSTL CLASS I, Diff Clock - Neg
--	ddr3top_dq			: inout std_logic_vector(31 downto 0);--	SSTL-15 CLASS I, Data Bus
--	ddr3top_dqs_p		: inout std_logic_vector(3 downto 0);--	DIFFERENTIAL 1.5-V SSTL CLASS I, Diff Data Strobe - Pos
--	ddr3top_dqs_n		: inout std_logic_vector(3 downto 0);--	DIFFERENTIAL 1.5-V SSTL CLASS I, Diff Data Strobe - Neg
--	ddr3top_dm			: out std_logic_vector(3 downto 0);--		SSTL-15 CLASS I, Data Write Mask
--	ddr3top_a			: out std_logic_vector(12 downto 0);--		SSTL-15 CLASS I, Address
--	ddr3top_ba			: out std_logic_vecto							SSTL-15 CLASS I, Column Address Strobe
--	ddr3top_rasn		: out std_logic;--r(2 downto 0);--		SSTL-15 CLASS I, Bank Address
--	ddr3top_casn		: out std_logic;--									SSTL-15 CLASS I, Row Address Strobe
--	ddr3top_cke			: out std_logic;--								SSTL-15 CLASS I, Clock Enable
--	ddr3top_csn			: out std_logic;--								SSTL-15 CLASS I, Chip Select
--	ddr3top_odt			: out std_logic;--								SSTL-15 CLASS I, On-Die Termination Enable
--	ddr3top_wen			: out std_logic;--								SSTL-15 CLASS I, Write Enable
--	ddr3top_rstn		: out std_logic;--								1.5V, Reset
--	ddr3top_oct_rzq		: in std_logic;--								1.5V, OCT Pin for SSTL-15	
--
--	--Ethernet PHY interface
--	--IO: 20
--	enet_intn			: in std_logic;--								2.5V, MDIO Interrupt
--	enet_resetn			: out std_logic;--							2.5V, MDIO Interrupt
--	enet_mdio			: out std_logic;--							2.5V, MDIO Data
--	enet_mdc				: out std_logic;--							2.5V, MDIO Clock
--	--SGMII
--	enet_tx_p			: out std_logic;--							LVDS, SGMII Transmit Data
--	enet_rx_p			: in std_logic;--								LVDS, SGMII Receive Data
--	--RGMII
--	enet_tx_d			: out std_logic_vector(3 downto 0);--	2.5V, RGMII Transmit Data
--	enet_rx_d			: in std_logic_vector(3 downto 0);--	2.5V, RGMII Receive Data
--	enet_gtx_clk		: out std_logic;--							2.5V, RGMII Transmit Clock
--	enet_tx_en			: out std_logic;--							2.5V, RGMII Transmit Enable
--	enet_rx_clk			: in std_logic;--								2.5V, RGMII Receive Clock
--	enet_rx_dv			: in std_logic;--								2.5V, RGMII Receive Data Valid
--	
--	--Flash & SSRAM Interface
--	--IO: 86
--	fsm_a				: out std_logic_vector(26 downto 0);--		2.5V, Address
--	fsm_d				: inout std_logic_vector(31 downto 0);--	2.5V, Data	
--	flash_oen		: out std_logic;--								2.5V, Flash Output Enable
--	flash_wen		: out std_logic;--								2.5V, Flash Write Enable
--	flash_cen		: out std_logic_vector(1 downto 0);--		2.5V, Flash Chip Enable
--	flash_clk		: out std_logic;--								2.5V, Flash Clock 
--	flash_resetn	: out std_logic;--								2.5V, Flash Reset
--	flash_advn		: out std_logic;--								2.5V, Flash Address Valid 
--	flash_rdybsyn	: in std_logic_vector(1 downto 0);--		2.5V, Flash Ready/Busy
--	
--	sram_clk			: out std_logic;--							2.5V, SRAM Clock
--	sram_oen			: out std_logic;--							2.5V, SRAM Output Enable
--	sram_cen			: out std_logic;--							2.5V, SRAM Chip Enable
--	sram_bwen		: out std_logic;--							2.5V, SRAM Byte Write Enable
--	sram_bwn			: out std_logic_vector(3 downto 0);--	2.5V, SRAM Byte Write Per Byte
--	sram_adscn		: out std_logic;--							2.5V, SRAM Address Strobe Cntrl				
--	sram_gwn			: out std_logic;--							2.5V, SRAM Global Write Enable 
--	sram_zz			: out std_logic;--							2.5V, SRAM Sleep
--	sram_advn		: out std_logic;--							2.5V, SRAM Address Valid
--	sram_adspn		: out std_logic;--							2.5V, SRAM Address Strobe Proc
--	sram_mode		: out std_logic;--							2.5V, SRAM Burst Sequence Selection
--	sram_dqp			: out std_logic_vector(3 downto 0);--	2.5V, SRAM Parity Bits
--	
--	--MAX V Interface
--	--IO: 10
--	max5_clk			: out std_logic;--							2.5V, Max V Clk
--	max5_csn			: out std_logic;--							2.5V, Max V Chip Select
--	max5_ben			: out std_logic_vector(3 downto 0);--	2.5V, Max V Byte Enable Per Byte
--	max5_wen			: out std_logic;--							2.5V, Max V Write Enable
--	max5_oen			: out std_logic;--							2.5V, Max V Output Enable
--	int_tsd_sda		: inout std_logic;--							2.5V, Reserved for internal TSD I2C communication
--	int_tsd_scl		: in std_logic;--								2.5V, Reserved for Internal TSD I2C communication
--	
--	--USB Blaster II
--	--IO: 20
--	usb_clk				: in std_logic;--								2.5V, From Cypress USB PHY
--	usb_data				: out std_logic_vector(7 downto 0);--	2.5V, From MAXII
--	usb_addr				: out std_logic_vector(1 downto 0);--	2.5V, From MAXII
--	usb_scl				: inout std_logic;--							2.5V, From MAXII
--	usb_sda				: out std_logic;--							2.5V, From MAXII
--	usb_resetn			: out std_logic;--							2.5V, From MAXII
--	usb_oen				: out std_logic;--							2.5V, From MAXII
--	usb_rdn				: out std_logic;--							2.5V, From MAXII
--	usb_wrn				: out std_logic;--							2.5V, From MAXII
--	usb_full				: out std_logic;--							2.5V, From MAXII
--	usb_empty			: out std_logic;--							2.5V, From MAXII
--	fx2_resetn			: in std_logic;--								2.5V, From Cypress USB PHY
--	
--
	--LCD character
	--IO: 11
	lcd_data			: inout std_logic_vector(7 downto 0);--	2.5V, LCD Data
	lcd_csn			: out std_logic;--								2.5V, LCD Chip Select
	lcd_d_cn			: out std_logic;--								2.5V, LCD Data / Command Select
	lcd_wen			: out std_logic;--								2.5V, LCD Write Enable
--	
--	--user LED
--	--IO: 6
	user_led				: out std_logic_vector(3 downto 0);--	2.5V, Green User LEDs
--	hsma_tx_led			: out std_logic;--							2.5V, User LED - Labeled HSMA TX 
--	hsma_rx_led			: out std_logic;--							2.5V, User LED - Labeled HSMA RX
--	
--	--user DIP 
--	--IO: 4
	user_dipsw			: in std_logic_vector(3 downto 0);--	2.5V, User DIP Switches
--	
--	--user PB
--	--IO: 3
	user_pb				: in std_logic_vector(2 downto 0)--	2.5V, User Pushbuttons
--		
--	--Miscellaneous
--	--IO: 2
--	cpu_resetn			: in std_logic;--								2.5V, CPU Reset Pushbutton, comment out if dev_clrn function is set 
--	overtemp_fpga		: out std_logic --							2.5V, Reserved for internal TSD communication
	
	);
end entity;




----------------------------------------
------------ Architecture --------------
----------------------------------------

architecture rtl of AriaV_blinky is

---------- Component declaration ------------------------
subtype LCD_display_string is string(1 to 20);
	Component lcd
		Port(
		clk : in std_logic;
		lcd_rw : out std_logic;
		lcd_e : out std_logic;
		lcd_rs : out std_logic;
		data : out std_logic_vector(7 downto 0);
		lcd_msg : in std_logic_vector(39 downto 0)
		--testing :in LCD_display_string
		); 
		
	END Component;

	component debouncer is
	port(
		clk:			in std_logic;
		din:			in std_logic;
		dout:			out std_logic
		);		
   end component debouncer;
	
	component linear_shift is 
	generic (
		G_M             : integer           := 7;
		G_POLY          : std_logic_vector  := "1100000" -- x^7+x^6+1 
	);
	port (
		i_clk           : in  std_logic;
		reset_n         : in  std_logic;
		i_sync_reset    : in  std_logic;
		i_seed          : in  std_logic_vector (G_M-1 downto 0);
		i_en            : in  std_logic;
		o_lsfr          : out std_logic_vector (G_M-1 downto 0)
	);
end component linear_shift;
	
	
	component blinker is
	generic(
	  Clk_Ratio : integer := 100
	);
	port(
	  Clk	: in  std_logic;
     Reset		: in  std_logic; -- here asynchronous reset
     Enable		: in  std_logic; -- enable
     Blinker_out	: out  std_logic
	);
	end component blinker;
	
  component new_reset_controller is
		port (
		clock              : in  std_logic                    := '0';             --              clock.clk
		reset              : in  std_logic                    := '0';             --              reset.reset
		pll_powerdown      : out std_logic_vector(1 downto 0);                    --      pll_powerdown.pll_powerdown
		tx_analogreset     : out std_logic_vector(1 downto 0);                    --     tx_analogreset.tx_analogreset
		tx_digitalreset    : out std_logic_vector(1 downto 0);                    --    tx_digitalreset.tx_digitalreset
		tx_ready           : out std_logic_vector(1 downto 0);                    --           tx_ready.tx_ready
		pll_locked         : in  std_logic_vector(1 downto 0) := (others => '0'); --         pll_locked.pll_locked
		pll_select         : in  std_logic_vector(0 downto 0) := (others => '0'); --         pll_select.pll_select
		tx_cal_busy        : in  std_logic_vector(1 downto 0) := (others => '0'); --        tx_cal_busy.tx_cal_busy
		rx_analogreset     : out std_logic_vector(1 downto 0);                    --     rx_analogreset.rx_analogreset
		rx_digitalreset    : out std_logic_vector(1 downto 0);                    --    rx_digitalreset.rx_digitalreset
		rx_ready           : out std_logic_vector(1 downto 0);                    --           rx_ready.rx_ready
		rx_is_lockedtodata : in  std_logic_vector(1 downto 0) := (others => '0'); -- rx_is_lockedtodata.rx_is_lockedtodata
		rx_cal_busy        : in  std_logic_vector(1 downto 0) := (others => '0')  --        rx_cal_busy.rx_cal_busy
		);
	end component new_reset_controller;
	

	component txrx is
		port (
		pll_powerdown           : in  std_logic_vector(1 downto 0)   := (others => '0'); --           pll_powerdown.pll_powerdown
		tx_analogreset          : in  std_logic_vector(1 downto 0)   := (others => '0'); --          tx_analogreset.tx_analogreset
		tx_digitalreset         : in  std_logic_vector(1 downto 0)   := (others => '0'); --         tx_digitalreset.tx_digitalreset
		tx_pll_refclk           : in  std_logic_vector(0 downto 0)   := (others => '0'); --           tx_pll_refclk.tx_pll_refclk
		tx_serial_data          : out std_logic_vector(1 downto 0);                      --          tx_serial_data.tx_serial_data
		pll_locked              : out std_logic_vector(1 downto 0);                      --              pll_locked.pll_locked
		rx_analogreset          : in  std_logic_vector(1 downto 0)   := (others => '0'); --          rx_analogreset.rx_analogreset
		rx_digitalreset         : in  std_logic_vector(1 downto 0)   := (others => '0'); --         rx_digitalreset.rx_digitalreset
		rx_cdr_refclk           : in  std_logic_vector(0 downto 0)   := (others => '0'); --           rx_cdr_refclk.rx_cdr_refclk
		rx_serial_data          : in  std_logic_vector(1 downto 0)   := (others => '0'); --          rx_serial_data.rx_serial_data
		rx_is_lockedtoref       : out std_logic_vector(1 downto 0);                      --       rx_is_lockedtoref.rx_is_lockedtoref
		rx_is_lockedtodata      : out std_logic_vector(1 downto 0);                      --      rx_is_lockedtodata.rx_is_lockedtodata
		--rx_seriallpbken         : in  std_logic_vector(1 downto 0)   := (others => '0'); --         rx_seriallpbken.rx_seriallpbken
		tx_std_coreclkin        : in  std_logic_vector(1 downto 0)   := (others => '0'); --        tx_std_coreclkin.tx_std_coreclkin
		rx_std_coreclkin        : in  std_logic_vector(1 downto 0)   := (others => '0'); --        rx_std_coreclkin.rx_std_coreclkin
		tx_std_clkout           : out std_logic_vector(1 downto 0);                      --           tx_std_clkout.tx_std_clkout
		rx_std_clkout           : out std_logic_vector(1 downto 0);                      --           rx_std_clkout.rx_std_clkout
		rx_std_bitslip          : in  std_logic_vector(1 downto 0)   := (others => '0'); --          rx_std_bitslip.rx_std_bitslip
		tx_cal_busy             : out std_logic_vector(1 downto 0);                      --             tx_cal_busy.tx_cal_busy
		rx_cal_busy             : out std_logic_vector(1 downto 0);                      --             rx_cal_busy.rx_cal_busy
		reconfig_to_xcvr        : in  std_logic_vector(279 downto 0) := (others => '0'); --        reconfig_to_xcvr.reconfig_to_xcvr
		reconfig_from_xcvr      : out std_logic_vector(183 downto 0);                    --      reconfig_from_xcvr.reconfig_from_xcvr
		tx_parallel_data        : in  std_logic_vector(31 downto 0)  := (others => '0'); --        tx_parallel_data.tx_parallel_data
		tx_datak                : in  std_logic_vector(3 downto 0)   := (others => '0'); --                tx_datak.tx_datak
		unused_tx_parallel_data : in  std_logic_vector(51 downto 0)  := (others => '0'); -- unused_tx_parallel_data.unused_tx_parallel_data
		rx_parallel_data        : out std_logic_vector(31 downto 0);                     --        rx_parallel_data.rx_parallel_data
		rx_datak                : out std_logic_vector(3 downto 0);                      --                rx_datak.rx_datak
		rx_errdetect            : out std_logic_vector(3 downto 0);                      --            rx_errdetect.rx_errdetect
		rx_disperr              : out std_logic_vector(3 downto 0);                      --              rx_disperr.rx_disperr
		rx_runningdisp          : out std_logic_vector(3 downto 0);                      --          rx_runningdisp.rx_runningdisp
		rx_patterndetect        : out std_logic_vector(3 downto 0);                      --        rx_patterndetect.rx_patterndetect
		rx_syncstatus           : out std_logic_vector(3 downto 0);                      --           rx_syncstatus.rx_syncstatus
		unused_rx_parallel_data : out std_logic_vector(71 downto 0)                      -- unused_rx_parallel_data.unused_rx_parallel_data
		
		
		);
	end component txrx;
--For every rising edge of the rx_bitslip signal, the word boundary is shifted by 1 bit.  

	component new_reconfig_transceiver is
		port (
			
		reconfig_busy             : out std_logic;                                         --      reconfig_busy.reconfig_busy
		mgmt_clk_clk              : in  std_logic                      := '0';             --       mgmt_clk_clk.clk
		mgmt_rst_reset            : in  std_logic                      := '0';             --     mgmt_rst_reset.reset
		reconfig_mgmt_address     : in  std_logic_vector(6 downto 0)   := (others => '0'); --      reconfig_mgmt.address
		reconfig_mgmt_read        : in  std_logic                      := '0';             --                   .read
		reconfig_mgmt_readdata    : out std_logic_vector(31 downto 0);                     --                   .readdata
		reconfig_mgmt_waitrequest : out std_logic;                                         --                   .waitrequest
		reconfig_mgmt_write       : in  std_logic                      := '0';             --                   .write
		reconfig_mgmt_writedata   : in  std_logic_vector(31 downto 0)  := (others => '0'); --                   .writedata
		reconfig_to_xcvr          : out std_logic_vector(279 downto 0);                    --   reconfig_to_xcvr.reconfig_to_xcvr
		reconfig_from_xcvr        : in  std_logic_vector(183 downto 0) := (others => '0')  -- reconfig_from_xcvr.reconfig_from_xcvr
		);
	end component new_reconfig_transceiver;
	
	component counter_test is
	Port (
    i_clock      : in  std_logic;
    i_enable     : in  std_logic;
    i_switch_1   : in  std_logic;
    i_switch_2   : in  std_logic;
    o_led_drive  : out std_logic
		);
	end component;
	
	component ip_pll_1hz is
	port(
		refclk     : in  std_logic;
		rst     	  : in  std_logic;
		outclk_0   : out  std_logic;
		locked     : out  std_logic
	);
	end component;

	component next_reg is 
	generic (
		G_M             : integer           := 7;
		G_POLY          : std_logic_vector  := "1100000" -- x^7+x^6+1 
	);
	port (
		i_seed          : in  std_logic_vector (G_M-1 downto 0);
		o_lsfr          : out std_logic_vector (G_M-1 downto 0)
	);
	end component next_reg;
	
	component ip_fifo is
	port (
		data : in std_logic_vector (6 downto 0);
		wrreq : in std_logic;
		rdreq : in std_logic;
		clk : in std_logic;
		q : out std_logic_vector (6 downto 0);
		full : out std_logic;
		empty : out std_logic;
		usedw : out std_logic_vector (4 downto 0)
	);
	end component;
	
------------------ Signal declaration ------------------------
  
  -- external connections
  signal clk : std_logic;
  signal xcvr_ref_clk : std_logic;	 
  
  signal reset : std_logic;
  signal sl_test_enable : std_logic;
  signal blinker_signal : std_logic;

  signal push_button0_db : std_logic;
  signal push_button1_db : std_logic;
  signal push_button2_db : std_logic;
  
  -- tranciever/reset ip signals
  signal pll_powerdown : std_logic_vector(1 downto 0);
  signal tx_analogreset : std_logic_vector(1 downto 0);
  signal tx_digitalreset : std_logic_vector(1 downto 0);
  signal tx_ready : std_logic_vector(1 downto 0);
  signal pll_locked : std_logic_vector(1 downto 0);
  signal pll_locked_vector : std_logic_vector(1 downto 0);
  signal tx_cal_busy : std_logic_vector(1 downto 0);
  signal rx_analogreset : std_logic_vector(1 downto 0);
  signal rx_digitalreset : std_logic_vector(1 downto 0);
  signal rx_ready : std_logic_vector(1 downto 0);
  signal rx_is_lockedtodata : std_logic_vector(1 downto 0);
  signal rx_is_lockedtoref : std_logic_vector(1 downto 0);
  signal rx_cal_busy : std_logic_vector(1 downto 0);
  
  signal tx_parallel_data : std_logic_vector(31 downto 0);
  signal rx_parallel_data_raw : std_logic_vector(31 downto 0);
  
  signal tx_clk : std_logic_vector(1 downto 0);
  signal rx_clk : std_logic_vector(1 downto 0);
  signal tx_std_coreclkin : std_logic_vector(1 downto 0);
  signal rx_std_coreclkin : std_logic_vector(1 downto 0);
  signal rx_bitslip : std_logic_vector(1 downto 0);
  signal rx_serial_loopback_enable : std_logic_vector(1 downto 0);
  
  signal tx_datak : std_logic_vector(3 downto 0);
  signal rx_datak : std_logic_vector(3 downto 0);
  
  signal	rx_patterndetect        :  std_logic_vector(3 downto 0);                      --        rx_patterndetect.rx_patterndetect
  signal 	rx_syncstatus           : std_logic_vector(3 downto 0);    
  
  signal rx_errdetect : std_logic_vector(3 downto 0);
  signal rx_disperr : std_logic_vector(3 downto 0);
  
  signal reconfig_to_xcvr : std_logic_vector(279 downto 0);
  signal reconfig_from_xcvr : std_logic_vector(183 downto 0);  
  signal reconfig_busy : std_logic;
  
  
  --- data processing signals
  signal counter : std_logic_vector(31 downto 0) := (others => '0');
  
  --- counter data
  signal data_en_counter : std_logic;
  signal data_out 	: 	std_logic_vector (15 downto 0);

  --clk slow down
  signal  clk_2Hz   : std_logic;
  signal prescaler : unsigned(23 downto 0);
  
  --lcd
  --signal message : string;
  signal msg_bits :std_logic_vector(39 downto 0);
  constant LCD_display_len : positive:=20;
  signal LCD_display : LCD_display_string:=(others =>' ');
  
  --- linear shift reg ---
  signal old_shift : std_logic_vector(4 downto 0) := "10101";
  signal led_shift : std_logic_vector(4 downto 0);
  signal shifts : std_logic_vector(20 downto 0);
  signal shift_counter : std_logic_vector(1 downto 0);
  signal en_shift : std_logic;
  signal oneHz : std_logic;
  signal fifo_empty0 : std_logic;
  signal fifo_data0 : std_logic_vector(6 downto 0);
  
  signal n_0 : std_logic_vector(4 downto 0);
  signal n_1 : std_logic_vector(4 downto 0);
  
  	signal r_lfsr : std_logic_vector (5 downto 1);
	signal w_poly : std_logic_vector (5 downto 1);
	signal w_mask : std_logic_vector (5 downto 1);

----------------------------------------
------------ Begin top level------------
----------------------------------------
  
begin

--------- external input connections -----------
  clk <= clkin_50_top;
  xcvr_ref_clk <= refclk2_qr1_p;
  
  
	lcd0 : lcd PORT MAP (
		clk =>clk,
		lcd_rw =>lcd_wen,
		lcd_e=>lcd_csn,
		lcd_rs=>lcd_d_cn,
		data=>lcd_data,
		lcd_msg=>msg_bits
		--testing=>LCD_display
	);
	


	
  deb1 : debouncer port map(
    clk => clk,
    din => user_pb(0),
	 dout => push_button0_db
  );
  
  deb2 : debouncer port map(
    clk => clk,
    din => user_pb(1),
	 dout => push_button1_db
  );
  
  deb3 : debouncer port map(
    clk => clk,
    din => user_pb(2),
	 dout => push_button2_db
  );
	
  reset <= not push_button0_db;
  --reset <= not push_button1_db;
  --reset <= not push_button2_db;
  
  	counttest:counter_test
	Port map(
		i_clock 			=> 	clk,
		i_enable			=> 	push_button0_db,
		i_switch_1		=>	 	push_button1_db,
		i_switch_2 		=> 	not push_button2_db,
		o_led_drive		=> 	data_en_counter
	);
 
  
  --sl_test_enable <= not push_button1_db;  
  --user_led(0) <= data_en_counter;
  --user_led(1) <= tx_ready(0);
  --user_led(2) <= rx_cal_busy(0);
  --user_led(3) <= tx_cal_busy(0);
  sl_test_enable <= not push_button1_db;  
  user_led(0) <= push_button0_db;
  user_led(1) <= tx_ready(0);
  user_led(2) <= rx_cal_busy(0);
  user_led(3) <= tx_cal_busy(0);
  

  --transceiver stat leds
  hsma_sl_stat_led(0) <= n_0(2);
  hsma_sl_rx_led(0) <= n_0(1);
  hsma_sl_tx_led(0) <= n_0(0);
  
  --hsma_sl_stat_led(1) <= next_shift(5);
  hsma_sl_rx_led(1) <= n_0(4);
  hsma_sl_tx_led(1) <= n_0(3);
  
  hsma_sl_stat_led(2) <= '1';
  hsma_sl_rx_led(2) <= '1';
  --hsma_sl_tx_led(2) <= next_shift(6);
  
  hsma_sl_stat_led(3) <= '1';
  hsma_sl_stat_led(4) <= '1';
  hsma_sl_stat_led(5) <= '1';
    
  hsma_sl_rx_led(3) <= '1';
  hsma_sl_rx_led(4) <= '1';
  hsma_sl_rx_led(5) <= '1';
    
  hsma_sl_tx_led(3) <= '1';
  hsma_sl_tx_led(4) <= en_shift;
  hsma_sl_tx_led(5) <= '1';
  
  	
	pll : component ip_pll_1hz
	port map (
		refclk     => xcvr_ref_clk,
		rst     	  => not push_button2_db,
		outclk_0   => oneHz,
		locked     => open
	);
  
  shift : component linear_shift
	generic map (
		G_M    => 5,
		G_POLY => "10100" -- x^7+x^6+1 
	)
	port map (
		i_clk        => xcvr_ref_clk,
		reset_n      => push_button2_db,
		i_sync_reset => not push_button1_db,
		i_seed       => "00100",
		i_en         => push_button0_db,
		o_lsfr       => n_0
	);

--	next_r : component next_reg
--	generic map (
--		G_M    => 5,
--		G_POLY => "10100" -- x^7+x^6+1 
--	)
--	port map (
--		i_seed          => old_shift,
--		o_lsfr          => n_1
--	);

  shift2 : component linear_shift
	generic map (
		G_M    => 5,
		G_POLY => "10100" -- x^7+x^6+1 
	)
	port map (
		i_clk        => xcvr_ref_clk,
		reset_n      => push_button2_db,
		i_sync_reset => not push_button1_db,
		i_seed       => old_shift,
		i_en         => push_button0_db,
		o_lsfr       => n_1
	);
	
	clkout_sma <= en_shift;
	
	compare : process (xcvr_ref_clk, push_button0_db)
    begin
		if (not push_button0_db = '1') then
			led_shift <= n_1;
	 	elsif (rising_edge(xcvr_ref_clk)) then
			led_shift <= n_1;
			if (n_0 = n_1) then
				en_shift <= '1';
				old_shift <= n_0;
			else
				en_shift <= '0';
			end if;
		end if;
	end process compare;
	
	  --msg_bits<=to_std_logic_vector("test");
  lcd_process : process (xcvr_ref_clk)
  begin
  if rising_edge(xcvr_ref_clk) then
		msg_bits <= "0011000" & led_shift(4) & "0011000" & led_shift(3) & "0011000" & led_shift(2) & "0011000" & led_shift(1) & "0011000" & led_shift(0);
  end if;
  end process lcd_process;
  
  
  --hsma_sl_rx_led <= ( 0 => rx_is_lockedtoref(0) , 1 => rx_is_lockedtoref(1), others => '0');
  --hsma_sl_tx_led <= (0 => pll_locked(0), 1 => pll_locked(0), 7 => pll_powerdown(0),  6 => rx_analogreset(0), 5 => rx_digitalreset(0), 4 => reconfig_busy, 3 => tx_digitalreset(0), 2 => tx_analogreset(0), others => '0');
  

  ------- wire up (internal) components ------------
  
  blinker1 : blinker generic map ( Clk_Ratio => 10000000 ) 
  port map(
	 Reset => reset,
	 Clk => clk,
	 Enable => '1',
	 Blinker_out => blinker_signal 
  );
  
  
  -------------- tranceiver wire up -----------------  
  
  --pll_locked <= pll_locked_vector(0) and pll_locked_vector(1);
  rx_serial_loopback_enable <= (others => '1');
  --tx_datak <= (others => '0');
  
  reset_tranceiver_1 : new_reset_controller
  port map (
    --clock => clk,											-- clk
	 clock => xcvr_ref_clk,
	 reset => reset,										-- reset
	 pll_powerdown => pll_powerdown,					-- pll_powerdown
	 tx_analogreset => tx_analogreset,				-- tx_analogreset
	 tx_digitalreset => tx_digitalreset,			-- tx_digitalreset
	 tx_ready => tx_ready,								-- tx_ready
	 pll_locked => pll_locked,							-- pll_locked
	 pll_select => (others => '0')       ,							-- pll_select
	 tx_cal_busy => tx_cal_busy,						-- tx_cal_busy
	 rx_analogreset => rx_analogreset,				-- rx_analogreset
	 rx_digitalreset => rx_digitalreset,			-- rx_digitalreset
	 rx_ready => rx_ready,								-- rx_ready
	 rx_is_lockedtodata => rx_is_lockedtodata, 	-- rx_is_lockedtodata
	 rx_cal_busy =>  	rx_cal_busy									-- rx_cal_busy
	 
  );

  	tranceiver_1 : txrx
	port map (
	  pll_powerdown => pll_powerdown,							-- pll_powerdown
	  tx_analogreset => tx_analogreset, 						-- tx_analogreset
	  tx_digitalreset => tx_digitalreset, 						-- tx_digitalreset
	  tx_pll_refclk(0) => xcvr_ref_clk,							-- tx_pll_refclk
	  tx_serial_data => hsma_tx_p(1 downto 0),				-- tx_serial_data
	  --tx_serial_data(0) => hsma_tx_p(1),	
	  --tx_serial_data(1) => hsma_tx_p(0),	
	  pll_locked => pll_locked,									-- pll_locked
	  rx_analogreset => rx_analogreset,							-- rx_analogreset
	  rx_digitalreset => rx_digitalreset,						-- rx_digitalreset clk
	  rx_cdr_refclk(0) => xcvr_ref_clk,								-- rx_cdr_refclk
	  rx_serial_data => hsma_rx_p(1 downto 0),
	  --rx_serial_data(0) => hsma_rx_p(1),				-- rx_serial_data
	  --rx_serial_data(1) => hsma_rx_p(0),
     rx_is_lockedtoref => rx_is_lockedtoref,					-- rx_is_lockedtoref
	  rx_is_lockedtodata => rx_is_lockedtodata,				-- rx_is_lockedtodata
	  --rx_seriallpbken => rx_serial_loopback_enable,			-- rx_seriallpbken
	  
	  tx_std_coreclkin => tx_clk,									-- tx_std_coreclkin
	  rx_std_coreclkin => rx_clk,									-- rx_std_coreclkin
	  tx_std_clkout => tx_clk,										-- tx_std_clkout
	  rx_std_clkout => rx_clk,										-- rx_std_clkout
	  rx_std_bitslip => rx_bitslip,								-- rx_std_bitslip
	  tx_cal_busy => tx_cal_busy,									-- tx_cal_busy
	  rx_cal_busy => rx_cal_busy,									-- rx_cal_busy
     reconfig_to_xcvr => reconfig_to_xcvr,					-- reconfig_to_xcvr
     reconfig_from_xcvr => reconfig_from_xcvr,				-- reconfig_from_xcvr
	  tx_parallel_data => tx_parallel_data,					-- tx_parallel_data
     tx_datak => tx_datak,											-- tx_datak
     unused_tx_parallel_data => (others => 'Z'),			-- unused_tx_parallel_data
	  rx_parallel_data => rx_parallel_data_raw,				-- rx_parallel_data
	  rx_datak => rx_datak,											-- rx_datak
	  rx_errdetect => rx_errdetect,								-- rx_errdetect
     rx_disperr => rx_disperr,									-- rx_disperr
	  rx_runningdisp => open,										-- rx_runningdisp
	  rx_patterndetect  => rx_patterndetect    ,                   --        rx_patterndetect.rx_patterndetect
	  rx_syncstatus    => rx_syncstatus,                           --           rx_syncstatus.rx_syncstatus
     unused_rx_parallel_data => open							-- unused_rx_parallel_data

	
   );
	
	
	
	reconf_controller_1 : new_reconfig_transceiver
	port map (
			reconfig_busy => reconfig_busy,						-- reconfig_busy
			--mgmt_clk_clk => clk,										-- clk
			mgmt_clk_clk => xcvr_ref_clk,
			mgmt_rst_reset => reset,								-- reset
			reconfig_mgmt_address => (others => '0'),			-- address
			reconfig_mgmt_read => '0',								-- read
			reconfig_mgmt_readdata => open,						-- readdata
			reconfig_mgmt_waitrequest => open,					-- waitrequest
			reconfig_mgmt_write  => '0',							-- write
			reconfig_mgmt_writedata => (others => '0'),		-- writedata
			reconfig_to_xcvr => reconfig_to_xcvr,				-- reconfig_to_xcvr
			reconfig_from_xcvr => reconfig_from_xcvr			-- reconfig_from_xcvr
			
		);
		
	
		
	hsma_sl_tx_disable(1 downto 0) <= (others => '0');
	hsma_sl_rate_sel(1 downto 0) <= (others => 'Z'); --taken over from qinhua
		
	hsma_sl_sfp_scl <= (others => 'Z'); --taken over from qinhua
   hsma_sl_sfp_sda <= (others => 'Z'); --taken over from qinhua
	
	--tx_datak <= (others => '0');
	rx_bitslip <= (others => '0');
	
-------------generate data -------------------

  data_gen: process (reset, tx_clk)
    begin	 

	   --reset--
		
      if(rising_edge(Clk) and reset = '1') then
        counter <= (others => '0');
	
		--counting  and changing slow_clock
      elsif rising_edge(Clk) then
		  counter <= counter + 1;
	   end if; --rising edge		
		
    end process;
	 
    tx_parallel_data(31 downto 0) <= counter(7 downto 0) & x"BC" & counter(7 downto 0) & x"BC"  ;
	 tx_datak <= "0101";
    --tx_parallel_data(63 downto 32) <= counter(31 downto 0);
	 
	 
	 --hsma_sl_sfp_scl(6)<=counter(15);
	 hsma_sl_sfp_scl(6)<=rx_parallel_data_raw(25);
	 hsma_sl_sfp_scl(7)<=rx_parallel_data_raw(9);
	 --clkout_sma<=rx_parallel_data_raw(25);
	 --clkout_sma<= rx_syncstatus(2);
	 --reset <= push_button0_db;
	 
	 gen_clk : process (Clk)
  begin  -- process gen_clk
    --if rst = '1' then
    --  clk_2Hz_i   <= '0';
    --  prescaler   <= (others => '0');
    --elsif rising_edge(clk_50Mhz) then   -- rising clock edge
	 if rising_edge(Clk) then 
      if prescaler = X"BEBC20" then     -- 12 500 000 in hex
        prescaler   <= (others => '0');
        clk_2Hz   <= not clk_2Hz;
      else
        prescaler <= prescaler + "1";
      end if;
    end if;
  end process gen_clk;
  


	

	
 -- reset <= not push_button0_db;
 -- reset <= not push_button1_db;
 -- reset <= not push_button2_db;
 -- --sl_test_enable <= not push_button1_db;  
 -- user_led(0) <= push_button0_db;
 -- --user_led(1) <= tx_ready(0);
  ----user_led(2) <= rx_cal_busy(0);
  --user_led(3) <= tx_cal_busy(0);

end rtl;
