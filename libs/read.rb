def readFile(path)
	a = []
	File.open(path) do |f|
		a = f.gets.gsub!(/"/, '').gsub!(/,/, ' ').split.sort
	end

	return a
end

def readLines(path)
	a = []
	File.open(path) do |f|
		f.each_line do |line|
			if block_given?
				a.push(yield(line))
			else
				a.push(line.gsub!(/"/, '').gsub!(/,/, ' ').split.sort)
			end
		end
	end

	return a
end