require 'pry'

class CashRegister
  
  attr_accessor :total, :discount, :last_transaction
  
  def initialize(discount = 0)
    @total = 0
    @discount = discount
    @items = []
  end
  
  def total
    @total
  end
  
  def add_item(title, price, quantity = 1)
    counter = 0 
    while counter < quantity do
      @items << title
      counter += 1 
    end
    @last_transaction = price * quantity
    @total = @total + price * quantity
  end 
  
  def apply_discount 
    if @discount > 0 
      decimal_discount = @discount / 100.0
      remaining_fraction = 1 - decimal_discount
      @total = @total * remaining_fraction
      return "After the discount, the total comes to $#{@total.to_int}."
    else
      return "There is no discount to apply."
    end
  end 
  
  def items
    @items
  end 
  
  def void_last_transaction
    @total = @total - @last_transaction
  end
  
end 
