=begin
Implement a caesar cipher that takes in a string and the shift factor and then outputs the modified string:

    > caesar_cipher("What a string!", 5)
    => "Bmfy f xywnsl!"
Quick Tips:

You will need to remember how to convert a string into a number.
Don't forget to wrap from z to a.
Don't forget to keep the same case.

=end


class CaesarCipher

		attr_accessor :string, :shift, :alph_array, :alph_hash

	def initialize(string= "", shift = 0)
		@string = string
		@shift = shift
		@alph_array = alph_array
		@alph_hash = alph_hash(@alph_array)
	end

	def alph_array

		 ("a".."z").to_a
			
	end

	def alph_hash (alph_array)
		alph_hash = {}
		alph_array.each_with_index do |a, i|
			alph_hash[a] = i
		end 
		alph_hash
	end

	def to_s
		puts @string
		puts @shift
		p @alph_array
		p @alph_hash
	end


	def alph_pos(start, shift)

			#should return the value to shift to the right or left in alphabet based on start
			#if it's higher than 25 then it has to start at the beginning

		if shift >=0 #positive (forward) shift

			if start + shift > 25
				index = (start+shift) - 26
			else
				index = start + shift
			end

			
		else  #negative shift


			if start + shift < 0 #uses plus because shift is already negative
				index = 26 + (start + shift)
			else
				index = start + shift
			end
		end
		return index


	end #alph_pos

	def make_cipher

		i = 0
		result_string = []

		while i < @string.length do

			if ("a".."z").to_a.include? @string[i].downcase
			
					start = @alph_hash[@string[i].downcase]
					
						new_pos = alph_pos(start, @shift)
						if @string[i] == @string[i].upcase
							result_string << @alph_hash.key(new_pos).upcase
						else
							result_string << @alph_hash.key(new_pos)

						end

			else
					result_string << @string[i]
			

			end

			i+=1

		end #while

		result_string.join

	end #make_cipher

end

t = CaesarCipher.new("What a String!", 5)
puts t.make_cipher



