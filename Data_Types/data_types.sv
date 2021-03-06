module SV_Types();

	bit 	   single_bit_unsigned;
	bit [15:0] two_byte_unsigned;

	byte single_signed_byte;

	initial begin

		single_bit_unsigned = 1'b1;
		two_byte_unsigned   = 16'hffff;
		single_signed_byte  = -127;
		#1;
		$display(  "  bit Value: %0b => %0b\
				  \n2byte Value: %0h => %0b\
				  \n1byte Value: %0d => %0b",
				   single_bit_unsigned, single_bit_unsigned, 
				   two_byte_unsigned, two_byte_unsigned,
				   single_signed_byte, single_signed_byte);

	end

	//Extra stuff

endmodule : SV_Types