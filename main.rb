require './transaction.rb'
require './suica.rb'
require './drink_stock.rb'

# 自販機の作成と飲み物仕入れ
transaction = Transaction.new
drink_stock = DrinkStock.new
drink_stock.add_drinks("レッドブル", 200, 5)
drink_stock.add_drinks("水", 100, 5)

# 買えるもの、自販機の売り上げ金を表示
drink_stock.display_buyable_drinks
transaction.display_balance

# スイカの作成、レッドブルを買う
suica_male = Suica.new(1000, 21 ,'男')
suica_female = Suica.new(1000, 18 ,'女')

8.times.each do
  transaction.purchase_drinks("レッドブル", suica_female)
  transaction.purchase_drinks("コーラ", suica_male)
end

# 買えるもの、自販機の売り上げ金を表示
drink_stock.display_buyable_drinks
transaction.display_balance

# スイカの残高と自販機の購買履歴
suica_male.display_balance
suica_female.display_balance
transaction.display_purchase_history
