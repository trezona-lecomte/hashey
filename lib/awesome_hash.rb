class AwesomeHash
  def initialize
    @values = []
    @values[1000] = nil
  end

  def []=(key, value)
    index = key.length
    @values.insert(index, value)
  end

  def [](key)
    @values[key.length]
  end
end