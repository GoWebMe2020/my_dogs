class AddImageLinkToDogs < ActiveRecord::Migration[7.0]
  def change
    add_column :dogs, :image_link, :string, default: nil
  end
end
