

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

    





end



