# Last version of Flussonic
class FlussonicLastVersion
  attr_reader :year, :month
  def initialize
    @year = rand(10..30)
    @month = rand(1..12)
  end

  def get
    if month < 10 
        month_str = '0'.concat(month.to_s)
    else
        month_str = month.to_s
    end
    year.to_s.concat('.'.concat(month_str))
  end
end