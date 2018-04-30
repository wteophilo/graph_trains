require_relative '../lib/graph'
require_relative '../lib/node'
require_relative '../lib/edge'

def exec_trains
	set_variables
	hello
	outputs
end

private
def outputs
	output_1
	output_2
	output_3
	output_4
	output_5
	output_6
	output_7
	output_8
	output_9
	output_10
end

def set_variables
	@a = Node.new('a')
	@b = Node.new('b')
	@c = Node.new('c')
	@d = Node.new('d')
	@e = Node.new('e')
	@graph = Graph.new
	@graph.add_route(@a,Edge.new(@a,@b,5).next_route(Edge.new(@a,@d,5).next_route(Edge.new(@a,@e,7))))
	@graph.add_route(@b,Edge.new(@b,@c,4))
	@graph.add_route(@c,Edge.new(@c,@d,8).next_route(Edge.new(@c,@e,2)))
	@graph.add_route(@d,Edge.new(@d,@c,8).next_route(Edge.new(@d,@e,6)))
	@graph.add_route(@e,Edge.new(@e,@b,3))
end

def hello
	p "=================================="
	p "Solution of Kiwiland"
	p "=================================="
end


def output_1  
	route = Array.new
	route << @a
	route << @b
	route << @c
	p "Output#1: distance_between_ABC: #{@graph.distance_between(route)} "
end 

def output_2 
	route = Array.new
	route << @a
	route << @d
	p "Output #2: distance_between_AD: #{@graph.distance_between(route)}"
end

def output_3 
	route = Array.new
	route << @a
	route << @d
	route << @c
	p "Output #3: distance_between_ADC: #{@graph.distance_between(route)}"
end

def output_4
	route = Array.new
	route << @a
	route << @e
	route << @b
	route << @c
	route << @d
	p "Output #4: distance_between_AEBDC: #{@graph.distance_between(route)}"
end

def output_5
	route = Array.new
	route << @a
	route << @e
	route << @d		
	p "Output #5: distance_between_AED: #{@graph.distance_between(route)}"
end

def output_6
	p "Output #6: num_stops_CC3: #{@graph.num_stops(@c,@c,3)}"
end

def output_7
	p "Output #7: num_stops_AC4: #{@graph.num_stops(@a,@c,4)}"
end

def output_8
	p "Output #8: shortes_routes_AC: #{@graph.shortes_routes(@a,@c)}"
end

def output_9 
	p "Output #9: shortes_routes_BB: #{@graph.shortes_routes(@b,@b)}"
end

def output_10 
	p "Output #10: find_number_routes_within_CC30: #{@graph.number_routes_within(@c,@c,30)}"
end