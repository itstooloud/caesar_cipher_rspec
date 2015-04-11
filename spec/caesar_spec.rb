require 'spec_helper'
require '/Users/workaroundlaptop/Documents/Code/Ruby/odin/rspec/caesar/caesar_cipher'

describe CaesarCipher do

		before :each do
			@cipher = CaesarCipher.new("What a string!", 5)
		end

		it "returns an instance of CaesarCipher" do
			@cipher.string.should == "What a string!"
		end

		it "returns forward positive shift" do
			@cipher.alph_pos(4,5).should == 9
		end

		it "returns backward negative shift" do
			@cipher.alph_pos(5, -2).should == 3
		end

		it "cycles to beginning of alphabet if shift is greater than 25" do
			@cipher.alph_pos(20,10).should == 4
		end

		it "cycles backward past the beginning of the alphabet" do
			@cipher.alph_pos(3,-10).should == 19
		end

		it "returns the right answer given on the Odin page" do
			@cipher.make_cipher.should == "Bmfy f xywnsl!"
		end
		


		
end