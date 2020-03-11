def readFile
	tri = []
	File.open("files/p067_triangle.txt") do |f|
		f.each_line do |line|
			a = line.split
			a.each_index do |i|
				a[i] = a[i].to_i
			end

			tri.push(a)
		end
	end

	return tri
end

def main
	tri = readFile
	puts(move(tri, 0, 0))
end

def move(tri, r, c)
	if tri[r+1] == nil
		return tri[r][c]
	else
		return tri[r][c] + [move(tri, r+1, c), move(tri, r+1, c+1)].max
	end
end