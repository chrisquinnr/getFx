Gem::Specification.new do |s|
  s.name        = 'getFx-cq'
  s.version     = '0.7.17'
  s.date        = '2017-03-22'
  s.summary     = "Get Forex data and provide wrapper to store and parse."
  s.description = "Fetches forex data from a given source, then offers methods to parse"
  s.authors     = ["Chris Quinn"]
  s.email       = 'chrisquinnr@gmail.com'
  s.files       = ["lib/getFx.rb"]
  s.homepage    =
    'http://rubygems.org/gems/getfx-cq'
  s.license       = 'MIT'
  s.add_dependency('nokogiri')
end
