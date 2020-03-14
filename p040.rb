$d = []

def main
	gen
	x = 1
	7.times do |i|
		x *= $d[10**i - 1]
	end

	return x
end

def gen
	# a = []
	n = 1
	while $d.length < 10**6 + 100
		s = n.to_s
		s.length.times do |i|
			$d.push(s[i].to_i)
		end

		n += 1
	end
end