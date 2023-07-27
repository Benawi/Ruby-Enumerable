require_relative 'MyEnumerable'

class MyList
  include MyEnumerable

  attr_accessor :list, :name

  @rules = [[:@list, 'array', :not_null]]

  def initialize(*list)
    @list = list
  end

  def each(&block)
    return unless block_given?

    @list.each(&block)
  end
end

list = Mylist.new(1, 2, 3, 4)

puts(list.all? { |e| e < 5 })

puts(list.any? { |e| e == 2 })

p(list.filter(&:even?))