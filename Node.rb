class Node
	
	attr_accessor :value,:next
	include Comparable

	def initialize(val)
		@value = val
		@next = nil
	end
	
	
end
