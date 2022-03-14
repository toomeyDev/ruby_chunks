puts "Bubble Sort"

def bubble_sort(array)
  sorted = array.clone
  swapped = false

  sorted.each_with_index do |element, index|
    if index+1 < sorted.size && element > sorted[index+1]
      temp = element
      sorted[index] = sorted[index+1]
      sorted[index+1] = temp
      swapped = true
    end
  end
  
  unless !swapped
    bubble_sort(sorted) # if not fully sorted, recall the method with the last sort completed
  else
    return sorted # once sorting is complete return final sorted array
  end
  
end

p bubble_sort([2,1,4,3,5])
p bubble_sort([4,3,78,2,0,2])
p bubble_sort([-5, 99, 101, 6, 76, 32, 509, -12, 50, 0, 23])
p bubble_sort([-99, -100, -150, -153, 0, 250, -999])
