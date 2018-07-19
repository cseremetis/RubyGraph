require 'irb'

#Here, we just access the graph library without
#extending it.
require_relative '../lib/Base.rb'

#This is an example of a network built with Graph::Base.
#Note: nodes can store lambda functions or Procs, making
#them ideal for conducting a chain of operations

insertData =->(a) {a}
setWeightsUp =->(a) {a * 1.1} #increase by 10%
setWeightsDown =->(a) {a * 0.9 } #decrease by 10%
putsData =->(a) {puts a}

network = Graph::Base.new

$node1 = network.insertNode(insertData)
$node2 = network.insertNode(setWeightsUp)
$node3 = network.insertNode(setWeightsDown)
$node4 = network.insertNode(putsData)

network.insertEdge($node1, $node2)
network.insertEdge($node1, $node3)
network.insertEdge($node2, $node4)
network.insertEdge($node3, $node4)

def travDown(num)
	($node3.data.call($node1.data.call(num)))
end

def travUp(num)
	($node2.data.call($node1.data.call(num)))
end

def learn(a, init)
	while (a - init).abs > 0.001
			if a > init
				a = travDown(a)
			else
				a = travUp(a)
			end
	end

	$node4.data.call(a)

	return a
end

binding.irb