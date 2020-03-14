def main
	sum = 0
	1000.times do |i|
		sum += (i+1)**(i+1)
	end
	
	return sum.to_s[-10..-1]
end