require 'nokogiri'
require 'open-uri'

class GetFx

  def self.run(*params)
    if params
      args = params[0]
    else
      args = []
    end

    valid = Validator.new()

    curr = "USD"
    if args[0]
      curr_f = args[0].upcase
      test = valid.currency(curr_f)
      unless test.nil?
        curr = curr_f
      end
    end

    date = "2017-02-28"
    if args[1]
      date_f = args[1]
      test = valid.date(date_f)
      unless test.nil?
        curr = curr_f
      end
    end

    amt = 1
    if args[2]
      amt = args[2]
    end

    parser = Parser.new(curr, date, amt)
    return parser.runCompute

  end

  def self.currencies
    curr = Currencies.new()
    return curr.get()
  end

end

class GetFx::Currencies

  def initialize()
    @doc = Nokogiri::HTML(open("https://s3.eu-west-2.amazonaws.com/cq-dev-storage/feed.xml"))
  end

  def get()
    select = "[@time='" + "2017-01-02" + "']"
    nodeset = @doc.css("[currency]").map { |node| node['currency'] }
    return nodeset.uniq
  end
end

class GetFx::Validator

  def initialize()
    @doc = Nokogiri::HTML(open("https://s3.eu-west-2.amazonaws.com/cq-dev-storage/feed.xml"))
  end

  def currency(value)
    if value
      r = @doc.at_css("[@currency='" + value + "']")
      if r
        return r
      else
        return nil
      end
    else
      return nil
    end
  end

  def date(value)
    if value
      r = @doc.css("[@time='" + value + "']")
      if r
        return r
      else
        return nil
      end
    else
      return nil
    end
  end

  def amt
  end

end

class GetFx::Parser
  def initialize(curr, date, amt)
    @doc = Nokogiri::HTML(open("https://s3.eu-west-2.amazonaws.com/cq-dev-storage/feed.xml"))
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
