class AddOccasionReferenceToGiftee < ActiveRecord::Migration[6.0]
  def change
    change_table :giftees do |t|
      t.references :occasion
    end
  end
end
