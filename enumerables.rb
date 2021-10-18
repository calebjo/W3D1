require 'byebug'

class Array

    def my_each(&prc)
        i = 0

        while i < self.length
            prc.call(self[i])

            i += 1
        end

        self
    end

    def my_select(&prc)
        new_arr = []
        
        self.my_each do |ele|
            if prc.call(ele)
                new_arr << ele
            end
        end

        new_arr
    end

    def my_reject(&prc)
        new_arr = []

        self.my_each do |ele|
            if !prc.call(ele)
                new_arr << ele
            end
        end

        new_arr
    end

    def my_any?(&prc)
        self.my_each do |ele|
            return true if prc.call(ele)
        end
        false
    end

    def my_all?(&prc)
        self.my_each do |ele|
            return false if !prc.call(ele)
        end
        true
    end

    def my_flatten
        flat_arr = []
        self.each do |ele|
            if !ele.is_a?(Array) 
                flat_arr << ele
            else
                flat_arr.concat(ele.my_flatten)
            end
        end
        flat_arr
    end
end


print [1, 2, 3, [4, [5, 6]], [[[7]], 8]].my_flatten # => [1, 2, 3, 4, 5, 6, 7, 8]

