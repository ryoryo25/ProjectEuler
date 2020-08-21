require './libs/read.rb'

def main
	cipher = readFile("./files/p059_cipher.txt") {|line| line.gsub!(/,/, ' ').split.map {|x| x.to_i } }
	plain = cipher.dup

	key = "are"

	cipher.each_with_index do |x, idx|
		plain[idx] = xor(x, key[idx % 3].ord).chr
	end

	return plain
end

def xor(a, b)
	return a ^ b
end

def sum(array)
	return array.inject(:+)
end