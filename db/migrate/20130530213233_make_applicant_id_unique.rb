class MakeApplicantIdUnique < ActiveRecord::Migration
  def change
    add_index :interviews, :applicant_id, :unique => true
  end
end
