require './libs/read.rb'

CARDS = ["2", "3", "4", "5", "6", "7", "8", "9", "T", "J", "Q", "K", "A"]
SUITS = ["C", "D", "H", "S"]

HIGH_CARD = 0
ONE_PAIR = 1
TWO_PAIR = 2
THREE_CARD = 3
STRAIGHT = 4
FLUSH = 5
FULL_HOUSE = 6
FOUR_CARD = 7
STRAIGHT_FLUSH = 8
ROYAL_FLUSH = 9

def main
	poker = readLines("files/p054_poker.txt") do |line|
		line.split.each_slice(5).to_a
	end

	p1 = 0
	poker.each do |game|
		if winP1(game[0], game[1])
			p1 += 1
		end
	end

	return p1
end

def winP1(p1, p2)
	p1 = p1.sort {|a, b| CARDS.index(a[0]) <=> CARDS.index(b[0]) }
	hand_p1 = hand(p1)
	p2 = p2.sort {|a, b| CARDS.index(a[0]) <=> CARDS.index(b[0]) }
	hand_p2 = hand(p2)

	if hand_p1[0] > hand_p2[0]
		return true
	elsif hand_p1[0] < hand_p2[0]
		return false
	else
		if hand_p1[1] > hand_p2[1]
			return true
		elsif hand_p1[1] < hand_p2[1]
			return false
		else
			4.step(0, -1) do |i|
				if CARDS.index(p1[i][0]) > CARDS.index(p2[i][0])
					return true
				elsif CARDS.index(p1[i][0]) < CARDS.index(p2[i][0])
					return false
				end
			end

			return false
		end
	end
end

# assume p is sorted
def hand(p)
	cards = p.map {|card| [CARDS.index(card[0]), SUITS.index(card[1])] }
	
	if isRoyalFlush(cards)
		return [ROYAL_FLUSH, CARDS.index("A")]
	end
	if isStraightFlush(cards)
		return [STRAIGHT_FLUSH, cards[-1][0]]
	end
	if isFourCard(cards)
		return [FOUR_CARD, cards.map {|card| card[0] }.group_by{|i| i}.values.select {|x| x.size == 4}[0][0]]
	end
	if isFullHouse(cards)
		return [FULL_HOUSE, cards.map{|card| card[0]}.max]
	end
	if isFlush(cards)
		return [FLUSH, cards.map{|card| card[0]}.max]
	end
	if isStraight(cards)
		return [STRAIGHT, cards.map{|card| card[0]}.max]
	end
	if isThreeCard(cards)
		return [THREE_CARD, cards.map {|card| card[0] }.group_by{|i| i}.values.select {|x| x.size == 3}[0][0]]
	end
	if isTwoPair(cards)
		return [TWO_PAIR, cards.map {|card| card[0] }.group_by{|i| i}.values.select {|x| x.size == 2}.max[0]]
	end
	if isOnePair(cards)
		return [ONE_PAIR, cards.map {|card| card[0] }.group_by{|i| i}.values.select {|x| x.size == 2}[0][0]]
	end

	return [HIGH_CARD, cards.map{|card| card[0]}.max]
end

def isConsecutive(cards)
	nums = cards.map {|card| card[0] }
	prev = nums[0]
	1.step(nums.size - 1) do |i|
		if prev + 1 != nums[i]
			return false
		else
			prev = nums[i]
		end
	end

	return true
end

def isAllSameSuit(cards)
	return cards.map {|card| card[1] }.group_by {|i| i }.size == 1
end

def isStraight(cards)
	return isConsecutive(cards)
end

def isFlush(cards)
	return isAllSameSuit(cards)
end

def isStraightFlush(cards)
	return isStraight(cards) && isFlush(cards)
end

def isRoyalFlush(cards)
	return isStraightFlush(cards) && cards[0][0] == CARDS.index("T")
end

def isFourCard(cards)
	cards = cards.map {|card| card[0] }.group_by{|i| i }
	flag = false
	cards.each_value do |x|
		flag = flag || x.size == 4
	end

	return flag
end

def isFullHouse(cards)
	cards = cards.map {|card| card[0] }.group_by{|i| i }.values.sort{|a, b| a.size <=> b.size }

	if cards.size != 2
		return false
	end
	
	return cards[0].size == 2 && cards[1].size == 3
end

def isThreeCard(cards)
	return cards.map {|card| card[0] }.group_by{|i| i }.values.map {|x| x.size }.max == 3
end

def isTwoPair(cards)
	array = cards.map {|card| card[0] }.group_by{|i| i }.values.map {|x| x.size }.sort
	return array[-1] == 2 && array[-2] == 2
end

def isOnePair(cards)
	array = cards.map {|card| card[0] }.group_by{|i| i }.values.map {|x| x.size }.sort
	return array[-1] == 2
end