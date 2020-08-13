def divisors(n)
	divs = []

	2.step(Math.sqrt(n).to_i) do |i|
		if n % i == 0
			divs.push(i)
			if n / i != i
				divs.push(n/i)
			end
		end
	end

	return divs
end