class AddPresentReferenceToGifter < ActiveRecord::Migration[6.0]
  def change
    change_table :gifters do |t|
      t.references :present
    end
  end
end
