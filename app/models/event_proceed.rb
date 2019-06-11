class EventProceed < ApplicationRecord
	belongs_to :pc_name, :foreign_key => [:result_no, :e_no, :sub_no, :generate_no], :primary_key => [:result_no, :e_no, :sub_no, :generate_no], :class_name => 'Name'
	belongs_to :event,     :foreign_key => :event_id,     :primary_key => :proper_id, :class_name => 'ProperName'
	belongs_to :last_flag, :foreign_key => :last_flag_id, :primary_key => :proper_id, :class_name => 'ProperName'
	belongs_to :flag,      :foreign_key => :flag_id,      :primary_key => :proper_id, :class_name => 'ProperName'
end
