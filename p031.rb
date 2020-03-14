# reffered: https://qiita.com/cof/items/1a38e1303d3a7d84d05e

def main
	coins = [1, 2, 5, 10, 20, 50, 100, 200]
	# coins = [2, 5, 10, 20, 50, 100, 200]
	return count(coins, 200)
end

def count(coins, target)
	if target == 0 # if the recursion reaches this block, 
		return 1
	elsif coins.length == 1 # if the recursion reaches this block, 
		return 1
	else
		count = 0
		coin = coins.pop
		cycle = (target / coin) + 1 # to include not using the coin, add 1
		
		cycle.times do |i|
			count += count(coins.dup, target - coin * i)
		end

		return count
	end
end