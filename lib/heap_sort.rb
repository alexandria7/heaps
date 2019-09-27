require_relative "min_heap"

# This method uses a heap to sort an array.
# Time Complexity:  O(nlogn + nlogn) = O(nlogn) where n is the size of the list
# Space Complexity: O(n) where n is the size of the list
def heapsort(list)
  return list if list.length <= 1

  heap = MinHeap.new

  i = 0
  while i < list.length
    heap.add(list[i])
    i += 1
  end

  i = 0
  while i < list.length
    removed = heap.remove()
    list[i] = removed
    i += 1
  end

  return list
end
