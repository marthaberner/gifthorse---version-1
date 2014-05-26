class ChangeGiftUrlToUrl < ActiveRecord::Migration
  def change
    rename_column :gifts, :gift_url, :url
  end
end
