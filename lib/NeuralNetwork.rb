require_relative './Base.rb'

module Graph
  #"Neural Network" in this case is referring to a
  #graph broken into several "levels," in which the
  #nodes in each level are adjacent to each of the
  #nodes in the level above them. It is a cyclic,
  #connected graph.
  class NeuralNetwork < Graph::Base

    #Initializes a graph with a given number of
    #nodes and levels
    def initialize(num_nodes=0, num_levels=2)
      super()
      #number of nodes per level
      split = num_nodes / num_levels
      level_marker = 1

      while @nodes.length < num_nodes
        for i in 0...split
          n = self.insertNode(nil)
          n.level = level_marker
        end

        level_marker += 1
      end

      #Insert edges among levels
      for i in 1...(num_levels)
        vertices = level(i)
        adjacent = level(i + 1)
        vertices.each do |v|
          adjacent.each do |a|
            self.insertEdge(v, a)
          end
        end
      end

      puts "setup complete"
    end

    #In this implementation, we gather nodes by their
    #id, not their data
    def gatherNode(id)
      @nodes.bsearch { |n| n.data == data}
    end

    private
      #Returns an array of all the nodes in a certain 
      #level.
      #@param num the level
      def level(num)
        result = []

        for node in @nodes
          if node.level == num
            result.push(node)
          end
        end

        return result
      end
  end

  #Open up Base::Node to add level attribute
  class Graph::Base::Node
    attr_accessor :level
  end
end	
