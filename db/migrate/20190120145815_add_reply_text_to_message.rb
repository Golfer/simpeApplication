class AddReplyTextToMessage < ActiveRecord::Migration[5.2]
  def change
    add_column :messages, :reply, :text
  end
end
