class Suica
  attr_accessor :balance, :age, :sex

  def initialize(put_money = 0, age, sex)
    @balance = put_money
    @age = age
    @sex = sex
  end

  def display_balance
    puts "スイカの残高：#{@balance}, 性: #{@sex}, 年齢: #{@age}"
    puts
  end

  # 100以上からチャージ可
  def put_money(amount)
    return if amount < 100
    @balance += amount
  end

  # 値段がマイナスまたは残高より大きい場合リターン
  def pay(amount)
    return if amount < 0 || amount > @balance
    @balance -= amount
  end
end
