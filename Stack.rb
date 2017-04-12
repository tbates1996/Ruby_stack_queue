require_relative "LinkedList.rb"
class Stack < LinkedList

	def initialize size = nil
		super size
	end

	def push(data)
		prepend(data)
	end
	def pop
		raise "StackEmpty" if empty?
		tmp = first
		delete_top
		tmp
	end
	def top 
		first
	end

end
