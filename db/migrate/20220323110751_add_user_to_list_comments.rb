class AddUserToListComments < ActiveRecord::Migration[6.0]
  def change
    add_reference :list_comments, :user, foreign_key: true
  end
end
