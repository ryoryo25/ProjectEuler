def main
	sum = 0
	3.step(100000) do |i|
		if i == digitFactorial(i)
			sum += i
			puts(i)
		end
	end

	puts("")
	puts(sum)
end

def digitFactorial(n)
	sum = 0
	n.to_s.each_char do |c|
		sum += factorial(c.to_i)
	end

	return sum
end

def factorial(n)
	f = 1
	n.times do |i|
		f *= i+1
	end

	return f
end