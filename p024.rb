# reffered fp text

$perms = []

def main
	a = [0, 1, 2, 3, 4, 5, 6, 7, 8, 9]
	# perm(a.length, a, [])
	# p($perms[1000000-1])
	p(a.permutation.to_a[1000000-1])
end

def perm(n, a, b)
	if n == 0
		$perms.push(b.dup)
		return
	end

	if $perms.length > 1000000
		return
	end

	a.each_index do |i|
		if a[i] == nil
			next
		end

		b.push(a[i])
		a[i] = nil
		perm(n-1, a, b)
		a[i] = b.pop
	end
end