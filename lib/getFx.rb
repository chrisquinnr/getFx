require 'nokogiri'

class GetFx
  def self.run(*params)
    if params
      args = params[0]
    else
      args = []
    end

    valid = Validator.new('feed.xml')

    curr = "USD"
    if args[0]
      curr_f = args[0].upcase
      test = valid.currency(curr_f)
      puts test
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

class GetFx::Validator

  def initialize(path)
    @doc = File.open(path) { |f| Nokogiri::XML(f) }
  end

  def currency(value)
   if value
     r = @doc.css("[@currency='" + value + "']")
     unless r.nil? && r[0].nil? && r[0]["rate"].nil?
       puts r[0]
       return r[0]["rate"]
     else 
       return false
     end
   end
  end

  def date(value)
   if value
     r = @doc.css("[@time='" + value + "']")[0]["rate"]
     if r
       return r
     else
       return false
     end
   end
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
