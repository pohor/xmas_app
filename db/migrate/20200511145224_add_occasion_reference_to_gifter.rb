class AddOccasionReferenceToGifter < ActiveRecord::Migration[6.0]
  def change
    change_table :gifters do |t|
      t.references :occasion
    end
  end
end
