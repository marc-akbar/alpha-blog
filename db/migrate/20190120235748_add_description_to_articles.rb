class AddDescriptionToArticles < ActiveRecord::Migration[5.2]
  # convention to make changes to the previously made migration
  def change
    add_column :articles, :description, :text
    add_column :articles, :created_at, :datetime
    add_column :articles, :updated_at, :datetime
  end
end
