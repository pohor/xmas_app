class AddGifterAndGifteeReferenceToPresent < ActiveRecord::Migration[6.0]
  def change
    change_table :presents do |t|
      t.references :gifter
      t.references :giftee
      t.references :user
    end
  end
end
