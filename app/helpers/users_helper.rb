module UsersHelper
  def calcAge(birthday)
    if birthday !~ /^\d{4}-\d{1,2}-\d{1,2}$/
      return -1
    end
    return (Time.zone.today.strftime("%Y%m%d").to_i - birthday.gsub!("-","").to_i) / 10000
  end
end
