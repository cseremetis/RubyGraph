#!
#Author: Christian Seremetis
#8 April 2018
#An outline for all forms of graphs
module Graph
  class Base
    QUEUE = []

    #Public constructor initializes nodes array.
    def initialize
      #used to assign node ids
      @counter = 1;
      @nodes = []
    end

    #Returns the node with the given data.
    #@param data the data stored in the node
    def gatherNode(data)
      @nodes.bsearch { |n| n.data == data}
    end

    #Returns the number of nodes in the graph
    def length
      @nodes.length
    end

    #Add an edge to the graph.
    #@param start the starting node
    #@param finish the ending node
    def insertEdge(start, finish)
      if start == finish || edge?(start, finish)
        raise "Invalid Edge input"
      end

      start.to << finish
      finish.from << start
    end

    #Adds a node to the graph.
    #nodes can be stand-alone and do not require an edge
    #@param data the data stored in the node
    def insertNode(data)
      node = Node.new(data)
      node.id = @counter
      @nodes << node
      @counter += 1
      return node
    end

    #Deletes a node from the graph.
    #@param node the node we're removing
    def removeNode(node)
      if node.to.any? || node.from.any?
        raise "cannot remove node without removing edges first"
      end

      @nodes.delete(node)
    end

    #Deletes an edge from the graph
    #@param start the starting node
    #@param finish the ending node
    def removeEdge(start, finish)
      start.to.delete(finish)
      finish.from.delete(start)
    end

    #Prints a string representation of the graph
    def toString
      result = ""
      @nodes.each do |n|
        n.to.each do |t|
          result += "#{n.id} -> #{t.id}\n"
        end
      end

      print result
    end

    #Searches over the nodes by breadth
    #@param root the starting node
    #@param subject the node we're looking for
    #@return the shortest path between nodes
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

    #Only applies to subgraphs of connected nodes
    #DFS Implementation here starts from root,
    #adds all outgoing vertices into the QUEUE
    #and runs recursively until we find the subject
    def depthFirstSearch(root, subject)
      if root == subject
        return root
      elsif !root.to.any?
        return root
      else
        root.to.each do |n|
          QUEUE.insert(0, n)
        end
      end

      loop do
        node = QUEUE.pop
        #Sets pathMarkers so we can backtrace routes by
        #iterating through nodes
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
      attr_accessor :pathMarker, :id

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
end
