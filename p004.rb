def main
	products = []
	palindromes = []

	100.step(999) do |i|
		100.step(999) do |j|
			products.push(i * j)
		end
	end

	products.each do |x|
		if isPalindrome(x)
			palindromes.push(x)
		end
	end

	puts(palindromes.max)
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