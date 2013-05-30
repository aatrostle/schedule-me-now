class RemoveApplicantIdUserIdFromInterviews < ActiveRecord::Migration
  def up
    remove_column :interviews, :applicant_id
    remove_column :interviews, :instructor_id
    change_table :interviews do |t|
      t.references :user
      t.references :applicant
    end
  end

  def down
    change_table :interviews do |t|
      t.remove :user_id
      t.remove :applicant_id
    end
    add_column :interviews, :instructor_id, :integer
    add_column :interviews, :applicant_id, :integer
  end
end
