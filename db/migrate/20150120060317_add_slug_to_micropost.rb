class AddSlugToMicropost < ActiveRecord::Migration
  def change
    add_column :microposts, :slug, :string
  end
end
