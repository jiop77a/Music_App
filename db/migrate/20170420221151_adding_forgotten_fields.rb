class AddingForgottenFields < ActiveRecord::Migration[5.0]
  def change
    change_column :albums, :recording_style, :string,  null: false
    change_column :tracks, :name, :string,  null: false
    change_column :tracks, :style, :string, null: false
  end
end
