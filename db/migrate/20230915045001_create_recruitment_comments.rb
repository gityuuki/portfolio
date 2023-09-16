class CreateRecruitmentComments < ActiveRecord::Migration[6.1]
  def change
    create_table :recruitment_comments do |t|
       t.text :comment
      t.integer :user_id
      t.integer :recruitment_id
      
      t.timestamps
    end
  end
end
