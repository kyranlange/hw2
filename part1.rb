# a)
# metaprogramming to the rescue!
class Numeric
  @@currencies = {'yen' => 0.013, 'euro' => 1.292, 'rupee' => 0.019, 'dollar' => 1.000}

  def method_missing(method_id)
    singular_currency = method_id.to_s.gsub( /s$/, '')
    if @@currencies.has_key?(singular_currency)
      self * @@currencies[singular_currency]
    else
      super
    end
  end

  def in(currency)
    singular_currency = currency.to_s.gsub(/s$/,'')
    if @@currencies.has_key?(singular_currency)
      self / @@currencies[singular_currency]
    end
  end
end

=begin
puts 5.dollar.in(:euros)
puts 10.euros.in(:rupees)
=end


# b)
class String
  def palindrome?
    string = self.downcase.gsub(/\W/, '');
    return string == string.reverse;
  end
end

=begin
puts "foo".palindrome?
puts "A man, a plan, a canal -- Panama".palindrome?
=end

# c)
module Enumerable
  def palindrome?
    if self.kind_of? Array
      return self == self.reverse
    else 
      return self.to_a.palindrome?
    end
  end
end

=begin
puts [1,2,3,2,1].palindrome?
puts [1,2,3,2,1,3].palindrome?
ha = {"a" => "b", "c" => "d"}
puts ha.palindrome?
=end
