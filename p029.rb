def main
	terms = []
	2.step(100) do |a|
		2.step(100) do |b|
			x = a**b
			if !terms.include?(x)
				terms.push(x)
			end
		end
	end

	puts(terms.length)
end