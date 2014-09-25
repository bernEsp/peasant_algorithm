class Digit
  def initialize
    @num, @digits = nil
  end

  def digital_root(num)
    @num = num
    @digits =  find_digits(@num)
    until @digits.size == 1 do 
      @digits.each_with_index {|d, index| print "#{d}"; print "+" if index+1 < @digits.size}
      puts "\n"
      num_result = @digits.inject{|sum, x| sum + x}  
      puts num_result
      puts "-------------------------"
      @digits = find_digits(num_result)
    end
  end

  private
    def find_digits(num)
      digits = num.to_s.scan(/\d/)
      digits.collect(&:to_i)
    end

end
