def answer
	n = factorial(100)
	ans = 0
	n.to_s.length.times do |i|
		ans += n.to_s[i].to_i
	end
	
	return ans
end

def factorial(n)
	ans = 1
	n.times do |i|
		ans *= i + 1
	end
	
	return ans
end
