class AwesomeHash
  attr_reader :values

  def initialize
    @values = []
  end

  def []=(key, value)
    index = hash(key)

    if @values[index] == nil
      @values[index] = []
    end

    @values[index] << [key, value]
  end

  def [](key)
    target_bucket = @values[hash(key)]

    target_pair = target_bucket.find { |k, v| k == key }

    target_pair[1]
  end

  def hash(str)
    str.chars.map(&:ord).reduce(:+)
  end
end
