class CreateInterviews < ActiveRecord::Migration
  def change
    create_table :interviews do |t|
      t.datetime :interview_at
      t.integer :applicant_id
      t.integer :instructor_id
      t.text :notes

      t.timestamps
    end
  end
end
