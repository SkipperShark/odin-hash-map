require_relative "linked_list"

class HashMap
  attr_reader :load_factor
  attr_accessor :buckets, :capacity

  def initialize(capacity = 16, load_factor = 0.75)
    @capacity = capacity
    @load_factor = load_factor
    @buckets = Array.new(capacity)
  end

  def hash(key)
    hash_code = 0
    prime_number = 31
    key.each_char { |char| hash_code = (prime_number * hash_code) + char.ord }
    hash_code % 16
  end

  def set(key, value)
    index = hash(key)
    raise IndexError if index.negative? || index >= buckets.length

    bucket = buckets[index]
    if bucket.nil?
      linked_list = LinkedList.new
      bucket << linked_list.append({ key => value })
    else
    end

    # expand if length >= capacity * load_factor
  end

  def get(key)
    index = hash(key)
    buckets[index][key]
  end

  def has?(key)
    index = hash(key)
    !buckets[index].nil?
  end

  def remove(key)
    index = hash(key)
    return nil if buckets[index].nil?

    removed_value = buckets[index][key]
    buckets[index] = nil
    removed_value
  end

  def length
    buckets.count { |bucket| !bucket.nil? }
  end

  def clear
    buckets.fill nil
  end

  def keys
    bucket_keys = []
    buckets.each do |bucket|
      bucket_keys << bucket.keys unless bucket.nil?
    end
    bucket_keys
  end

  def values
    bucket_values = []
    buckets.each do |bucket|
      bucket_values << bucket.values unless bucket.nil?
    end
    bucket_values
  end

  def entries
    bucket_entries = []
    buckets.each do |bucket|
      bucket_entries << [bucket.keys.first, bucket.values.first] unless bucket.nil?
    end
    bucket_entries
  end

  private

  def expand
    self.capacity *= 2
    buckets[capacity - 1] = nil
  end
end

test = HashMap.new
test.set('apple', 'red')
test.set('banana', 'yellow')
test.set('carrot', 'orange')
test.set('elephant', 'gray')
test.set('frog', 'green')
test.set('hat', 'black')
test.set('ice cream', 'white')
test.set('jacket', 'blue')
test.set('kite', 'pink')
test.set('lion', 'golden')

# test.set('grape', 'purple')
# test.set('dog', 'brown')

# pp test.buckets
# pp test.buckets
# pp test.length
# pp test.hash("grape")