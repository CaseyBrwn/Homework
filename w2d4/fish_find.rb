require "byebug"

def fish_find  #O(n^2)
    fish = ['fish', 'fiiish', 'fiiiiish', 'fiiiish', 'fffish', 'ffiiiiisshh', 'fsh', 'fiiiissshhhhhh']
    longest_fish = ""
    fish.each do |fish1|
       longest_fish << fish1 if fish.none?{|ele| ele.length > fish1.length}
    end
    longest_fish 
end

p fish_find

def fish_merge(array)
    return self if array.length < 2
    mid = array.length/2
    left = array[0...mid].fish_merge
    right = array[mid..-1].fish_merge
    merge(left , right)
end

def merge(array1 , array2, &prc)
    new_array = array1 + array2
    return new_array.sort{|x,y| x.length <=> y.length}
end

p fish_merge(['fish', 'fiiish', 'fiiiiish', 'fiiiish', 'fffish', 'ffiiiiisshh', 'fsh', 'fiiiissshhhhhh'])

def_clever_octopus
 fish = ['fish', 'fiiish', 'fiiiiish', 'fiiiish', 'fffish', 'ffiiiiisshh', 'fsh', 'fiiiissshhhhhh']
    longest_fish = ""
    fish.each do |fish1|
       if fish1.length > longest_fish.length
        longest_fish = fish1
    end
    longest_fish 
end
