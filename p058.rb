require './libs/prime.rb'

$primes = 0


def main
	diagonals = [1]
	len = 1
	here = 1
	while true
		4.times do
			here += len
			here += 1
			diagonals.push(here)
		end
		len += 2
		
		ratio = getPrimeRatio(diagonals)
		if ratio < 0.1
			return len
		end
	end
end

def getPrimeRatio(array)
	array[-4..-1].each do |x|
		if isPrime(x)
			$primes += 1
		end
	end

	return $primes.to_f / array.size
end