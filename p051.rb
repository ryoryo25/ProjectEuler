require './libs/prime.rb'
# require 'prime'

# Ref:
# http://tsumuji.cocolog-nifty.com/tsumuji/2009/08/project-euler-7.html
def main
	primes = sieve(10000000)
	cache = Array.new(10000000, false)
	primes.each do |prime|
		cache[prime] = true
	end
	zero_nine = Array.new(10) {|i| i }

	primes.each do |prime|
		contain = contain012(prime)
		if !contain.empty?
			p contain
			contain.each do |replace|
				count = 1
				(zero_nine-[replace]).each do |n|
					p n
					if cache[replaceDigit(prime, replace, n)]
						p prime
						count += 1
					end
				end
				if count > 7
					return prime
				end
			end
		end
	end

	return nil
end

def replaceDigit(x, replace, n)
	str_x = x.to_s
	x_len = str_x.length
	x_len.times do |i|
		if str_x[i] == replace.to_s
			if i == 0 && n == 0
				return 0
			end
			str_x[i] = n.to_s
		end
	end

	return str_x.to_i
end

def contain012(x)
	str_x = x.to_s[0..-2]
	size_x = str_x.length
	ans = []
	zero = str_x.delete("0")
	if zero.length <= size_x-2
		ans.push(0)
	end
	one = str_x.delete("1")
	if one.length <= size_x-2
		ans.push(1)
	end
	two = str_x.delete("2")
	if two.length <= size_x-2
		ans.push(2)
	end

	return ans
end