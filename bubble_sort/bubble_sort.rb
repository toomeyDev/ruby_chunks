puts "Bubble Sort"

def bubble_sort(array)
  array.each_with_index do |element, index|
    if index+1 < array.size && element > array[index+1]
      temp = element
      array[index] = array[index+1]
      array[index+1] = temp
    end
    p array
  end
  array
end

bubble_sort([2,1,4,3,5])
bubble_sort([4,3,78,2,0,2])
