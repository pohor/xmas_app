class AddReferenceOfGifterToGiftee < ActiveRecord::Migration[6.0]
  def change
    change_table :giftees do |t|
      t.references :gifter, foreign_key: true
    end
  end
end
