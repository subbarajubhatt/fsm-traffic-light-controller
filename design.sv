module traffic_light_fsm (
    input  logic clk,
    input  logic reset,
    output logic red,
    output logic yellow,
    output logic green
);

typedef enum logic [1:0] {
    RED_STATE    = 2'b00,
    GREEN_STATE  = 2'b01,
    YELLOW_STATE = 2'b10
} state_t;

state_t current_state, next_state;

always_ff @(posedge clk or posedge reset) begin
    if (reset)
        current_state <= RED_STATE;
    else
        current_state <= next_state;
end

always_comb begin
    case (current_state)
        RED_STATE:    next_state = GREEN_STATE;
        GREEN_STATE:  next_state = YELLOW_STATE;
        YELLOW_STATE: next_state = RED_STATE;
        default:      next_state = RED_STATE;
    endcase
end

always_comb begin
    red = 0;
    yellow = 0;
    green = 0;

    case (current_state)
        RED_STATE:    red = 1;
        GREEN_STATE:  green = 1;
        YELLOW_STATE: yellow = 1;
        default:      red = 1;
    endcase
end

endmodule
