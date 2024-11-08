# holds all the nodes
class LinkedList
  attr_reader :head

  def initialize
    @head = nil
  end

  def append(value)
    new_node = Node.new(value)
    if head.nil?
      self.head = new_node
      return
    end

    tmp = head
    tmp = tmp.next_node until tmp.next_node.nil?
    tmp.next_node = new_node
  end

  def prepend(value)
    self.head = Node.new(value, head)
  end

  def size
    cur_node = head
    num_nodes = 0
    until cur_node.nil?
      cur_node = cur_node.next_node
      num_nodes += 1
    end
    num_nodes
  end

  def tail
    return nil if head.nil?

    cur_node = head
    cur_node = cur_node.next_node until cur_node.next_node.nil?
    cur_node
  end

  def at(index)
    return nil if head.nil?
    return nil if index >= size

    count = 0
    cur_node = head
    until count == index
      cur_node = cur_node.next_node
      count += 1
    end
    cur_node
  end

  def pop
    return nil if head.nil?

    if head.next_node.nil?
      self.head = nil
      return
    end
    cur_node = head
    prev_node = nil
    until cur_node.next_node.nil?
      prev_node = cur_node
      cur_node = cur_node.next_node
    end
    prev_node.next_node = nil
  end

  def contains?(value)
    return false if head.nil?

    cur_node = head
    until cur_node.nil?
      return true if cur_node&.value == value

      cur_node = cur_node.next_node
    end
    false
  end

  def find(value)
    return nil if head.nil?

    index = 0
    cur_node = head
    until cur_node.nil?
      return index if cur_node&.value == value

      index += 1
      cur_node = cur_node.next_node
    end
    nil
  end

  def to_s
    return "nil" if size <= 0

    output = ""
    cur_node = head
    arr = []
    until cur_node.nil?
      arr << cur_node.value
      cur_node = cur_node.next_node
    end
    last_index = size - 1

    arr.each_with_index do |value, index|
      output << if index == last_index
                  "( #{value} ) -> nil"
                else
                  "( #{value} ) -> "
                end
    end
    output
  end

  def insert_at(value, index)
    return nil if index > size

    if index.zero?
      prepend(value)
      return
    end
    if index == size-1
      append(value)
      return
    end

    counter = 0
    cur_node = head
    prev_node = nil
    until counter == index
      prev_node = cur_node
      cur_node = cur_node.next_node
      counter += 1
    end
    prev_node.next_node = Node.new(value, cur_node)
  end

  def remove_at(index)
    return nil if head.nil? || index >= size

    if size == 1 && index.zero?
      self.head = nil
      return
    end

    if index.zero?
      self.head = head.next_node
      return
    end

    if index == size - 1
      at(index - 1).next_node = nil
      return
    end

    counter = 0
    cur_node = head
    until counter == index
      prev_node = cur_node
      cur_node = cur_node.next_node
      counter += 1
    end
    prev_node.next_node = cur_node.next_node
  end

  private

  attr_writer :head
end

# represents a single node in the linked list
class Node
  attr_accessor :value, :next_node

  def initialize(value = nil, next_node = nil)
    @value = value
    @next_node = next_node
  end
end

my_list = LinkedList.new
my_list.insert_at(10, 0)
my_list.remove_at(0)
# my_list.insert_at(30, 2)
# puts "before : #{my_list}"

puts "my_list : #{my_list}"
# puts "after : #{my_list}, head : #{my_list.head.value}, tail : #{my_list.tail.value}"

# puts my_list
# my_list.remove_at(0)
# puts my_list

# puts my_list.contains?(1)
# puts my_list.contains?(2)
# puts my_list.contains?(3)
# puts my_list.contains?(4)
# puts my_list.contains?(5)
#
# puts my_list.find(1)
# puts my_list.find(2)
# puts my_list.find(3)
# puts my_list.find(4)
# puts my_list.find(5)
# puts my_list

# puts "\n\nbefore pop examine \n\n"
# my_list.examine

# puts "\n\npop"
# pp my_list.pop
# pp my_list.pop
# pp my_list.pop
# puts my_list.size
#
# puts my_list.at(0)
# puts my_list.at(1)
# puts my_list.at(2)
# puts my_list.at(3)
# puts my_list.at(4)
# puts "\n\nafter pop examine \n\n"
# my_list.examine

# test = LinkedList.new
# test.append(10)
# test.pop
# puts test
# puts test.head&.value
# puts test.tail&.value
