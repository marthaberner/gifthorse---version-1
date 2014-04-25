class CreateGifts < ActiveRecord::Migration
  def change
    create_table :gifts do |t|
      t.string :nickname
      t.string :gift_url
    end
  end
end
