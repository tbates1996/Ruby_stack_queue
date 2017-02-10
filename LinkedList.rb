require_relative "Node.rb"
class LinkedList
	#Shows the beginins and end node of the linked list
	attr_accessor :head,:tail
	#Structure to define a slot data type
	
	#Initialize an empty Linked list
	def initialize
		@head = nil
		@tail = nil
	end
	#Empties the linked list 
	def purge 
		@head = nil
		@tail = nil
	end
	#Returns boolean value showing if the list is empty or not 
	def empty?
		@head.nil?
	end
	#Returns the first value in the list
	def first
		raise "ContainerEmpty" if @head.nil?
		@head
	end
	def last
		raise "ContainerEmpty" if @head.nil?
		@tail
	end
	def delete_top
		@head = @head.next
	end

	#Adds a bucket or adds to a current bucket in the list
	def prepend(data)
		tmp = Node.new(data)
		if @head.nil?
			@head = tmp
			@tail = tmp
		else 
			tmp.next = @head
			@head = tmp
		end

	end
		#tmp (insert tmp info here)
	def append(data)
		tmp = Node.new(data)
		if @head.nil?
			@head = tmp
			@tail = tmp
			
		else
			@tail.next = tmp
			@tail = tmp
			
		end
	end
	# Iterate through the current list and preform actions on the data in a code block
	def each
		current = @head
		while current != nil
			yield current.value
			current = current.next
		end
	end
end
