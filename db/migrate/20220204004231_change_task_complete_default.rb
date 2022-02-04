class ChangeTaskCompleteDefault < ActiveRecord::Migration[7.0]
  def change
    change_column_default :tasks, :complete, from: false, to: true
  end
end
