require 'benchmark'
require 'awesome_hash'
require 'ruby-prof'

ruby_hash = Hash.new
awesome_hash = AwesomeHash.new

iterations = 500

# Benchmarking:
Benchmark.bmbm do |x|
  x.report("Ruby Hash    #[]=") do
    for i in 1..iterations
      ruby_hash["key#{i}"] = "value#{i}"
    end
  end

  x.report("Ruby Hash    #[]") do
    for i in 1..iterations
      ruby_hash["key#{i}"]
    end
  end

  x.report("Awesome Hash #[]=") do
    for i in 1..iterations
      awesome_hash["key#{i}"] = "value#{i}"
    end
  end

  x.report("Awesome Hash #[]") do
    for i in 1..iterations
      awesome_hash["key#{i}"]
    end
  end
end

# Profiling:
result = RubyProf.profile do
  for i in 1..iterations do
    awesome_hash["key#{i}"] = "value#{i}"
  end
end

printer = RubyProf::GraphPrinter.new(result)
printer.print(STDOUT, {})
