require 'nokogiri'

class GetFx
  def self.run(*params)
    if params
      args = params[0]
    else
      args = []
    end

    curr = "USD"
    if args[0]
      curr = args[0]
    end 

    date = "2017-02-28"
    if args[1]
      date = args[1]
    end

    amt = 1
    if args[2]
      amt = args[2]
    end

    parser = Parser.new(curr, date, amt)
    parser.run

  end
end

class GetFx::Parser
  def initialize(curr, date, amt)
    @doc = File.open("feed.xml") { |f| Nokogiri::XML(f) }
    @curr = curr
    @date = date
    @amt = amt.to_f
  end

  def run
    r = @doc.css("[@time='" + @date + "'] > [@currency='" + @curr + "']")[0]["rate"]
    i = r.to_f
    puts (i * @amt).round(2)
  end
end
