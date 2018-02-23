class Fixnum
  # Fixnum#hash already implemented for you
end

class Array
  def hash
    total_hash = 0
    self.each_with_index do |x, idx|
      total_hash += (x.hash * idx)
    end

    total_hash
  end
end

class String
  def hash
    input = self.chars

    total_hash = 0
    input.each_with_index do |x, idx|
      total_hash += (x.ord * idx)
    end

    total_hash
  end
end

class Hash
  # This returns 0 because rspec will break if it returns nil
  # Make sure to implement an actual Hash#hash method
  def hash
    sum = 0

    self.each do |k,v|
      sum += k.to_s.ord
      sum += v.hash
    end

    sum
  end
end
