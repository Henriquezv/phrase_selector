class AddMoodTypeToPhrases < ActiveRecord::Migration[5.2]
  def change
    add_reference :phrases, :mood_type, foreign_key: true
  end
end
