require_relative "LinkedList.rb"
class Stack < LinkedList

	def initialize
		super
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
