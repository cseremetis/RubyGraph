#!
#Author: Christian Seremetis
#8 April 2018
#An outline for all forms of graphs
module Graph
	attr_reader :nodes

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
	def toString
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
end