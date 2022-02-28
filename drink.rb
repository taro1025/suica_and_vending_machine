class Drink
  attr_accessor :name, :price
  def initialize(name, price)
    @name = name
    @price = price
  end

  def name_and_price
    "#{name} : #{price}円"
  end
end
