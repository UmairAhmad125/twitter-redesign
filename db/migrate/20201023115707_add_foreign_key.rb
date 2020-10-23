class AddForeignKey < ActiveRecord::Migration[6.0]
  def change
    add_reference :opinions, :author, foreign_key: { to_table: :users }
  end
end
