`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: COLLEGE OF VLSI
// Engineer: ABHISHEK KUMAR KUSHWAHA
// 
// Create Date: 15.11.2023 12:34:40
// Design Name: 
// Module Name: top
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module top(

		input clk,

		input rst_n,

		input [3:0] REQ,

		output reg [3:0] GNT

		);

	reg [2:0] present_state;

	reg [2:0] next_state;

	parameter [2:0] IDLE = 3'b000;

	parameter [2:0] S0   = 3'b001;

	parameter [2:0] S1   = 3'b010;

	parameter [2:0] S2   = 3'b011;

	parameter [2:0] S3   = 3'b100;




  always @ (posedge clk or negedge rst_n) // State Register , Sequential always block
	
		begin

          if(!rst_n)

				present_state <= IDLE;

			else

				present_state <= next_state;

		end

  always @(*) // Next State , Combinational always block

		begin

			case(present_state)

				IDLE : begin
	
							if(REQ[0])

								begin

									next_state = S0;

								end

							else if(REQ[1])

								begin

									next_state = S1;

								end

							else if(REQ[2])

								begin

                                    next_state = S2;

								end

							else if(REQ[3])

								begin

									next_state = S3;

								end

							else

								begin

									next_state = IDLE;

								end

						end // IDLE

				S0 : begin

							if(REQ[1])
	
								begin
	
									next_state = S1;

								end

							else if(REQ[2])

								begin

									next_state = S2;

								end

							else if(REQ[3])

								begin

									next_state = S3;

								end

							else if(REQ[0])

								begin

									next_state = S0;

								end

							else

								begin

									next_state = IDLE;

								end

						end // S0

				S1 : begin

							if(REQ[2])

								begin
		
									next_state = S2;

								end

							else if(REQ[3])

								begin

									next_state = S3;

								end

                            else if(REQ[0])

								begin

									next_state = S0;

								end

							else if(REQ[1])

								begin

									next_state = S1;

								end

							else

								begin

									next_state = IDLE;

								end

						end //S1

				S2 : begin

							if(REQ[3])

								begin

									next_state = S3;

								end

							else if(REQ[0])

								begin

									next_state = S0;

								end

							else if(REQ[1])

								begin

									next_state = S1;

								end

							else if(REQ[2])

								begin

									next_state = S2;

								end

							else
		
								begin

									next_state = IDLE;

								end

						end // S2

				S3 : begin

							if(REQ[0])

                                  begin

									next_state = S0;

								 end

							else if(REQ[1])

								begin

									next_state = S1;

								end

							else if(REQ[2])

							    begin

									next_state = S2;

								end

							else if(REQ[3])

								begin

									next_state = S3;

							 	end

							else

								begin

									next_state = IDLE;

								end

						end // S3

				default : begin

							if(REQ[0])

								begin

									next_state = S0;

								end

							else if(REQ[1])

								begin

									next_state = S1;

								end

							else if(REQ[2])

								begin

									next_state = S2;

								end

							else if(REQ[3])

								begin

									next_state = S3;

								end

							else

								begin

									next_state = IDLE;

								end

						end // default

			endcase // case(state)

	 end



  always @(*) // Output , Combinational always block

		begin
		
          case(present_state)

				S0 : begin GNT = 4'b0001; end

				S1 : begin GNT = 4'b0010; end

				S2 : begin GNT = 4'b0100; end

				S3 : begin GNT = 4'b1000; end

			default : begin GNT = 4'b0000; end

		  endcase

		end

endmodule // Round Robin Arbiter with Fixed Time Slice
