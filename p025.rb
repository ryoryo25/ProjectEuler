def answer
	fn = [1, 1]
	i = 2
	
	loop do
		f = fn[i - 1] + fn[i - 2]
		if f > 10 ** 999
			return i + 1
		else
			fn.push(f)
			i += 1
			puts f
			puts i
		end
	end
end
