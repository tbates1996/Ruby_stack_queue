require "./LinkedList.rb"
require "./Stack.rb"
require "./Queue.rb"
$stdout.reopen("report.txt","w")

def main
	linked_list_report
	ordered_linked_list_report
	stack_report
	queue_report
end

def linked_list_report
	puts "Linked List Report\n\n".rjust(25)
	ll = LinkedList.new(6)
	ll.prepend("Hello")
	ll.append("World!")
	ll.prepend("Demonstrating")
	ll.append("For my linked list.")
	ll.prepend("This is a test entry")
	ll.append("Item 6")
	puts <<-EOS.gsub /^\s+/, ""
		Expected:
		This is a test entry
		Demonstrating
		Hello
		World!
		For my linked list.
		Item 6
	EOS
	puts
	puts "Is this list full? #{ll.full?}" 
	puts "Is this list empty? #{ll.empty?}"
	puts
	puts "Actual:"
	ll.each{|string| puts string}
	ll.delete_top
	ll.delete_bottom
	ll.append("Two items have been deleted")
	ll.delete_top
	ll.prepend("The first three are now missing")
	puts
	puts "Is this list full? #{ll.full?}" 
	puts "Is this list empty? #{ll.empty?}"
	puts
	puts "After delete and insert:"
	ll.each{|node| puts node}
	puts
end

def ordered_linked_list_report
	puts "Ordered Linked List Report\n\n".rjust(30)
	oll = LinkedList.new
	oll.ordered_insert(55)
	oll.ordered_insert(10)
	oll.ordered_insert(-2)
	oll.ordered_insert(553)
	oll.ordered_insert(23)
	oll.ordered_insert(8)
	oll.ordered_insert(-96)
	puts <<-EOS.gsub /^\s+/, ""
		Expexted:
		-96
		-2
		8
		10
		23
		55
		553
	EOS
	puts
	puts "Is this list full? #{oll.full?}" 
	puts "Is this list empty? #{oll.empty?}"
	puts
	puts "Actual:"
	oll.each{|num| puts num}
	oll.delete_bottom
	oll.delete_top
	oll.ordered_insert(-10)
	oll.ordered_insert(823)
	oll.ordered_insert(28)
	puts
	puts "Is this list full? #{oll.full?}" 
	puts "Is this list empty? #{oll.empty?}"
	puts
	puts "Ordered linked list after insertions and deletions"
	oll.each{|num| puts num}
	puts
end

def stack_report
	st = Stack.new(6)
	st.push("First entry")
	st.push("Second entry")
	st.push("Third entry")
	st.push("Fourth entry")
	st.push("Fifth entry")
	st.push("Last entry")
	puts "Stack Report\n\n".rjust(20)
	puts
	puts "Is this stack full? #{st.full?}" 
	puts "Is this stack empty? #{st.empty?}"
	puts
	puts <<-EOS.gsub /^\s+/, ""
			Expected:
			Last entry
			Fifth entry
			Fourth entry
			Third entry
			Second entry
			First entry
		EOS
	puts
	puts "Actual:"
	st.each{|val| puts val}
	puts
	puts "Pop 1: #{st.pop.value}"
	puts "Pop 2: #{st.pop.value}"
	puts "Pop 3: #{st.pop.value}"
	st.push("First new entry")
	st.push("Second new entry")
	puts
	puts "Is this stack full? #{st.full?}" 
	puts "Is this stack empty? #{st.empty?}"
	puts
	puts "Actual after pop and push:"
	until st.empty?
		puts st.pop.value
	end
	puts
	puts "Is this stack empty? #{st.empty?}"
	puts
end

def queue_report
	q = MyQueue.new
	q.enqueue([1, 2, 3])
	q.enqueue([4, 5, 6])
	q.enqueue([7, 8, 9])
	q.enqueue([10, 11, 12])
	q.enqueue([13, 14, 15])
	q.enqueue([16, 17, 18])
	puts "Queue Report\n\n".rjust(20)
	puts <<-EOS.gsub /^\s+/, ""
			Expected:
			[1, 2, 3]
			[4, 5, 6]
			[7, 8, 9]
			[10, 11, 12]
			[13, 14, 15]
			[16, 17, 18]
		EOS
	puts
	puts "Is this queue full? #{q.full?}" 
	puts "Is this queue empty? #{q.empty?}"
	puts
		puts "Actual Before Dequeue:"
		q.each do |node|
			puts node.to_s
		end
		puts
		puts "Dequeue 1: #{q.dequeue.value.to_s}"
		puts "Dequeue 2: #{q.dequeue.value.to_s}"
		puts
		puts "Actual After Dequeue:"
		q.each do |node|
			puts node.to_s
		end
	puts
	puts "Is this queue full? #{q.full?}" 
	puts "Is this queue empty? #{q.empty?}"
	puts
end
main