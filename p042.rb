 require './libs/read.rb'

def main
	words = readFile("files/p042_words.txt")

	count = 0
	words.each do |word|
		x = 0
		word.each_char do |c|
			x += letterToNum(c)
		end

		if isTriNum(x)
			count += 1
		end
	end

	return count
end

def isTriNum(x)
	n = 1
	while true
		if x == triNum(n)
			return true
		end

		if x < triNum(n)
			return false
		end

		n += 1
	end
end

def triNum(n)
	return n * (n+1) / 2
end

def letterToNum(c)
	return c.ord - 64
end