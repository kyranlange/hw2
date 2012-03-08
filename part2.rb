class CartesianProduct
  include Enumerable
  
  def initialize(a,b)
    @a, @b = a, b
  end 
  
  def each
    @a.each do |ael|
      @b.each do |bel|
        yield [ael, bel]
      end
    end
  end
end

=begin
c = CartesianProduct.new([:a,:b], [4,5])
c.each { |elt| puts elt.inspect }
# [:a, 4]
# [:a, 5]
# [:b, 4]
# [:b, 5]


c = CartesianProduct.new([:a,:b], [])
c.each { |elt| puts elt.inspect }
# (nothing printed since Cartesian product
# of anything with an empty collection is empty)

c = CartesianProduct.new([:a,:b,:c], [4,5])
c.each { |elt| puts elt.inspect }
#[[:a,4],[:a,5],[:b,4],[:b,5],[:c,4],[:c,5]]
=end