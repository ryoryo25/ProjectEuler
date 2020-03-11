# reffered(dynamic programming): https://www.mathblog.dk/project-euler-18/

$tri = [
	[75],
	[95, 64],
	[17, 47, 82],
	[18, 35, 87, 10],
	[20, 04, 82, 47, 65],
	[19, 01, 23, 75, 03, 34],
	[88, 02, 77, 73, 07, 63, 67],
	[99, 65, 04, 28, 06, 16, 70, 92],
	[41, 41, 26, 56, 83, 40, 80, 70, 33],
	[41, 48, 72, 33, 47, 32, 37, 16, 94, 29],
	[53, 71, 44, 65, 25, 43, 91, 52, 97, 51, 14],
	[70, 11, 33, 28, 77, 73, 17, 78, 39, 68, 17, 57],
	[91, 71, 52, 38, 17, 14, 91, 43, 58, 50, 27, 29, 48],
	[63, 66, 04, 68, 89, 53, 67, 30, 73, 16, 69, 87, 40, 31],
	[04, 62, 98, 27, 23, 9, 70, 98, 73, 93, 38, 53, 60, 04, 23]
]

def main
	puts(move(0, 0))

	dynamicProgramming
	puts($tri[0][0])
end

# recursive
def move(r, c)
	if $tri[r+1] == nil
		return $tri[r][c]
	else
		return $tri[r][c] + [move(r+1, c), move(r+1, c+1)].max
	end
end

def dynamicProgramming
	($tri.length-2).step(0, -1) do |i|# from bottom row +1
		0.step(i) do |j|
			$tri[i][j] += [$tri[i+1][j], $tri[i+1][j+1]].max
		end
	end
end