def main
	primes = [2, 3, 5, 7, 11, 13, 17]
	len = primes.length
	sum = 0
	perms = perm

	perms.each do |x|
		flg = true
		len.times do |i|
			y = x[(i+1)..(i+3)].to_i
			flg = flg && (y % primes[i] == 0)
		end

		if flg
			puts x
			sum += x.to_i
		end
	end

	return sum
end

def perm
	a = Array.new(10) {|i| i }
	perms = a.permutation.to_a
	ans = []

	perms.each do |x|
		s = ""
		x.each do |i|
			s += i.to_s
		end
		ans.push(s)
	end

	return ans
end