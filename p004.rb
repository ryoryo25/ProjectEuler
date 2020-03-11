def main
	max = 0

	100.step(999) do |i|
		100.step(999) do |j|
			x = i * j
			if isPalindrome(x) && max < x
				max = x
			end
		end
	end

	puts(max)
end

def isPalindrome(n)
	s = n.to_s
	l = s.length
	(l/2).times do |i|
		if s[i] != s[l-i-1]
			return false
		end
	end

	return true
end