require_relative 'p02_hashing'

class HashSet
  attr_reader :count, :store

  def initialize(num_buckets = 20)
    @store = Array.new(num_buckets) { Array.new }
    @count = 0
  end

  def insert(num)
    resize! if count == num_buckets
    unless include?(num)
      self[num] << num
      @count += 1
    end
  end

  def remove(num)
    self[num].delete(num)
  end

  def include?(num)
    self[num].include?(num)
  end

  private

  def [](num)
    # optional but useful; return the bucket corresponding to `num`
    idx = num.hash % num_buckets
    @store[idx]
  end

  def num_buckets
    @store.length
  end

  def resize!

    #reset whole store
    new_store = Array.new(num_buckets * 2) { Array.new }
    @count = 0

    @store.each do |bucket|
      bucket.each do |num|
        new_idx = num % (num_buckets * 2)
        new_store[new_idx] << num
        @count += 1
      end
    end

    @store = new_store
  end

end
