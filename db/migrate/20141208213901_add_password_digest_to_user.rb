class AddPasswordDigestToUser < ActiveRecord::Migration
  def change
    change_table(:users) do |t|
      t.string :password_digest, null: false
    end
  end
end
