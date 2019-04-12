class Stack
    def initialize
        @stack = Array.new
    end

    def push(el)
        @stack.push(el)
    end

    def pop
      @stack.pop
    end

    def peek
      @stack[-1]
    end
  end

#   p stack = Stack.new
#   p stack.push("Hello Stack!")
#   p stack.push(25)
#   p stack.pop
#   p stack.push(Hash.new {|h,k| h[k] = Array.new })
#   p stack.pop
#   p stack

  class Queue
    def initialize
        @queue = Array.new
    end

    def push(el)
        @queue.unshift(el)
    end

    def pop
      @queue.pop
    end

    def peek
      @queue[-1]
    end
  end

# p queue = Queue.new
# p queue.push("Hello Queue!")
# p queue.push(54)
# p queue.push(":)")
# queue.pop
# p queue

class Map

    def initialize
        @store = Array.new
    end

    def set(val1 , val2)
        new_array = [val1 , val2]
        if !@store.include?(new_array)
            @store << new_array
        end
        @store.each_with_index do |ele1 , idx1|
            ele1.each_with_index do |ele2 , idx2|
                if val1 == ele2 && idx2 == 0
                    @stores[idx1][1]= val2
                end
            end
        end

    end




end

p map = Map.new
map.set(3,4)
p map
