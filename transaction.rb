require './drink.rb'
require './drink_stock.rb'

# 自販機のやること
# ・飲み物出す、売り上げに入れる（買う、transaction）
# ・飲み物一覧が見れる
# ・買える飲み物一覧表示

class Transaction
  def initialize
    @balance = 0
    @purchase_history = []
    @drink_stock = DrinkStock.new
  end

  # 在庫がある、かつ、買える時のみ
  def purchase_drinks(target_drink_name, suica)
    puts('品切れです。') || return unless drink = @drink_stock.find(target_drink_name)
    puts('お金が足りません。') || return if suica.balance < drink.price
    suica.pay(drink.price)
    @purchase_history << { age: suica.age, sex: suica.sex, drink: drink }
    @balance += drink.price
    @drink_stock.remove(drink)
  end

  def display_balance
    puts "売り上げ：#{@balance}"
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

  def start_new_line
    puts
  end
end
