require_relative './lib/Graph.rb'


#General class for directed graphs
#Edges do not store data
class BasicGraph include Graph

	#Public constructor initializes nodes array.
	def initialize
		@nodes = []
	end

	#Finds a specific node within the graph.
	#@param data stored in the node we're looking for
	def gatherNode(data)
		@nodes.select { |n| n.data == data }[0]
	end

	def insertEdge(start, finish)
		if start == finish || edge?(start, finish)
			raise "Invalid Edge input"
		end

		start.to << finish
		finish.from << start
	end

	
	def insertNode(data)
		node = Node.new(data)
		@nodes << node
		return node
	end

	def print
		result = ""
		@nodes.each do |n|
			n.to.each do |t|
				result = result + "#{n.data} -> #{t.data}\n"
			end
		end

		print result
	end

	def breadthFirstSearch(root, subject)
		queue = []
		#the shortest path between the two nodes
		path = []
		queue.insert(0, root)

		while queue.any?
			node = queue.pop
			node.to.each do |t|
				t.pathMarker = node

				if t == subject
					counter = subject
					while counter.pathMarker != nil
						path.insert(0, counter)
						counter = counter.pathMarker
					end

					path.insert(0, root)
					
					path.each do |p|
						puts p.data
					end

					return path
				end

				queue.insert(0, t)
			end
		end

		puts "no path between nodes"
	end

	#Only applies to subgraphs of connected nodes
	#@param root data stored in the starting node
	#@param subject what we're searching for
	def depthFirstSearch(root, subject)
		#...
	end

	#Nested Node class
	#Nodes store three instance variables
	#to: an array of adjacent nodes from which the given one points
	#from: an array of adjacent nodes pointing towards the given one
	#data: the data stored in the node
	class Node
		attr_reader :to, :from, :data
		attr_accessor :pathMarker

		#Public constructor.
		#@param data the data stored in the node
		def initialize(data)
			@to = []
			@from = []
			@data = data
		end
	end

	private
		#Checks to see if an edge exists between two nodes
		def edge?(start, finish)
			if start.to.include? finish
				true
			else
				false
			end
		end
end