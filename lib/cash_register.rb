require 'pry'

class CashRegister
  
  attr_accessor :total, :discount
  
  @@items = []
  
  def initialize(discount = 0)
    @total = 0
    @discount = discount
  end
  
  def total
    @total
  end
  
  def add_item(title, price, quantity = 1)
    @@items << title
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
    @@items
  end 
  
  def void_last_transaction
    if @@items.last > 0
      new_total = @total - @@items.last
      new_total
    else
      0.0 
    end
  end
  
end 
