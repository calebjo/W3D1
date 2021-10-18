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


    # def my_zip(*args)
    #     new_arr = Array.new(self.length) {Array.new(args.length+1)}
    #     #[[1, nil, nil],[nil, nil, nil],[nil, nil]]
    #     i = 0

    #     while i < self.length
    #         new_arr[i][0] = self[i]

    #         j = 1
    #         while j < args.length
    #             new_arr[i][j] = args[i][j-1]
    #             j += 1
    #         end

    #         i += 1
    #     end


    # end

# debugger
    def my_zip(*args)
        new_arr = Array.new(self.length) {Array.new}
        #[[1, 4],[],[]]

        # debugger
        (0..self.length-1).each do |self_ele_i| #0
            self_ele = self[self_ele_i]
            new_arr[self_ele_i] << self_ele

            # debugger
            (0..args.length-1).each do |args_ele_i| #1
                if args[args_ele_i] == nil
                    new_arr[self_ele_i] << nil
                else
                args_ele = args[args_ele_i][self_ele_i]
                new_arr[self_ele_i] << args_ele
                end
            end
        end

        new_arr
    end
         
    def my_rotate(val=1)
        new_arr = self[0..-1]

            if val > 0
                val.times { new_arr.push(new_arr.shift) }
            else
                val.abs.times { new_arr.unshift(new_arr.pop) }
            end
        
        new_arr
    end

    

end


