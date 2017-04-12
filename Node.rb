class Node
	
	attr_accessor :value,:next,:previous
	include Comparable

	def initialize(val)
		@value = val
		@next = nil
	end
	
	
end
