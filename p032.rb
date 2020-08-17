def main
	nine_array = Array.new(9) {|i| (i+1).to_s}
	perm = nine_array.permutation.to_a
	pandigitals = []

	perm.each do |array|
		0.step(6) do |i|
			multiplicand = strary_to_i(array[0..i])
			(i+1).step(7) do |j|
				multiplier = strary_to_i(array[(i+1)..j])
				product = strary_to_i(array[(j+1)..8])
				if multiplicand > product || multiplier > product
					break
				end
				if isPandigitalProduct(multiplicand, multiplier, product)
					if !pandigitals.include?(product)
						pandigitals.push(product)
					end
				end
			end
		end
	end

	puts(pandigitals.inject(:+))
end

def strary_to_i(a)
	str = ""
	a.each do |s|
		str += s
	end

	return str.to_i
end

def isPandigitalProduct(multiplicand, multiplier, product)
	if multiplicand * multiplier != product
		return false
	end

	used_digits = Array.new(10, false)

	multiplicand.to_s.each_char do |c|
		n = c.to_i
		if !used_digits[n]
			used_digits[n] = true
		else
			return false
		end
	end

	multiplier.to_s.each_char do |c|
		n = c.to_i
		if !used_digits[n]
			used_digits[n] = true
		else
			return false
		end
	end

	product.to_s.each_char do |c|
		n = c.to_i
		if !used_digits[n]
			used_digits[n] = true
		else
			return false
		end
	end

	return and_array(used_digits[1..9])
end

def and_array(a)
	flag = a[0]
	a.each do |bool|
		flag = flag && bool
	end

	return flag
end