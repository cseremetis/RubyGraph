#Unit tests using microtest

require 'test/unit'

require_relative '../lib/Base.rb'

class BaseTest < Test::Unit::TestCase
  #create test case
  def setup
    @graph = Graph::Base.new
  end

  #gathering a node should actually gather the right node
  def test_gather_node
    @graph.insertNode("A")
    a = @graph.gatherNode("A")

    assert_equal(a.data, "A")
  end

  #adding node should increase length of node array
  #and store data in new node
  def test_add_node
    a = @graph.insertNode("A")
    assert_equal(a.data, "A")
    assert_equal(@graph.length, 1)
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

  #running bfs should return true for 2 vertices in graph
  def test_bfs_path_exists
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
    assert_true(result)
  end

  #running bfs should return false if no path between vertices
  def test_bfs_no_path
    a = @graph.insertNode("A")
    b = @graph.insertNode("B")
    c = @graph.insertNode("C")
    d = @graph.insertNode("D")
    e = @graph.insertNode("E")

    @graph.insertEdge(a, b)
    @graph.insertEdge(a, c)
    @graph.insertEdge(b, d)

    result = @graph.breadthFirstSearch(a, e)
    assert_false(result)
  end

  #running bfs should set pathMarkers to shortest path
  def test_bfs_path
    a = @graph.insertNode("A")
    b = @graph.insertNode("B")
    c = @graph.insertNode("C")
    d = @graph.insertNode("D")
    e = @graph.insertNode("E")

    @graph.insertEdge(a, b)
    @graph.insertEdge(a, c)
    @graph.insertEdge(b, d)
    @graph.insertEdge(c, e)

    @graph.breadthFirstSearch(a, e)

    node = e
    path = []

    while node.pathMarker
      path.push(node)
      node = node.pathMarker
    end

    path.push(a)

    assert_equal(path, [e, c, a])
  end
end
