class Merchant
  attr_reader :id, 
              :name

  def initialize(info)
    require 'pry'; binding.pry
    @id = info[:id]
    @name = info[:attributes][:name]
  end
end