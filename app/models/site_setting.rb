class SiteSetting
  attr_reader :data
  def initialize
    @data = Setting.pluck(:name, :value).to_h.with_indifferent_access rescue {}
  end

  def fetch(key=false)
    if key == false
      raise('COMMMMMONNNN PERSON!')
    end
    if result = data[key]
      result
    else
      "Setting missing for [#{key}]"
    end
  end
end
