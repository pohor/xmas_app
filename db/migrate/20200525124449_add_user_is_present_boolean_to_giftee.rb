class AddUserIsPresentBooleanToGiftee < ActiveRecord::Migration[6.0]
  def change
    add_column :giftees, :user_is_present, :boolean, default: false, allow_nil: false
  end
end
