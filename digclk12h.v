module digclk12h(
    input clk,
    input reset,
    input ena,
    output reg pm,
    output reg[7:0] hh,
    output reg[7:0] mm,
    output reg[7:0] ss); 
//seconds
    always@(posedge clk) begin
        if(reset == 1)
            ss <= 8'h00;
        else if(ena)begin
            if(ss[3:0] != 4'd9)
                ss[3:0] <= ss[3:0] +1;
            else begin
                ss[3:0] <= 4'd0;
                if(ss[7:4] != 4'd5)
                    ss[7:4] <= ss[7:4] +1;
                else
                    ss[7:4] <= 4'd0;
            end
        end
    end
    
//minutes
    always@(posedge clk)begin
        if(reset == 1)
            mm <= 8'h00;
        else if(ena && (ss[7:0] == 8'h59))begin
            if(mm[3:0] != 4'd9)
                mm[3:0] <= mm[3:0]+1;
            else begin
                mm[3:0] <= 4'd0;
            if(mm[7:4] != 4'd5)
                mm[7:4] <= mm[7:4]+1;
            else
                mm[7:4] <= 4'd0;
            end
        end
    end
 //hours
    always@(posedge clk)begin
        if(reset == 1)begin
            hh <= 8'h12;
            pm <= 1'b0;
        end
        else if(ena && (ss[7:0] == 8'h59) && (mm[7:0] == 8'h59))begin
            if(hh == 8'h11)begin
                hh<=8'h12;
                pm<=~pm;
            end
            else if(hh == 8'h12)
                hh<=8'h01;
            else begin
                if(hh[3:0] != 4'd9)
                    hh[3:0] <= hh[3:0]+1;
                else begin
                    hh[3:0] <=4'd0;
                    hh[7:4] <= hh[7:4] +1;
                end
            end
        end
    end
       
endmodule
