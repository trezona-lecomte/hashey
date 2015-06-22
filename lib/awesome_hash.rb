class AwesomeHash
  attr_reader :buckets, :entry_count

  def initialize
    @buckets = Array.new(16, [])
    @entry_count = 0
  end

  def []=(key, value)
    @entry_count += 1

    if (@entry_count.to_f / @buckets.size) > 0.75
      redistribute
    end

    index = hash(str: key)

    @buckets[index] << [key, value]
  end

  def [](key)
    target_bucket = @buckets[hash(str: key)]

    target_entry = target_bucket.find { |k, v| k == key }

    target_entry[1]
  end

  def distribution_info
    output = "Number of buckets: #{@buckets.size}\n"
    output += "Number of empty buckets: #{num_of_empty_buckets}\n"
  end

  def num_of_empty_buckets
    @buckets.count { |bucket| bucket.empty? }
  end

  private
    def hash(str:, num_of_buckets: @buckets.size)
      str.sum % num_of_buckets
    end

    def redistribute
      new_buckets = Array.new(@buckets.size * 2, [])

      @buckets.each do |bucket|
        bucket.each do |entry|
          index = hash(str: entry[0], num_of_buckets: new_buckets.size)
          new_buckets[index] << [entry[0], entry[1]]
        end
      end

      @buckets = new_buckets
    end
end
