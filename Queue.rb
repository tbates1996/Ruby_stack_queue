require_relative "LinkedList.rb"

class MyQueue < LinkedList

	def initialize size = nil
		super size
	end
	
	def enqueue(data)
		append(data)
	end
	
	def dequeue
		raise "QueueEmpty" if empty?
		tmp = first
		delete_top
		tmp
	end
	def top 
		first
	end

end
