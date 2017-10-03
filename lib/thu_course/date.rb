def date_change(datas)
  days = '一二三四五六日'

  days.each_char do |day|
    datas = datas.gsub(day, ",#{day}")
  end

  datas = datas.split(/\/|\[|\,|\]/)
  datas = datas.reverse

  time = []
  local = ''
  hash = []

  datas.each do |data|
    if data.size == 1 && (data =~ /\p{han}/) != nil
      day = data
      case day
        when '一'
          day_num = 1
        when '二'
          day_num = 2
        when '三'
          day_num = 3
        when '四'
          day_num = 4
        when '五'
          day_num = 5
        when '六'
          day_num = 6
    	  when '日'
    		  day_num = 7
      end

      hash << { day: day_num, local: local, time: time.reverse }
      time = []
    elsif data != ''
      if data.size >= 3 || data.include?('館') || data.include?('系圖')
        local = data
      else
        time << data
      end
    end
  end

  hash
end
