#Unit tests using microtest
require 'microtest'
require 'microtest/assertions'
require_relative '../BasicGraph.rb'

def setup
	@graph = BasicGraph.new
end