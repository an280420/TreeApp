class CreatePages < ActiveRecord::Migration[6.1]
  def change
    create_table :pages do |t|
      t.string :name, index: { unique: true }, null: false
      t.string :title
      t.text :body

      t.timestamps
    end
  end
end
