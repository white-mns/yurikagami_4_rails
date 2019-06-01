class AddIndexToSkill < ActiveRecord::Migration[5.2]
  def change
    add_index :skills, [:result_no, :e_no, :sub_no, :generate_no], :unique => false, :name => 'resultno_eno'
    add_index :skills, :skill_no
    add_index :skills, :skill_id
  end
end
