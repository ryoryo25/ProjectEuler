def main
	i = 1
	while true
		if containSameDigits([i, 2*i, 3*i, 4*i, 5*i, 6*i])
			return i
		end
		i += 1
	end
end

def containSameDigits(array)
	test_array = array[0].to_s.split(//).sort
	flag = true
	array.each do |x|
		flag = flag && test_array == x.to_s.split(//).sort
	end

	return flag
end