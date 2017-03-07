Gem::Specification.new do |s|
  s.name        = 'getFx-cq'
  s.version     = '0.4.0'
  s.date        = '2017-03-07'
  s.summary     = "Get Forex data and provide wrapper to store and parse."
  s.description = "Fetches forez data from a given source, then offers methods to parse"
  s.authors     = ["Chris Quinn"]
  s.email       = 'chrisquinnr@gmail.com'
  s.files       = ["lib/getFx.rb"]
  s.homepage    =
    'http://rubygems.org/gems/getfx-cq'
  s.license       = 'MIT'
  s.add_dependency('nokogiri')
end
