class GetFx
  def self.run(curr = "GBP")
    parser = Parser.new(curr)
    parser.run
  end
end

class GetFx::Parser
  def initialize(curr)
    @curr = curr
  end

  def run
    case @curr
    when "GBP"
      # get currency parse stuff
      '£££1'
    else
      # do default parse of GBP
      '$$$'
    end
  end
end
