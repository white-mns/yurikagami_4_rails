class Skill < ApplicationRecord
	belongs_to :pc_name, :foreign_key => [:result_no, :e_no, :sub_no, :generate_no], :primary_key => [:result_no, :e_no, :sub_no, :generate_no], :class_name => 'Name'
	belongs_to :skill,   :foreign_key => :skill_id,    :primary_key => :skill_id, :class_name => 'SkillDatum'
end
