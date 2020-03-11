$number = {
	0 => "",
	1 => "one",
	2 => "two",
	3 => "three",
	4 => "four",
	5 => "five",
	6 => "six",
	7 => "seven",
	8 => "eight",
	9 => "nine",
	10 => "ten",
	11 => "eleven",
	12 => "twelve",
	13 => "thirteen",
	14 => "fourteen",
	15 => "fifteen",
	16 => "sixteen",
	17 => "seventeen",
	18 => "eighteen",
	19 => "nineteen",
	20 => "twenty",
	30 => "thirty",
	40 => "forty",
	50 => "fifty",
	60 => "sixty",
	70 => "seventy",
	80 => "eighty",
	90 => "ninety",
	100 => "hundred",
	1000 => "thousand"
}

def main
	letters = 0

	1.step(1000) do |i|
		# puts(i.to_s + ": " + getLen(i).to_s)
		letters += getLen(i)
	end

	puts(letters)
end

def getLen(n)
	if n <= 20
		return $number[n].length
	elsif n < 100
		return $number[(n / 10) * 10].length + getLen(n % 10)
	elsif n < 1000
		if n % 100 == 0
			return $number[n / 100].length + $number[100].length
		else
			return $number[n / 100].length + $number[100].length + "and".length + getLen(n % 100)
		end
	else
		return $number[1].length + $number[n].length
	end
end