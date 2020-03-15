require './libs/read.rb'

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
	cards = ["2", "3", "4", "5", "6", "7", "8", "9", "T", "J", "Q", "K", "A"]
	
end