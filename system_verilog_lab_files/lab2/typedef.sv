module newtype();
typedef struct
pixel_s  my_pixel;
$display(my_pixel);
typedef enum {INIT, DEC, IDLE} fsms;
fsms ps, ns;
initial begin
case (ps)
IDLE: ns=INIT;
INIT: ns=DEC;
default: ns=IDLE;
endcase
$display (ns.name);
end
endmodule