require 'nokogiri'

class GetFx
  def self.run(curr = "GBP", time = "2017-02-28", amt = 1)
    parser = Parser.new(curr, time, amt)
    parser.run
  end
end

class GetFx::Parser
  def initialize(curr, time, amt)
    @curr = curr
    @date = time
    @amt = amt.to_f
    @doc = File.open("feed.xml") { |f| Nokogiri::XML(f) }
  end

  def run
    if(@curr && @date)
      r = @doc.css("[@time='" + @date + "'] > [@currency='" + @curr + "']")[0]["rate"]
      i = r.to_f
      i * @amt
    end
  end
end
