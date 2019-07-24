class AddUserToComments < ActiveRecord::Migration[5.1]
  def change
    add_reference :comments, :user_email, foreign_key: true
  end
end
