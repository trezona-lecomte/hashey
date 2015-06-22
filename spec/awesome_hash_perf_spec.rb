require 'benchmark'
require 'awesome_hash'

ruby_hash = Hash.new
awesome_hash = AwesomeHash.new

Benchmark.bmbm do |x|
  x.report("Ruby Hash    #[]=") { ruby_hash['key']    = 'value' }
  x.report("Awesome Hash #[]=") { awesome_hash['key'] = 'value' }
  x.report("Ruby Hash    #[]")  { ruby_hash['key'] }
  x.report("Awesome Hash #[]")  { awesome_hash['key'] }
end
