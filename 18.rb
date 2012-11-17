class Node
	attr_accessor :left, :right, :value, :sum

	def initialize value = 0, left = nil, right = nil
		@value = value
		@left = left
		@right = right
		@sum = -1
	end

	def find_max_sum_req node
		left_sum = (node.left != nil ? 
		(node.left.sum != -1 ? node.left.sum : (find_max_sum_req node.left)) : 0)
		right_sum = (node.right != nil ? 
	    (node.right.sum != -1 ? node.right.sum : (find_max_sum_req node.right)) : 0)
		node.sum = node.value + ((left_sum > right_sum) ? left_sum : right_sum)
		node.sum
	end

	def find_max_sum
		find_max_sum_req self
	end

	def to_s
		"( " + value.to_s + " -> " + 
			(child_to_s left) + ", " + (child_to_s right) + ") "
	end

	def child_to_s child
		child != nil ? child.to_s : "nil"
	end

	def child_sum child
		child != nil ? child.value : 0
	end

	protected :child_to_s, :child_sum, :find_max_sum_req
end

def build_tree name
	file = File.new(name, 'r')
	upper_row, current_row = Array.new, Array.new
	root = Node.new
	i = 0
	while line = file.gets
		current_row.clear
		j = 0
		line.split(' ').each do |num|
			num = num.to_i
			node = Node.new(num)
			if i == 0 then 
				root.value = num 
				node = root
			else
				if j < upper_row.count then
					upper_row[j].left = node
				end
				if j > 0 then
					upper_row[j - 1].right = node
				end
			end
			current_row << node
			j += 1
		end
		upper_row.clear
	    upper_row = upper_row + current_row
		i += 1
	end
	root
end

tree = (build_tree ARGV[0])
puts tree.find_max_sum
