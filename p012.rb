def divisor
	divs = []
	tn = 0
	n = 1
	
	loop do
		tn += n
		tn.times do |i|
			if tn % (i + 1) == 0
				divs.push(i + 1)
			end
		end
		
		if divs.length > 500
			return tn
		else
			puts(tn)
			puts(divs.length)
			divs = []
			n += 1
		end
	end
	
	
end

def trinum(n)
	ans = 0
	n.times do |i|
		ans += i + 1
	end
	
	return ans
end
