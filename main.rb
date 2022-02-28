require './vending_machine.rb'
require './suica.rb'

# 自販機の作成と飲み物仕入れ
vending_machine = VendingMachine.new
vending_machine.add_drinks("レッドブル", 200, 5)
vending_machine.add_drinks("水", 100, 5)

# 買えるもの、自販機の売り上げ金を表示
vending_machine.display_buyable_drinks
vending_machine.display_balance

# スイカの作成、レッドブルを買う
suica = Suica.new(1000, 21 ,'男')
vending_machine.purchase_drinks("レッドブル", suica)

# 買えるもの、自販機の売り上げ金を表示
vending_machine.display_buyable_drinks
vending_machine.display_balance

# スイカの残高と自販機の購買履歴
suica.display_balance
vending_machine.display_purchase_history