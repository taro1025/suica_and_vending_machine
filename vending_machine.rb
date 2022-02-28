require './drink.rb'

class VendingMachine
  def initialize
    @drinks_stock = []
    @balance = 0
    @purchase_history = []
    add_drinks("コーラ", 120, 5)
  end

  # 在庫がある、かつ、買える時のみ
  def purchase_drinks(target_drink_name, suica)
    puts('品切れです。') || return unless drink = find(target_drink_name)
    puts('お金が足りません。') || return if suica.balance < drink.price
    suica.pay(drink.price)
    @purchase_history << { age: suica.age, sex: suica.sex, drink: drink }
    @balance += drink.price
    @drinks_stock.delete(drink)
  end

  # 在庫にdrinkを追加。creation_countで追加する数を決められる。デフォルトで１つ。
  def add_drinks(name, price, creation_count = 1)
    creation_count.times.each { @drinks_stock << Drink.new(name, price) }
  end

  def display_balance
    puts "売り上げ：#{@balance}"
    start_new_line
  end

  def display_buyable_drinks
    puts "買える飲み物"
    buyable_drink_names.each do |name|
      drink = find(name)
      puts drink.name_and_price
    end
    start_new_line
  end

  def display_purchase_history
    puts "販売履歴"
    @purchase_history.each do |customer|
      puts "年齢: #{customer[:age]}, 性別: #{customer[:sex]}, 飲み物: #{customer[:drink].name}, 値段: #{customer[:drink].price}"
    end
    start_new_line
  end

  private

  def buyable_drink_names
    @drinks_stock.map(&:name).uniq
  end

  def find(drink_name)
    stock = @drinks_stock.sort_by {|drink| drink.name}
    stock.find { |drink| drink.name == drink_name }
  end

  def start_new_line
    puts
  end
end
