class CreatePartyInfos < ActiveRecord::Migration[5.1]
  def change
    create_table :party_infos do |t|
      t.integer :result_no
      t.integer :generate_no
      t.integer :party_no
      t.string :name
      t.integer :member_num
      t.integer :battler_num
      t.integer :sook_num

      t.timestamps
    end
  end
end
