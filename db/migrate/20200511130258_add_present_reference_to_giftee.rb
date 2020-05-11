class AddPresentReferenceToGiftee < ActiveRecord::Migration[6.0]
  def change
    change_table :giftees do |t|
      t.references :present
    end
  end
end
