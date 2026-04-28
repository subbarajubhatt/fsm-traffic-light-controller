module traffic_light_fsm_tb;

logic clk;
logic reset;
logic red;
logic yellow;
logic green;

traffic_light_fsm dut (
    .clk(clk),
    .reset(reset),
    .red(red),
    .yellow(yellow),
    .green(green)
);

always #5 clk = ~clk;

initial begin
    $dumpfile("dump.vcd");
    $dumpvars(0, traffic_light_fsm_tb);

    clk = 0;
    reset = 1;

    #10 reset = 0;

    #10 $display("State: RED=%0b GREEN=%0b YELLOW=%0b", red, green, yellow);
    #10 $display("State: RED=%0b GREEN=%0b YELLOW=%0b", red, green, yellow);
    #10 $display("State: RED=%0b GREEN=%0b YELLOW=%0b", red, green, yellow);
    #10 $display("State: RED=%0b GREEN=%0b YELLOW=%0b", red, green, yellow);
    #10 $display("State: RED=%0b GREEN=%0b YELLOW=%0b", red, green, yellow);

    $display("FSM verification completed.");
    $finish;
end

endmodule
