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
	ll = LinkedList.new
	ll.prepend("Hello")
	ll.append("World!")
	ll.prepend("Demonstrating")
	ll.append("For my linked list.")
	puts <<-EOS.gsub /^\s+/, ""
		Expected:
		demonstrating
		Hello
		World!
		For my linked list.
	EOS
	puts
	puts "Actual:"
	ll.each{|string| puts string}
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
	puts "Actual:"
	oll.each{|num| puts num}
	puts
end

def stack_report
	st = Stack.new
	st.push("First entry")
	st.push("Second entry")
	st.push("Third entry")
	st.push("Fourth entry")
	st.push("Last entry")
	puts "Stack Report\n\n".rjust(20)
	puts <<-EOS.gsub /^\s+/, ""
			Expected:
			Last entry
			Fourth entry
			Third entry
			Second entry
			First entry
		EOS
		puts
	puts "Actual:"
	puts st.pop.value
	puts st.pop.value
	puts st.pop.value
	puts st.pop.value
	puts st.pop.value
	puts
end

def queue_report
	q = MyQueue.new
	q.enqueue([1,2,3])
	q.enqueue([4,5,6])
	q.enqueue([7,8,9])
	q.enqueue([10,11,12])
	q.enqueue([13,14,15])
	puts "Queue Report\n\n".rjust(20)
	puts <<-EOS.gsub /^\s+/, ""
			Expected:
			[1,2,3]
			[4,5,6]
			[7,8,9]
			[10,11,12]
			[13,14,15]
		EOS
		puts
		puts "Actual:"
		puts q.dequeue.value.to_s
		puts q.dequeue.value.to_s
		puts q.dequeue.value.to_s
		puts q.dequeue.value.to_s
		puts q.dequeue.value.to_s
end
main