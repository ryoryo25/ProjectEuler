# reffered: https://qiita.com/cof/items/1a38e1303d3a7d84d05e

def main
	coins = [1, 2, 5, 10, 20, 50, 100, 200]
	# coins = [2, 5, 10, 20, 50, 100, 200]
	return count(coins, 200)
end

def count(coins, target)
	if coins.length == 1
		return 1
	else
		count = 0
		coin = coins.pop
		cycle = (target / coin) + 1
		cycle.times do |i|
			count += count(coins.dup, target - coin * i)
		end

		return count
	end
end