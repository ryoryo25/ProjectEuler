require './libs/prime.rb'

def main
	primes = sieve(10**5 - 1)
	fourdigits = primes.select {|p| p.to_s.length == 4 }

	len = fourdigits.length
	perms = []
	len.times do |i|
		x = fourdigits[i]
		if x != nil
			pandigitals = [x]
			px = x.to_s.split(//).sort
			fourdigits[i] = nil
			len.times do |j|
				y = fourdigits[j]
				if y != nil && y.to_s.split(//).sort == px
					pandigitals.push(y)
					fourdigits[j] = nil
				end
			end
			perms.push(pandigitals)
		end
	end

	c = perms.select {|x| x.length > 2}
	ans = []
	c.each do |p|
		plen = p.length
		difs = []
		flg = false
		(plen-2).times do |i|
			i.step(plen-2) do |j|
				dif = p[j+1]-p[j]
				if !difs.include?(dif)
					difs.push(dif)
				else
					flg = true
				end
			end
		end

		if flg
			ans.push(p)
		end
	end

	return ans.length
end