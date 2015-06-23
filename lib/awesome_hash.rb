class AwesomeHash
  attr_reader :buckets, :entry_count

  def initialize
    @buckets = Array.new(16, [])
    @entry_count = 0
  end

  def []=(key, value)
    @entry_count += 1

    if @entry_count.to_f / @buckets.size > 1
      redistribute
    end

    index = hash(key)

    @buckets[index] << [key, value]
  end

  def [](key)
    target_bucket = @buckets[hash(key)]

    target_entry = target_bucket.find { |k, v| k == key }

    target_entry[1]
  end

  def redistribute
    new_buckets = Array.new(@buckets.size ** 2, [])

    @buckets.each do |bucket|
      bucket.each do |entry|
        index = hash(entry[0], num_of_buckets: new_buckets.size)

        new_buckets[index] << [entry[0], entry[1]]
      end
    end

    @buckets = new_buckets
  end

  def hash(str, num_of_buckets: @buckets.size)
    # str.hash % num_of_buckets
    str.sum % num_of_buckets
  end
end
