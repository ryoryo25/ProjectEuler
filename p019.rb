def main
	totaldays = 0

	# 1900/01/01 ~ 1900/12/31
	1.step(12) do |month|
		getMonthDays(1900, month).times do |day|
			totaldays += 1
		end
	end

	beginsundays = 0
	# 1901/01/01 ~ 2000/12/31
	1901.step(2000) do |year|
		1.step(12) do |month|
			getMonthDays(1900, month).times do |day|
				totaldays += 1
				if day == 0 && isSunday(totaldays)
					beginsundays += 1
				end
			end
		end
	end

	puts(beginsundays)
end

def getDaysOfYear(year)
	return isLeap(year) ? 366 : 365
end

# reffered: https://ja.wikipedia.org/wiki/%E9%96%8F%E5%B9%B4#%E9%80%90%E6%AC%A1%E7%9A%84%E3%81%AA3%E6%9D%A1%E4%BB%B6
def isLeap(year)
	if year % 400 == 0
		return true
	elsif year % 100 == 0
		return false
	else
		return year % 4 == 0
	end

	return false
end

# month: 1 - 12
def getMonthDays(year, month)
	if month == 2
		return isLeap(year) ? 29 : 28
	elsif month == 4 || month == 6 || month == 9 || month == 11
		return 30
	else
		return 31
	end
end

# sunday: mod 7 = 0
def getDayOfWeek(totaldays)
	return totaldays % 7
end

def isSunday(totaldays)
	return getDayOfWeek(totaldays) == 0
end