def main
	lychrels = []

	10.step(10000-1) do |i|
		if isLychrel(i)
			lychrels.push(i)
		end
	end

	p lychrels
	return lychrels.size
end

def isPalindrome(n)
	str = n.to_s
	len = str.length

	(len/2).times do |i|
		if str[i] != str[len-i-1]
			return false
		end
	end

	return true
end

def getReversedNum(n)
	str_n = n.to_s
	len_n = str_n.length
	str_ans = ""

	(len_n-1).step(0, -1) do |i|
		str_ans += str_n[i]
	end

	return str_ans.to_i
end

def isLychrel(n)
	count = 0
	m = n
	while true
		if count >= 50
			break
		end

		x = m + getReversedNum(m)
		count += 1
		if isPalindrome(x)
			# print("i = #{n}, count = #{count}\n")
			return false
		end
		m = x
	end

	# print("i = #{n}, count = #{count}\n")
	return true
end