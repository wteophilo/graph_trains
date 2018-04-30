require_relative 'edge'
require_relative 'graph'

class Distance
	attr_reader :depth, :distance
	
	def initialize(routes)
		@depth = 0
		@distance = 0
		@routes = routes
	end

	def calc_distance(cities, i)
		edge = @routes[cities[i]]
		until edge.nil?
			if edge.destination == cities[i + 1]
				@distance += edge.weight
				@depth += 1
				break
			end
			edge = edge.next	
		end
	end
end