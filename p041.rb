require './libs/prime.rb'

def main
	9.step(1, -1) do |i|
		perm(i).each do |x|
			if isPrime(x)
				return x
			end
		end
	end
end

def perm(n)
	a = Array.new(n) {|i| i+1 }
	perms = a.permutation.to_a
	ans = []

	perms.each do |x|
		s = ""
		x.each do |i|
			s += i.to_s
		end
		ans.push(s.to_i)
	end

	return ans.reverse
end

# unused
def isPandigital(x)
	s = x.to_s.split(//)
	n = s.length
	digits = []
	check = Array.new(n) {|i| i+1 }

	n.times do |i|
		k = s[i].to_i
		if !digits.include?(k)
			digits.push(k)
		else
			return false
		end
	end

	digits.sort!
	flg = (digits.length == n)
	n.times do |i|
		flg = flg && (digits[i] == check[i])
	end

	return flg
end
