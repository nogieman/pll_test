module top (
  input clk,

  input clk_0,
  input clk_1,

  output [255: 0] o_pllBr0_reg,
  output [255: 0] o_pllBr1_reg,

  input           bscan_DRCK,
  input           bscan_RESET,    
  input           bscan_TMS,   
  input           bscan_RUNTEST,    
  input           bscan_SEL,    
  input           bscan_SHIFT,    
  input           bscan_TDI,    
  input           bscan_CAPTURE,    
  input           bscan_TCK,    
  input           bscan_UPDATE,    
  output          bscan_TDO
);

  reg [255: 0] r_counter_0;
  reg [255: 0] r_counter_1;
  wire i_reg_rstn; 
  test_counter test_module (
    .clk_0          (clk_0),
    .clk_1          (clk_1),
    .i_reg_rstn     (i_reg_rstn),
    .o_counter_0    (o_pllBr0_reg),
    .o_counter_1    (o_pllBr1_reg)
  );

  edb_top debug_inst (
    .bscan_CAPTURE      ( bscan_CAPTURE ),
    .bscan_DRCK         ( bscan_DRCK ),
    .bscan_RESET        ( bscan_RESET ),
    .bscan_RUNTEST      ( bscan_RUNTEST ),
    .bscan_SEL          ( bscan_SEL ),
    .bscan_SHIFT        ( bscan_SHIFT ),
    .bscan_TCK          ( bscan_TCK ),
    .bscan_TDI          ( bscan_TDI ),
    .bscan_TMS          ( bscan_TMS ),
    .bscan_UPDATE       ( bscan_UPDATE ),
    .bscan_TDO          ( bscan_TDO ),
    .vio0_clk           ( clk_0 ),
    .vio0_reg0          ( o_pllBr0_reg ), 
    .vio0_reg1          ( o_pllBr1_reg ),
    .vio0_reset_reg     (i_reg_rstn )
  );



endmodule
