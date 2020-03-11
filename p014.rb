def main
	max = 0
	max_len = 0
	n = 1000000

	n.times do |i|
		len = getLength(i+1)
		if max_len < len
			max = i+1
			max_len = len
		end
	end

	puts(max)
end

def getLength(start)
	a = [start]
	# n = 0
	while a[-1] != 1
		a.push(collatzNext(a[-1]))
	end

	return a.length
end

def collatzNext(n)
	if n % 2 == 0
		return n / 2
	else
		return 3 * n + 1
	end
end