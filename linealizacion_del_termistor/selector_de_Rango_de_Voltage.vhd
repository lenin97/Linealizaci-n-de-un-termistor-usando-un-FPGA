----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    19:28:07 09/29/2014 
-- Design Name: 
-- Module Name:    selector_de_Rango_de_Voltage - Behavioral 
-- Project Name: 
-- Target Devices: 
-- Tool versions: 
-- Description: 
--
-- Dependencies: 
--
-- Revision: 
-- Revision 0.01 - File Created
-- Additional Comments: 
--
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.all;
use ieee.numeric_std.all;
use ieee.math_real.all;
library ieee_proposed;
use ieee_proposed.fixed_pkg.all;
use ieee_proposed.fixed_float_types.all;



entity Selector_de_Rango is
      port(
		     Vo: in ufixed(3 downto -8);
			  Ti: out ufixed(7 downto -8);
			  clk: in std_logic
			  );

end Selector_de_Rango; 

architecture Behavioral of Selector_de_Rango is

    signal Tim: ufixed(7 downto -8);
	 signal Tin: ufixed(7 downto -8);
	 
	 signal Vom: ufixed(3 downto -8);
	 signal Von: ufixed(3 downto -8); 
	 
	 --signal Tinmr, Vonmr, TVdr: real;
	 	 
	 signal Tinm: ufixed(8 downto -8);
	 signal Vonm: ufixed(4 downto -8);
	 signal Voim: ufixed(4 downto -8);
	 signal TVd: ufixed(ufixed_high(8,-8,'/',4,-8) downto ufixed_low(8,-8,'/',4,-8));
	 signal TVm: ufixed(21 downto -21);  
	   
    constant Ti0: ufixed(7 downto -8) := to_ufixed(0,7,-8);
	 constant Ti1: ufixed(7 downto -8) := to_ufixed(6,7,-8);
	 constant Ti2: ufixed(7 downto -8) := to_ufixed(12,7,-8);
	 constant Ti3: ufixed(7 downto -8) := to_ufixed(18,7,-8);
	 constant Ti4: ufixed(7 downto -8) := to_ufixed(24,7,-8);
	 constant Ti5: ufixed(7 downto -8) := to_ufixed(30,7,-8);
	 constant Ti6: ufixed(7 downto -8) := to_ufixed(36,7,-8);
	 constant Ti7: ufixed(7 downto -8) := to_ufixed(42,7,-8);
	 constant Ti8: ufixed(7 downto -8) := to_ufixed(48,7,-8);
	 constant Ti9: ufixed(7 downto -8) := to_ufixed(54,7,-8);
	 constant Ti10: ufixed(7 downto -8) := to_ufixed(60,7,-8);
	 
    constant Vo0: ufixed(3 downto -8) := to_ufixed(0.292,3,-8);
	 constant Vo1: ufixed(3 downto -8) := to_ufixed(0.389,3,-8);
	 constant Vo2: ufixed(3 downto -8) := to_ufixed(0.510,3,-8);
	 constant Vo3: ufixed(3 downto -8) := to_ufixed(0.660,3,-8);
	 constant Vo4: ufixed(3 downto -8) := to_ufixed(0.841,3,-8);
	 constant Vo5: ufixed(3 downto -8) := to_ufixed(1.060,3,-8);
	 constant Vo6: ufixed(3 downto -8) := to_ufixed(1.312,3,-8);
	 constant Vo7: ufixed(3 downto -8) := to_ufixed(1.601,3,-8);
	 constant Vo8: ufixed(3 downto -8) := to_ufixed(1.925,3,-8); 
	 constant Vo9: ufixed(3 downto -8) := to_ufixed(2.282,3,-8);
	 constant Vo10: ufixed(3 downto -8) := to_ufixed(2.662,3,-8);
	 
	 type type_state is (s0,s1,s2,s3,s4);
	 signal state: type_state; 
	 
	 

begin
        process(Vo,clk)
          		  
		    begin 
			 
			 if clk'event and clk='1' then
			    
				 case state is
				      
	               when s0 => if Vo0<=Vo and Vo<=Vo1 then
                                Tim<= Ti0;
                                Tin<= Ti1;
 										  Vom<= Vo0;
										  Von<= Vo1;	                          
									  
                             elsif Vo1<Vo and Vo<=Vo2 then
									     Tim<= Ti1;
                                Tin<= Ti2;
 										  Vom<= Vo1;
										  Von<= Vo2;
									  
									  elsif Vo2<Vo and Vo<=Vo3 then
									     Tim<= Ti2;
                                Tin<= Ti3;
 										  Vom<= Vo2;
										  Von<= Vo3;
									  									  
									  elsif Vo3<Vo and Vo<=Vo4 then
									     Tim<= Ti3;
                                Tin<= Ti4;
 										  Vom<= Vo3;
										  Von<= Vo4;
									  									  
									  elsif Vo4<Vo and Vo<=Vo5 then
									     Tim<= Ti4;
                                Tin<= Ti5;
 										  Vom<= Vo4;
										  Von<= Vo5;
									  									  
                             elsif Vo5<Vo and Vo<=Vo6 then
									     Tim<= Ti5;
                                Tin<= Ti6;
 										  Vom<= Vo5;
										  Von<= Vo6;
									                            	  								  
             					  elsif Vo6<Vo and Vo<=Vo7 then
									     Tim<= Ti6;
                                Tin<= Ti7;
 										  Vom<= Vo6;
										  Von<= Vo7;
									                               									  
                             elsif Vo7<Vo and Vo<=Vo8 then
									     Tim<= Ti7;
                                Tin<= Ti8;
 										  Vom<= Vo7;
										  Von<= Vo8;
									                              
                             elsif Vo8<Vo and Vo<=Vo9 then
									     Tim<= Ti8;
                                Tin<= Ti9;
 										  Vom<= Vo8;
										  Von<= Vo9;
									                               
                             elsif Vo9<Vo and Vo<=Vo10 then
									     Tim<= Ti9;
                                Tin<= Ti10;
 										  Vom<= Vo9;
										  Von<= Vo10;
									  end if;
									  
									  state<= s1;
									  
                  when s1=>  Tinm<=Tin-Tim;   
						           Vonm<=Von-Vom;
                             Voim<=Vo-Vom;
									  
									  state<= s2;
									  
						when s2=>     
                             --Tinmr<=to_real(Tinm);
									  --Vonmr<=to_real(Vonm);
									  TVd<= Tinm/Vonm; 
									  --TVd<=to_ufixed(TVdr,7,-8);
									 
									  state<= s3;
						when s3=>			  
                             TVm<=TVd*Voim;
									  state<= s4;
						when s4=>			  
                             Ti<=TVm+Tim;
                             state<= s0;  									  
						
						
             end case;      
      			    
				end if ;      
			  

          end process;      
end Behavioral;