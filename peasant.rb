class Peasant
  def initialize(x=0, y=0)
    @x, @y, @xn, @yn = x, y, x, y
    @x_column, @y_column, @result_column = [@x], [@y], []
    @result = @y
    @total = 0
  end

  def multiply
    until @xn == 1 do
      if @xn % 2 != 0
        @result_column << @y_column.last
      else
        @result_column << 0
      end
      @xn = (@xn / 2).floor
      @result *= 2
      @y_column << @result
      @x_column << @xn
    end
    @result_column << @result
    @total = @result_column.inject{|sum, x| sum + x }
  end

  def multiply_old
    @x_column, @y_column, @result_column = [], [],[]
    until @xn == 0 do
      @x_column << @xn
      @xn = (@xn / 2).floor
    end
    @x_column.each_with_index do |x, index| 
      factor = index == 0 ? 1 : 2
      @yn = @yn * factor
      @y_column << @yn
      if x % 2 != 0
        @result_column << @yn
      else
        @result_column << 0
      end
    end
    @total = @result_column.inject{|sum, x| sum + x }
  end

  def multiply_v1
    @x_column, @y_column, @result_column = [], [],[]
    until @xn == 0 do
      @x_column << @xn
      @xn = (@xn / 2).floor
    end
    @x_column.each_with_index do |x, index| 
      factor = index == 0 ? 1 : 2
      @yn = @yn * factor
      @y_column << @yn
    end
    @x_column.each_with_index do |x, index| 
      if x % 2 != 0
        @result_column << @y_column[index]
      else
        @result_column << 0
      end
    end
    @total = @result_column.inject{|sum, x| sum + x }
  end

  def details
    puts "x | y | prod"
    @x_column.size.times do |index|
      puts "#{@x_column[index]} | #{@y_column[index]} | #{@result_column[index]}"
    end 
    puts "_____________"
    puts "         #{@total}"
  end

end
