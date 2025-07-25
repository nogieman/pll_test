
// Efinity Top-level template
// Version: 2025.1.110.2.15
// Date: 2025-07-25 18:42

// Copyright (C) 2013 - 2025 Efinix Inc. All rights reserved.

// This file may be used as a starting point for Efinity synthesis top-level target.
// The port list here matches what is expected by Efinity constraint files generated
// by the Efinity Interface Designer.

// To use this:
//     #1)  Save this file with a different name to a different directory, where source files are kept.
//              Example: you may wish to save as testing_PLLs.v
//     #2)  Add the newly saved file into Efinity project as design file
//     #3)  Edit the top level entity in Efinity project to:  testing_PLLs
//     #4)  Insert design content.


module testing_PLLs
(
  (* syn_peri_port = 0 *) input clk_0_,
  (* syn_peri_port = 0 *) input clk_1_,
  (* syn_peri_port = 0 *) input clk__,
  (* syn_peri_port = 0 *) input clk_1,
  (* syn_peri_port = 0 *) input clk_0,
  (* syn_peri_port = 0 *) input clk,
  (* syn_peri_port = 0 *) input bscan_CAPTURE,
  (* syn_peri_port = 0 *) input bscan_DRCK,
  (* syn_peri_port = 0 *) input bscan_RESET,
  (* syn_peri_port = 0 *) input bscan_RUNTEST,
  (* syn_peri_port = 0 *) input bscan_SEL,
  (* syn_peri_port = 0 *) input bscan_SHIFT,
  (* syn_peri_port = 0 *) input bscan_TCK,
  (* syn_peri_port = 0 *) input bscan_TDI,
  (* syn_peri_port = 0 *) input bscan_TMS,
  (* syn_peri_port = 0 *) input bscan_UPDATE,
  (* syn_peri_port = 0 *) output bscan_TDO
);


endmodule

