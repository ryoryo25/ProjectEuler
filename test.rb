require 'benchmark'
require "./libs/prime"

def main
	Benchmark.bm(10) do |r|
		r.report("p") do
			1000000.times do |i|
				getAllFactors(i+1)
			end
		end
	end
end