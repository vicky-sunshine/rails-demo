class CreateBankAccounts < ActiveRecord::Migration[5.0]
  def change
    create_table :bank_accounts do |t|
      t.string :name
      t.integer :amount

      t.timestamps
    end
  end
end
