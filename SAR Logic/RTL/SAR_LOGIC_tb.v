`define HIGH 1'b1
`define LOW 1'b0
`define BIT_ADC 4'd8

module SAR_LOGIC_tb;
    reg CLK = 1'b0;
    reg COMP_OUT = 1'b1;
    reg XRST = 1'b1;
    reg VDD = 1'b1;
    reg VSS = 1'b0;
    wire DIGITAL_OUT;
    wire COMP_CLK;
    wire SC;
    wire [`BIT_ADC:0] SDAC;

    initial begin
        $dumpfile("wave_SAR_Logic.vcd");
        $dumpvars(0, DUT);
    end

    always #2 begin
        CLK <= ~CLK;
    end

    SAR_LOGIC DUT (
        .COMP_OUT (COMP_OUT), 
        .DIGITAL_OUT (DIGITAL_OUT), 
        .COMP_CLK (COMP_CLK), 
        .SC (SC), 
        .SDAC (SDAC), 
        .CLK (CLK), 
        .XRST (XRST), 
        .VDD (VDD), 
        .VSS (VSS)
    );

    initial begin
        #2
        XRST = 1'b0;
        #3
        XRST = 1'b1;

        #43
        COMP_OUT = 0;
        #400
        $finish;
    end
endmodule