def readFile(path)
	a = []
	File.open(path) do |f|
		a = f.gets.gsub!(/"/, '').gsub!(/,/, ' ').split.sort
	end

	return a
end