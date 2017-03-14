require 'nokogiri'

class GetFx
  def self.run(*params)
    if params
      args = params[0]
    else
      args = []
    end

    Validator.initialize

    curr = "USD"
    if args[0]
      curr_f = args[0].upcase
      Validator.currency(curr_f)
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
    return parser.runCompute

  end
end

class GetFx:Validator

  def initialize
    @doc = File.open("feed.xml") { |f| Nokogiri::XML(f) }
  end

  def currency(value)
   if value
     r = @doc.css("[@currency='" + @curr + "']")
     puts r
   end
  end

  def date
  end

  def amt
  end

end

class GetFx::Parser
  def initialize(curr, date, amt)
    @doc = File.open("feed.xml") { |f| Nokogiri::XML(f) }
    @curr = curr
    @date = date
    @amt = amt.to_f
  end

  def runCompute
    r = @doc.css("[@time='" + @date + "'] > [@currency='" + @curr + "']")[0]["rate"]
    i = r.to_f
    return i * @amt
  end
end
