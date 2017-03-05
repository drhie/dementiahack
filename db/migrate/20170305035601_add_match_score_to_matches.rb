class AddMatchScoreToMatches < ActiveRecord::Migration[5.0]
  def change
    add_column(:matches, :match_score, :integer)
  end
end
