module ApplicationHelper
  def header_link_item(name, path)
    class_name = 'nav-item'
    class_name << ' active' if current_page?(path)
    
    content_tag :li, class: class_name do
      link_to name, path, class: 'nav-link'
    end
  end

  def GetDateFormat(date)
    now = DateTime.current
    today = DateTime.current.to_date
    if today.year == date.year
      if (today - date.to_date).to_i <= 7
        if today == date.to_date
          if now.hour == date.hour
            if now.min == date.min
              # 1分以内
              result = (now.sec - date.sec).to_s + "秒前"
            else
              # 1時間以内
              result = (now.min - date.min).to_s + "分前"
            end
          else
            # 当日
            result = (now.hour - date.hour).to_s + "時間前"
          end
        else
          # 一週間以内
          result = (today - date.to_date).to_i.to_s + "日前"
        end
      else
        # 今年
        result = date.strftime("%m月%d日")
      end
    else
      # 去年以前
      result = date.strftime("%Y年%m月%d日")
    end
    
    return result
  end
end