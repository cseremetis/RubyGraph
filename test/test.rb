#Unit tests using microtest

require 'test/unit'

require_relative '../BasicGraph.rb'

class GraphTest < Test::Unit::TestCase
	#create test case
	def setup
		@graph = BasicGraph.new
	end

	#gathering a node should actually gather the right node
	def test_gather_node
		graph.insertNode("A")
		a = @graph.gatherNode("A")

		assert_equal(a.data, "A")
	end

	#adding node should increase length of node array
	#and store data in new node
	def test_add_node
		a = @graph.insertNode("A")
		assert_equal(a.data, "A")
		assert_equal(@graph.nodes.length, 1)
	end

	#adding edge should create appropriate
	#path between nodes
	def test_add_edge
		a = @graph.insertNode("A")
		b = @graph.insertNode("B")
		@graph.insertEdge(a, b)
		assert_equal(a.to[0], b)
		assert_equal(b.from[0], a)
	end

	#running bfs should find shortest path
	def test_bfs
		a = @graph.insertNode("A")
		b = @graph.insertNode("B")
		c = @graph.insertNode("C")
		d = @graph.insertNode("D")
		e = @graph.insertNode("E")

		@graph.insertEdge(a, b)
		@graph.insertEdge(a, c)
		@graph.insertEdge(b, d)
		@graph.insertEdge(c, e)

		result = @graph.breadthFirstSearch(a, e)
		assert_equal(result, [a, c, e])
	end
end