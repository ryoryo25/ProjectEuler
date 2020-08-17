def main
	max = 0
	i = 1
	while i.to_s.length + (i*2).to_s.length < 10
		j = 1
		products = []
		while !loopEnd(products)
			products.push(i * j)
			if isPandigital(products)
				pandigital = concatArray(products)
				if pandigital > max
					max = pandigital
				end
			end
			j += 1
		end
		i += 1
	end

	puts max
end

def loopEnd(array)
	len = 0
	used_digits = Array.new(10, false)
	array.each do |element|
		element.to_s.each_char do |c|
			n = c.to_i
			len += 1
			if !used_digits[n]
				used_digits[n] = true
			else
				return true
			end
		end
	end

	return len > 9
end

def isPandigital(array)
	used_digits = Array.new(10, false)

	array.each do |element|
		element.to_s.each_char do |c|
			n = c.to_i
			if !used_digits[n]
				used_digits[n] = true
			else
				return false
			end
		end
	end

	return and_array(used_digits[1..9]) && concatArray(array).to_s.length < 10
end

def and_array(a)
	flag = a[0]
	a.each do |bool|
		flag = flag && bool
	end

	return flag
end

def concatArray(array)
	str = ""
	array.each do |i|
		str += i.to_s
	end

	return str.to_i
end