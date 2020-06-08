class AllowNullsForGifterInGiftee < ActiveRecord::Migration[6.0]
  def change
    change_column :giftees, :gifter_id, :bigint, null: true
  end
end
