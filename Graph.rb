require 'pry'

#General class for undirected graphs
class Graph
	attr_accessor :nodes

	def initialize
		@nodes = []
	end

	def gatherNode(data)
		return @nodes.select { |n| n.data == data }[0]
	end

	def insertEdge(start, finish)
		if start == finish || edge?(start, finish)
			raise "Invalid Edge input"
		end

		start.adjacent << finish
		finish.adjacent << start
	end

	def insertNode(data)
		node = Node.new(data)
		@nodes << node
	end

	def print
		@result = ""
		@nodes.each do |n|
			@result = @result + n.data
		end

		puts @result
	end

	class Node
		attr_accessor :adjacent, :data

		def initialize(data)
			@adjacent = []
			@data = data
		end
	end

	private

		def edge?(node1, node2)
			if node1.adjacent.include? node2
				return true
			else
				return false
			end
		end
end

@graph = Graph.new
@graph.insertNode("Node1")
@graph.insertNode("Node2")
@node1 = @graph.gatherNode("Node1")
@node2 = @graph.gatherNode("Node2")
@graph.insertEdge(@node1, @node2)

binding.pry