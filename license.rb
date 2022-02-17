require 'date'

# Model of license with information about versions of Flussonic
class License
  attr_reader :paid_till, :max_version, :min_version, :last_version

  def initialize(paid_till_str, max_version_str, min_version_str, last_version_str)
    @paid_till = Date.new(paid_till_str.slice(6..9).to_i, paid_till_str.slice(3..4).to_i, paid_till_str.slice(0..1).to_i)
    if (max_version_str)
        @max_version = Date.new('20'.concat(max_version_str.slice(0..1)).to_i, max_version_str.slice(3..4).to_i, 1)
    end
    if (min_version_str)
        @min_version = Date.new('20'.concat(min_version_str.slice(0..1)).to_i, min_version_str.slice(3..4).to_i, 1)
    end
    if (last_version_str)
        @last_version = Date.new('20'.concat(last_version_str.slice(0..1)).to_i, last_version_str.slice(3..4).to_i, 1)
    end
  end

  def list_available_versions
    list = Array.new
    current_version = last_version
    5.times do 
      if (!min_version || current_version >= min_version) && (!max_version || current_version <= max_version) && current_version <= paid_till
        list.push(current_version)
      end
      current_version = current_version.prev_month
    end

    while list.size == 0 && (!min_version || current_version >= min_version) do
      if (!min_version || current_version >= min_version) && (!max_version || current_version <= max_version) && current_version <= paid_till
        list.push(current_version)
      end
      current_version = current_version.prev_month
    end
    list = convert_date_to_standard_format(list)
  end

  private
  def convert_date_to_standard_format(list)
    list.map { |date| (date.year - 2000).to_s.concat('.'.concat(convert_month(date.month)))}
  end
  
  def convert_month(month)
    if month < 10 
        return '0'.concat(month.to_s)
    end
    month.to_s
  end
end


