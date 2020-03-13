require './libs/prime.rb'

def main
	primes = [2, 5]
	3.step(1000000-1, 2) do |i|
		if !include024568(i) && isPrime(i)
			primes.push(i)
		end
	end

	count = 0
	primes.each do |x|
		if isCircularPrime(x)
			puts(x)
			count += 1
		end
	end

	return count
end

def include024568(n)
	s = n.to_s
	return s.include?("0") || s.include?("2") || s.include?("4") || s.include?("5") || s.include?("6") || s.include?("8")
end

def isCircularPrime(n)
	s = n.to_s
	len = s.length
	new_s = n.to_s
	if len == 1
		return true
	else
		1.step(len-1) do |i|
			(len-i).times do |k|
				new_s[k] = s[k+i]
			end
			i.times do |k|
				new_s[len-i+k] = s[k]
			end
			
			if !isPrime(new_s.to_i)
				return false
			end
		end

		return true
	end
end