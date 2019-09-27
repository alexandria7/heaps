class HeapNode
  attr_reader :key, :value

  def initialize(key, value)
    @key = key
    @value = value
  end
end

class MinHeap
  def initialize
    @store = []
  end

  # This method adds a HeapNode instance to the heap
  # Time Complexity: O(logn) where n is the length of the @store
  # Space Complexity: O(1)
  def add(key, value = key)
    new_node = HeapNode.new(key, value)
    @store.push(new_node)

    if @store.length > 1
      heap_up((@store.length - 1))
    end
  end

  # This method removes and returns an element from the heap
  #   maintaining the heap structure
  # Time Complexity: O(logn) where n is the length of the @store
  # Space Complexity: O(1)
  def remove()
    return nil if @store.length == 0

    swap(0, -1)
    removed = @store.pop
    if @store.length > 1
      heap_down(0)
    end

    return removed.value
  end

  # Used for Testing
  def to_s
    return "[]" if @store.empty?

    output = "["
    (@store.length - 1).times do |index|
      output += @store[index].value + ", "
    end

    output += @store.last.value + "]"

    return output
  end

  # This method returns true if the heap is empty
  # Time complexity: O(1)
  # Space complexity: O(1)
  def empty?
    if @store.length == 0
      return true
    else
      return false
    end
  end

  private

  # This helper method takes an index and
  #  moves it up the heap, if it is less than it's parent node.
  #  It could be **very** helpful for the add method.
  # Time complexity: O(logn) where n is the length of the @store
  # Space complexity: O(logn)
  def heap_up(index)
    return if index <= 0

    parent_index = (index - 1) / 2

    if @store[index].key < @store[parent_index].key
      swap(index, parent_index)
      index = parent_index
      heap_up(index)
    end
  end

  # This helper method takes an index and
  #  moves it up the heap if it's smaller
  #  than it's parent node.

  # Time complexity: O(logn) where n is the length of the @store
  # Space complexity: O(logn)
  def heap_down(index)
    left_child = (index * 2) + 1
    right_child = (index * 2) + 2
    smallest = 0

    return if @store[left_child].nil?

    if @store[right_child].nil?
      smallest = left_child
    else
      if @store[left_child].key < @store[right_child].key
        smallest = left_child
      else
        smallest = right_child
      end
    end

    if @store[smallest].key < @store[index].key
      swap(smallest, index)
      index = smallest
      return heap_down(index)
    end
  end

  # If you want a swap method... you're welcome
  def swap(index_1, index_2)
    temp = @store[index_1]
    @store[index_1] = @store[index_2]
    @store[index_2] = temp
  end
end
