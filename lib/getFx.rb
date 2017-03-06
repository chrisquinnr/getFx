require 'nokogiri'

class GetFx
  def self.run(curr = "GBP", time = "2017-03-03")
    parser = Parser.new(curr, time)
    parser.run
  end
end

class GetFx::Parser
  def initialize(curr, time)
    @curr = curr
    @time = time
    @doc = File.open("feed.xml") { |f| Nokogiri::XML(f) }
  end

  def run
    r = @doc.css("[@time='" + @time + "'] > [@currency='" + @curr + "']")
    puts r
  end
end
