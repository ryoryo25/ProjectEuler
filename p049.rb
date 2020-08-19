require './libs/prime.rb'

def main
	primes = sieve(10000)
	fourdigits = primes.select {|p| p > 1000 }
	fourdigits2 = fourdigits.dup
	perms = []

	fourdigits.each do |x|
		perm = []
		fourdigits2.each do |y|
			if isPerm(x, y)
				perm.push(y)
				fourdigits2.delete(y)
			end
		end
		if perm.size > 2
			perms.push(perm)
		end
	end
	
	ans = []
	perms.each do |perm|
		perm.each do |a1|
			perm.each do |a2|
				if a2 > a1 && perm.include?(2 * a2 - a1)
				# a3 = a1 + 2d = a1+d + (a1+d - a1) = a2 + (a2 - a1) = 2*a2 - a1
					ans.push([a1, a2, 2 * a2 - a1])
				end
			end
		end
	end

	ans.each do |a|
		answer = ""
		a.each do |i|
			answer += i.to_s
		end
		puts answer
	end
end

def isPerm(n, m)
	if n.to_s.length != m.to_s.length
		return false
	end

	return n.to_s.split(//).sort == m.to_s.split(//).sort
end