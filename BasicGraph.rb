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

	def toString
		result = ""
		@nodes.each do |n|
			n.to.each do |t|
				result = result + "#{n.data} -> #{t.data}\n"
			end
		end

		print result
	end

	#Only applies to subgraphs of connected nodes
	#@param root data stored in the starting node
	#@param subject what we're searching for
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

					return nil
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