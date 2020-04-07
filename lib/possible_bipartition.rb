def possible_bipartition(dislikes)
  # 0 - not colored
  # 1 - blue
  # -1 - red
  color_groups = Array.new(dislikes.length, 0)

  for i in 0..dislikes.length-1 do
    if bfsBipartitioned(i, color_groups, dislikes) == false 
      return false
    end
  end

  return true
 end

 def bfsBipartitioned(dog, color_groups, dislikes)
  if color_groups[dog] != 0
    return true
  end

  queue = Queue.new();
  queue << [dog, 1]

  while !queue.empty?
    frame = queue.shift
    currentDog = frame[0]
    currentColor = frame[1]
    color_groups[currentDog] = currentColor
    dislikes[currentDog].each do |neighborDog|
      invert_color = currentColor*-1
      if color_groups[neighborDog] == 0
        queue << [neighborDog, invert_color]
      elsif color_groups[neighborDog] == currentColor 
        return false
      end
    end
  end

  return true
 end