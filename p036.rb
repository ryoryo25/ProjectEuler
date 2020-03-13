def main
	sum = 0
	1.step(1000000-1) do |i|
		if checkBase10And2(i)
			sum += i
		end
	end

	return sum
end

def checkBase10And2(n)
	return isPalindrome(n.to_s) && isPalindrome(n.to_s(2))
end

def isPalindrome(s)
	len = s.length
	(len/2).times do |i|
		if s[i] != s[len-i-1]
			return false
		end
	end

	return true
end