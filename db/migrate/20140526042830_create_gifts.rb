class CreateGifts < ActiveRecord::Migration
  def change
    create_table :gifts do |t|
      t.string :nickname
      t.string :url
    end
  end
end
