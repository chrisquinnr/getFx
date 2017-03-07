require 'nokogiri'

class GetFx
  def self.run(*opts)
    opts[0] ? curr = opts[0] : curr = "USD"
    opts[1] ? time = opts[1] : time = "2017-02-28"
    opts[2] ? amt = opts[2] : amt = 1
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
    if(@curr && @date && @amt)
      r = @doc.css("[@time='" + @date + "'] > [@currency='" + @curr + "']")[0]["rate"]
      i = r.to_f
      i * @amt
    end
  end
end
