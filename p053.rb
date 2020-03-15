def main
	gtom = 0
	1.step(100) do |n|
		0.step(n) do |r|
			if comb(n, r) > 1000000
				gtom += 1
			end
		end
	end

	return gtom
end

def factorial(n)
	if n == 0
		return 1
	else
		return n * factorial(n-1)
	end
end

def comb(n, r)
	return factorial(n) / (factorial(r) * factorial(n-r))
end