def answer
	n = 2 ** 1000
	ans = 0
	n.to_s.length.times do |i|
		ans += n.to_s[i].to_i
	end
	
	return ans
end
