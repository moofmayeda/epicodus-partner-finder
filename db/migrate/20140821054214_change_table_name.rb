class ChangeTableName < ActiveRecord::Migration
  def change
    rename_table :completed_lessons, :completions
  end
end
