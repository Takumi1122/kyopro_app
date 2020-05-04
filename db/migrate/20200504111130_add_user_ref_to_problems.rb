class AddUserRefToProblems < ActiveRecord::Migration[5.2]
  def change
    add_reference :problems, :user, foreign_key: true, after: :answer, null: false, default: 1
  end
end
