require "./libs/prime"

def main
	n = 646
	while true
		if [primeFactors(n).size, primeFactors(n+1).size, primeFactors(n+2).size, primeFactors(n+3).size] == [4, 4, 4, 4]
			return n
		end

		n += 1
	end
end