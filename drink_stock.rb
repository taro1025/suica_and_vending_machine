require './drink.rb'

class DrinkStock
  @@stock = []

  def initialize
    add_drinks("コーラ", 120, 5)
  end
  # 在庫にdrinkを追加。creation_countで追加する数を決められる。デフォルトで１つ。
  def add_drinks(name, price, creation_count = 1)
    creation_count.times.each { @@stock << Drink.new(name, price) }
  end

  def remove(drink)
    @@stock.delete(drink)
  end
  
  def display_buyable_drinks
    puts "買える飲み物"
    buyable_drink_names.each do |name|
      drink = find(name)
      puts drink.name_and_price
    end
    start_new_line
  end

  def find(drink_name)
    stock = @@stock.sort_by {|drink| drink.name}
    stock.find { |drink| drink.name == drink_name }
  end

  private

  def buyable_drink_names
    @@stock.map(&:name).uniq
  end

  private

  def start_new_line
    puts
  end
end
