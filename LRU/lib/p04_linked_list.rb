class Node
  attr_accessor :key, :val, :next, :prev

  def initialize(key = nil, val = nil)
    @key = key
    @val = val
    @next = nil
    @prev = nil
  end

  def to_s
    "#{@key}: #{@val}"
  end

  def remove
    # optional but useful, connects previous link to next link
    # and removes self from list.
    self.prev.next = self.next
    self.next.prev = self.prev
  end
end

class LinkedList
  #attr_reader :first, :last

  def initialize
    @head = Node.new
    @tail = Node.new

    @head.next = @tail
    @tail.prev = @head
  end

  def first
    @head.next
  end

  def last
    @tail.prev
  end

  def [](i)
    counter = 0
    answer = self.first

    until counter == i
      answer = answer.next
      counter += 1
    end

    return answer unless answer.nil?
    nil
  end

  def empty?
    @tail.prev == @head
  end

  def get(target)

    element = get_node(target)

    return element.val unless element.nil?
    nil
  end

  def get_node(key)
    element = self.first

    until element.key == key
      element = element.next
      break if element.nil?
    end

    return element unless element.nil?
    nil
  end

  def include?(key)
    element = get_node(key)
    return false if element.nil?
    true
  end

  def append(key, val)
    node = Node.new(key, val)
    node.next = @tail
    node.prev = @tail.prev
    node.next.prev = node
    node.prev.next = node

  end

  def update(target, val)
    element = get_node(target)

    element.val = val unless element.nil?
  end

  def remove(key)
    element = get_node(key)
    element.remove unless element.nil?

  end

  def each(&prc)
    node = self.first

    until node == @tail
      prc.call(node)
      node = node.next
    end

  end

  # uncomment when you have `each` working and `Enumerable` included
  # def to_s
  #   inject([]) { |acc, link| acc << "[#{link.key}, #{link.val}]" }.join(", ")
  # end
end
