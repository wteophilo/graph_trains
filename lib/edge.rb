class Edge
	attr_accessor :origin
	attr_accessor :destination
	attr_reader  :next
	attr_accessor :weight

	def initialize(origin,destination,weight)
		@origin = origin
		@destination = destination
		@weight = weight
		@next = nil
	end

	def nextRoute(edge)
		@next = edge
		self
	end
end