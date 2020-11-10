N = 10000000000
P = 7830457
C = 28433

# trash code
# def main
# 	n = 1 + 28433 * (2**7830457)
# 	return n.to_s[-10..-1]
# end

# slightly smart
# def main
# 	n = (1 + (28433 % N) * ((1 << 7830457) % N)) % N
# 	puts n
# end

# relatively smart
def main
	n = 1
	i = 0
	while i < P-16 do
		n = (n * ((1 << 16) % N)) % N
		i += 16
	end
	while i < P do
		n = (n * 2) % N
		i += 1
	end
	n = ((C * n) % N + 1) % N
	puts n
	puts i
end