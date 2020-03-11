# reffered: https://www.mathblog.dk/project-euler-18/
# see also: http://kogecoo.hatenablog.com/entry/20090324/1237903588

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
	find(tri)
	puts(tri[0][0])
end

def find(tri)
	(tri.length-2).step(0, -1) do |i|# from bottom row +1
		0.step(i) do |j|
			tri[i][j] += [tri[i+1][j], tri[i+1][j+1]].max
		end
	end
end