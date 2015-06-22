class AwesomeHash
  attr_accessor :values

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
    @values[hash(key)].select { |k, v| k == key }[0][1]
  end

  def hash(str)
    str.chars.map(&:ord).reduce(:+)
  end
end
