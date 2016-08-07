class BankAccount < ApplicationRecord
  def balance
    amount
  end
  
  def deposit(n)
    if n <= 0; return; end;

    self.amount += n
    save
  end
  
  def withdraw(n)
    if n <= 0 || n > amount; return; end;

    self.amount -= n
    save
  end
end
