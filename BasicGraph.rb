require_relative './lib/Graph.rb'


#General class for directed graphs
#Edges do not store data
class BasicGraph include Graph

	QUEUE = []

	#Public constructor initializes nodes array.
	def initialize
		@nodes = []
	end

	def gatherNode(data)
		@nodes.bsearch { |n| n.data == data}
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
				result += "#{n.data} -> #{t.data}\n"
			end
		end

		print result
	end

	def breadthFirstSearch(root, subject)
		#the shortest path between the two nodes
		path = []
		QUEUE.insert(0, root)

		while QUEUE.any?
			node = QUEUE.pop
			node.to.each do |t|
				t.pathMarker = node

				if t == subject
					return true
				end

				QUEUE.insert(0, t)
			end
		end

		return false
	end

	# DFS Implementation here starts from root,
	# adds all outgoing vertices into the QUEUE
	# and runs recursively until we find the subject
	def depthFirstSearch(root, subject)
		#puts root.data
		if root == subject
			return root
		elsif !root.to.any?
			return root
		else
			root.to.each do |n|
				#puts n.data
			 	QUEUE.insert(0, n)
			end
		end

		loop do
			node = QUEUE.pop
			root.pathMarker = node
			@tester = depthFirstSearch(node, subject)
			break if @tester == subject
		end

		return @tester
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
