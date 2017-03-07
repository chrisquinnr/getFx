require 'rake/testtask'
require 'net/http'

Rake::TestTask.new do |t|
  t.libs << 'test'
end

desc "Run tests"
task :default => :test

desc "Get a file from a remote server"
task :fetch do 
  Net::HTTP.start("www.ecb.europa.eu") do |http|
    resp = http.get("/stats/eurofxref/eurofxref-hist-90d.xml")
    open("feed.xml", "w") { |file| file.write(resp.body) }
  end
end
