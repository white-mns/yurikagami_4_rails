json.extract! status, :id, :result_no, :generate_no, :e_no, :sub_no, :lv, :exp, :mexp, :job1, :job2, :hp, :mhp, :hp_rate, :mp, :mmp, :mp_rate, :sp, :str, :int, :tec, :agi, :def, :skill, :personality, :tribe, :money, :sundries, :created_at, :updated_at
json.url status_url(status, format: :json)
