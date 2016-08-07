require 'rails_helper'

RSpec.describe BankAccount, type: :model do
  
  # before :each do
  #   @account = BankAccount.create(amount: 10)
  # end
  
  let(:account) { BankAccount.create(amount: 10) }
  
  describe "領錢" do
    it "領大於零的金額" do 
      account.withdraw(5)
      expect(account.balance).to be 5
      account.withdraw(5)
      expect(account.balance).to be 0
    end
    
    it "領大於零但超過金額" do 
      account.withdraw(15)
      expect(account.balance).to be 10
    end
    
    it "領小於零或等於零" do 
      account.withdraw(-15)
      expect(account.balance).to be 10
      account.withdraw(0)
      expect(account.balance).to be 10
    end
  end

  describe "存錢" do
    it "存大於零" do
      account.deposit(10)
      expect(account.balance).to be 20
      
      account.deposit(20)
      expect(account.balance).to be 40
    end

    it "存小於或等於零金額" do
      account.deposit(-10)
      expect(account.balance).to be 10
    end
  end
  
  describe "顯示餘額" do
    it "可以顯示餘額" do
      expect(account.balance).to be 10
      
      account = BankAccount.create(amount: 20)
      expect(account.balance).not_to be 10
    end
  end
end
