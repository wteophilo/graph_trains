require_relative 'node'
require_relative 'edge'

class Graph
	attr_accessor :routes

	def initialize
		@routes= {}
	end 

	def add_route(node,edge)
		@routes.merge!({node => edge})
	end

	def distance_between(cities)
		return 0 if cities.count < 2 
		i = 0
		distance = 0
		while i < cities.count-1
			if @routes.key?(cities[i])
				edge = @routes[cities[i]]
				while !edge.nil?
					if edge.destination == cities[i+1]
						distance = distance + edge.weight
						break
					end
					edge = edge.next
				end 
			end
			i = i+1
		end
		distance
	end

	def num_stops(node_start,node_end,total_stop)
		find_routes(node_start,node_end,0,total_stop)
	end

	def shortes_routes(node_start,node_end)
		find_shortes_routes(node_start,node_end,0,0)
	end

	def number_routes_within(node_start,node_end,max_distance)
		find_number_routes_within(node_start,node_end,0,max_distance)
	end

	private

	def find_number_routes_within(node_start,node_end,weight,max_distance)
		total_routes = 0
		
		if @routes.key?(node_start) && @routes.key?(node_end)
			edge = @routes[node_start]
			while !edge.nil?
				weight = weight + edge.weight
				if weight <= max_distance
					if edge.destination == node_end
						total_routes = total_routes+1
						total_routes = total_routes + find_number_routes_within(edge.destination,node_end,weight,max_distance)
						edge = edge.next
						next
					else
						total_routes = total_routes + find_number_routes_within(edge.destination,node_end,weight,max_distance)
						weight = weight - edge.weight
					end
				else
					weight = weight - edge.weight	
				end
				edge = edge.next
			end
		end

		total_routes
		
	end

	def find_shortes_routes(node_start,node_end,weight,shortest_route)
		if @routes.key?(node_start) && @routes.key?(node_end)
			node_start.visited = true
			edge = @routes[node_start]
			while !edge.nil?
				#binding.pry
				weight = weight + edge.weight if(edge.destination == node_end || !edge.destination.visited)

				if edge.destination == node_end
					if shortest_route == 0 || weight < shortest_route
						shortest_route = weight
						node_start.visited = false
						return shortest_route
					end
				elsif !edge.destination.visited
						shortest_route = find_shortes_routes(edge.destination,node_end,weight,shortest_route)
						weight = weight-edge.weight
				end
				edge = edge.next
			end

		end
		node_start.visited = false
		shortest_route
	end

	def find_routes(node_start,node_end,depth,total_stop)
		total_routes = 0
		if @routes.key?(node_start) && @routes.key?(node_end)
			depth = depth + 1
			return 0 if depth > total_stop
			node_start.visited = true
			edge = @routes[node_start]
			while !edge.nil?
				if(edge.destination == node_end)
					total_routes = total_routes+1
					edge = edge.next
					next
				elsif(!edge.destination.visited)
					total_routes = total_routes + find_routes(edge.destination,node_end,depth,total_stop)
					depth = depth-1
				end
				edge = edge.next
			end
		end
		node_start.visited = false
		total_routes
	end

end