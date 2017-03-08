require_relative "Node.rb"
class LinkedList
	#Shows the beginins and end node of the linked list
	attr_accessor :head,:tail
	#Structure to define a slot data type
	
	#Initialize an empty Linked list
	def initialize node = nil
		if node == nil
			@head = nil
			@tail = nil
		else
			@head = node
			current = @head
			until current == nil
				if current.next == nil
					@tail = current
				end
				current = current.next
			end
		end
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
	def ordered_insert(data)
		
		if self.empty?
			self.prepend(data)
		else
			tmp = Node.new(data)
			current = @head
			if tmp.value <= @head.value
				self.prepend(data)
				return
			elsif tmp.value >= @tail.value
				self.append(data)
				return
			end
			until current.nil?
				if tmp.value <= current.next.value
					tmp.next = current.next
					current.next = tmp
					return
				end
				current = current.next
			end
		end
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
	def count 
		count = 0
		each {|node| count += 1 }
		count
	end
	def search(value)
		each {|node| return true if node == value}
		false
	end

	# Iterate through the current list and preform actions on the data in a code block
	def each
		current = @head
		while current != nil
			yield current.value
			current = current.next
		end
	end

	def mergeSort(list = @head)
		if list == nil || list.next == nil
			return list
		else
			a = list
			b = partition(list)
			left = mergeSort(a)
			right = mergeSort(b)
			merge_list(left,right)
		end
	end

	private

	def merge_list(a,b)
		if a == nil
			return b
		elsif b == nil
			return a
		elsif a.value > b.value
			result = b
			result.next = merge_list(a,b.next)
		elsif a.value < b.value
			result = a
			result.next = merge_list(a.next,b)
		end
		return result
	end

	def partition(top)
		if top == nil
			return nil
		else
			slow = top
			fast = top.next
			until fast == nil
				fast = fast.next
				if fast == nil
					break
				else
					fast = fast.next
					slow = slow.next
				end
			end
			tmp = slow.next
			slow.next = nil
			return tmp
		end
	end
end

