require_relative './Base.rb'

module Graph
	#A graph implementation in which nodes can be broken
	#up into 2 sets
	class Bipartite < Graph::Base

		#Nodes are split into "red" and "black" colors
		def initialize
			@red = []
			@black = []
		end

		#Determines if the graph is cyclic
		def cycle?
			#...
		end

	end

	class Graph::Base::Node
		#Color determines which of 2 sets a node belongs to
		attr_accessor :color
	end
end