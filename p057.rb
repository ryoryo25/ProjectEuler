require 'rational'

def main
	count = 0
	ans = 0
	x = Rational(0)
	while count <= 1000
		new_x = 1 / (2 + x)
		next_term = 1 + new_x
		count += 1
		if next_term.numerator.to_s.length > next_term.denominator.to_s.length
			ans += 1
		end
		x = new_x
	end

	return ans
end