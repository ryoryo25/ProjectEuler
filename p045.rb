def main
	n = 285+1
	while true
		tn = t(n)
		if checkP(tn) && checkH(tn)
			return tn
		end
		n += 1
	end
end

def t(n)
	return n * (n+1) / 2
end

def p(n)
	return n * (3*n-1) / 2
end

def h(n)
	return n * (2*n-1)
end

# https://www.wolframalpha.com/input/?i=Solve[a==n(n+1)/2,{a, n}]
def checkT(tn)
	n = (Math.sqrt(8*tn+1)-1) / 2
	return n == n.to_i.to_f
end

# https://www.wolframalpha.com/input/?i=Solve[a==n(3n−1)/2,{a, n}]
def checkP(pn)
	n = (Math.sqrt(24*pn+1)+1) / 6
	return n == n.to_i.to_f
end

# https://www.wolframalpha.com/input/?i=Solve[a==n(2n−1),{a, n}]
def checkH(hn)
	n = (Math.sqrt(8*hn+1)+1) / 4
	return n == n.to_i.to_f
end