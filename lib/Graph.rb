#!
#Author: Christian Seremetis
#8 April 2018
#An outline for all forms of graphs
module Graph
	attr_reader :nodes

	#Returns the node with the given data.
	#@param data the data stored in the node
	def gatherNode(data)
	end

	#Add an edge to the graph.
	#@param start the starting node
	#@param finish the ending node 
	def insertEdge(start, finish)
	end

	#Adds a node to the graph.
	#nodes can be stand-alone and do not require an edge
	#@param data the data stored in the node
	def insertNode(data)
	end

	#Prints a string representation of the graph
	def print
	end

	#Searches over the nodes by breadth
	#@param root the starting node
	#@param subject the node we're looking for
	#@return the shortest path between nodes
	def breadthFirstSearch(root, subject)
	end

	#Only applies to subgraphs of connected nodes
	#@param root data stored in the starting node
	#@param subject what we're searching for
	def depthFirstSearch(root, subject)
		
	end
end