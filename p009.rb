def main
	1.step(1000) do |a|
		(a+1).step(1000) do |b|
			(b+1).step(1000) do |c|
				if isTriplet(a, b, c) && a+b+c == 1000
					puts(a*b*c)
					return
				end
			end
		end
	end
end

def isTriplet(a, b, c)
	return a**2 + b**2 == c**2
end

# shown answer
def pythagoreanTriplet
	s = 1000
	3.step((s-3)/3) do |a|
		(a+1).step((s-1-a)/2) do |b|
			c = s-a-b
			if isTriplet(a, b, c)
				puts(a*b*c)
				return
			end
		end
	end
end