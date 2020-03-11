def main
	names = []
	File.open("files/p022_names.txt") do |f|
		names = f.gets.gsub!(/"/, '').gsub!(/,/, ' ').split.sort
	end

	sum = 0
	names.each_with_index do |name, i|
		c_sum = 0
		name.each_char do |c|
			c_sum += c.ord - 64
		end
		sum += c_sum * (i+1)
	end

	puts(sum)
end