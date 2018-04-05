class Smith < ApplicationRecord
	belongs_to :p_name,	        :foreign_key => [:e_no, :result_no, :sub_no, :generate_no], :primary_key => [:e_no, :result_no, :sub_no, :generate_no], :class_name => 'Name'
	belongs_to :result,	        :foreign_key => [:e_no, :result_i_no, :result_no, :sub_no, :generate_no], :primary_key => [:e_no, :item_no, :result_no, :sub_no, :generate_no], :class_name => 'Item'
	belongs_to :source,	        :foreign_key => [:e_no, :source_i_no, :result_no, :sub_no, :generate_no], :primary_key => [:e_no, :item_no, :result_no, :sub_no, :generate_no], :class_name => 'Item'
	belongs_to :source_last,    :foreign_key => [:e_no, :source_i_no, :last_result_no, :sub_no, :last_generate_no], :primary_key => [:e_no, :item_no, :result_no, :sub_no, :generate_no], :class_name => 'Item'
	belongs_to :main_material,  :foreign_key => [:e_no, :main_material_i_no,  :last_result_no, :sub_no, :last_generate_no], :primary_key => [:e_no, :item_no, :result_no, :sub_no, :generate_no], :class_name => 'Item'
	belongs_to :sub_material_1, :foreign_key => [:e_no, :sub_material_1_i_no, :last_result_no, :sub_no, :last_generate_no], :primary_key => [:e_no, :item_no, :result_no, :sub_no, :generate_no], :class_name => 'Item'
	belongs_to :sub_material_2, :foreign_key => [:e_no, :sub_material_2_i_no, :last_result_no, :sub_no, :last_generate_no], :primary_key => [:e_no, :item_no, :result_no, :sub_no, :generate_no], :class_name => 'Item'
	belongs_to :sub_material_3, :foreign_key => [:e_no, :sub_material_3_i_no, :last_result_no, :sub_no, :last_generate_no], :primary_key => [:e_no, :item_no, :result_no, :sub_no, :generate_no], :class_name => 'Item'
	belongs_to :sub_material_4, :foreign_key => [:e_no, :sub_material_4_i_no, :last_result_no, :sub_no, :last_generate_no], :primary_key => [:e_no, :item_no, :result_no, :sub_no, :generate_no], :class_name => 'Item'
	belongs_to :main_material_name,  :foreign_key => :main_material_name_id, :primary_key => :proper_id, :class_name => 'ProperName'
	belongs_to :sub_material_1_name, :foreign_key => :sub_material_1_name_id,:primary_key => :proper_id, :class_name => 'ProperName'
	belongs_to :sub_material_2_name, :foreign_key => :sub_material_2_name_id,:primary_key => :proper_id, :class_name => 'ProperName'
	belongs_to :sub_material_3_name, :foreign_key => :sub_material_3_name_id,:primary_key => :proper_id, :class_name => 'ProperName'
	belongs_to :sub_material_4_name, :foreign_key => :sub_material_4_name_id,:primary_key => :proper_id, :class_name => 'ProperName'
end
