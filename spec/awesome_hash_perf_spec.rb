require 'benchmark'
require 'awesome_hash'
require 'byebug'
require 'faker'

ruby_hash = Hash.new
awesome_hash = AwesomeHash.new

Benchmark.bm do |x|
  x.report("Awesome Hash #[]=") { awesome_hash['key'] = 'value' }
  x.report("Ruby Hash    #[]=") { ruby_hash['key']    = 'value' }

  x.report("Awesome Hash #[]")  { awesome_hash['key'] }
  x.report("Ruby Hash    #[]")  { ruby_hash['key'] }
end

iterations = 5
key_chars = 10
value_chars = 10

Benchmark.bm do |x|
  x.report("Ruby Hash   ") do
    for i in 1..iterations do
      key_str = Faker::Lorem.characters(key_chars)
      value_str = Faker::Lorem.characters(value_chars)

      ruby_hash[key_str] = value_str

      ruby_hash[key_str]
    end
  end
end

Benchmark.bm do |x|
  x.report("Awesome Hash") do
    for i in 1..iterations do
      key_str = Faker::Lorem.characters(key_chars)
      value_str = Faker::Lorem.characters(value_chars)

      awesome_hash[key_str] = value_str

      awesome_hash[key_str]

    end
  end
end


