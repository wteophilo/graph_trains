require_relative '../lib/graph'
require_relative '../lib/node'
require_relative '../lib/edge'

describe Graph  do	
	before(:each) do
		@a = Node.new('a')
		@b = Node.new('b')
		@c = Node.new('c')
		@d = Node.new('d')
		@e = Node.new('e')
		@graph = Graph.new
		@graph.add_route(@a,Edge.new(@a,@b,5).nextRoute(Edge.new(@a,@d,5).nextRoute(Edge.new(@a,@e,7))))
		@graph.add_route(@b,Edge.new(@b,@c,4))
		@graph.add_route(@c,Edge.new(@c,@d,8).nextRoute(Edge.new(@c,@e,2)))
		@graph.add_route(@d,Edge.new(@d,@c,8).nextRoute(Edge.new(@d,@e,6)))
		@graph.add_route(@e,Edge.new(@e,@b,3))

	end

	it 'Output #1: distance_between_ABC' do 
		route = Array.new
		route << @a
		route << @b
		route << @c
		expect(@graph.distance_between(route)).to eq(9)
	end 

	it 'Output #2: distance_between_AD' do 
		route = Array.new
		route << @a
		route << @d
		expect(@graph.distance_between(route)).to eq(5)
	end

	it 'Output #3: distance_between_ADC' do 
		route = Array.new
		route << @a
		route << @d
		route << @c
		expect(@graph.distance_between(route)).to eq(13)
	end

	it 'Output #4: distance_between_AEBDC' do
		route = Array.new
		route << @a
		route << @e
		route << @b
		route << @c
		route << @d
		expect(@graph.distance_between(route)).to eq(22)
	end

	it 'Output #5: distance_between_AED' do
		route = Array.new
		route << @a
		route << @e
		route << @d		
		#binding.pry
		#expect(@graph.distance_between(route)).to raise_exception
		expect(@graph.distance_between(route)).to eq("NO SUCH ROUTE")
	end

	it 'Output #6: num_stops_CC3' do
		expect(@graph.num_stops(@c,@c,3)).to eq(2)
	end

	it 'Output #7: num_stops_AC4' do		
		expect(@graph.num_stops(@a,@c,4)).to eq(4)
	end

	it 'Output #8: shortes_routes_AC' do
		expect(@graph.shortes_routes(@a,@c)).to eq(9)
	end

	it 'Output #9: shortes_routes_BB' do
		expect(@graph.shortes_routes(@b,@b)).to eq(9)
	end

	it 'Output #10: find_number_routes_within_CC30' do
		expect(@graph.number_routes_within(@c,@c,30)).to eq(7)
	end


end