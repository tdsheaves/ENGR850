module SV_Types();

	bit 	   single_bit_unsigned;
	bit [15:0] two_byte_unsigned;

	byte single_signed_byte;

	initial begin

		single_bit_unsigned = 1'b1;
		two_byte_unsigned   = 16'hffff;
		single_signed_byte  = -127;
		#1;
		$display(  "  bit Value: %b\
				  \n2byte Value: %h\
				  \n1byte Value: %d",
				   single_bit_unsigned,
				   two_byte_unsigned,
				   single_signed_byte);

	end

	//Extra

endmodule : SV_Types