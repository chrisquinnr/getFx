require 'nokogiri'

class GetFx
  def self.run(curr = "GBP", time = "2017-02-28")
    parser = Parser.new(curr, time)
    parser.run
  end
end

class GetFx::Parser
  def initialize(curr, time)
    @curr = curr
    @date = time
    @doc = File.open("feed.xml") { |f| Nokogiri::XML(f) }
  end

  def run
    if(@curr && @date)
      puts 'fetching ' + @curr + ' on ' + @date
      r = @doc.css("[@time='" + @date + "'] > [@currency='" + @curr + "']")[0]["rate"]
    end
  end
end
