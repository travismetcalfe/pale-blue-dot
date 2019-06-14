class Star < ApplicationRecord
  
  self.primary_key = 'id'

  def self.search(search, page)
    if search.only_available
      conditions = ['(adopted_by = ? OR adopted_by LIKE "AVAILABLE%") AND number LIKE ?', "", "%" + search.number.to_s + "%"]
      if search.flag_type > 0
        conditions = ['flag = ? AND (adopted_by = ? OR adopted_by LIKE "AVAILABLE%") AND number LIKE ?', search.flag_type, "", "%" + search.number.to_s + "%"]
      end
      if search.const_type != 'ALL'
        conditions = ['const = ? AND (adopted_by = ? OR adopted_by LIKE "AVAILABLE%") AND number LIKE ?', "#{search.const_type}", "", "%" + search.number.to_s + "%"]
      end
      if search.flag_type > 0 && search.const_type != 'ALL'
        conditions = ['flag = ? AND const = ? AND (adopted_by = ? OR adopted_by LIKE "AVAILABLE%") AND number LIKE ?', search.flag_type, "#{search.const_type}", "", "%" + search.number.to_s + "%"]
      end
   else
      conditions = ['adopted_by LIKE ? AND number LIKE ?', "%#{search.name}%", "%" + search.number.to_s + "%"]
      if search.flag_type > 0
        conditions = ['flag = ? AND adopted_by LIKE ? AND number LIKE ?', search.flag_type, "%#{search.name}%", "%" + search.number.to_s + "%"]
      end
      if search.const_type != 'ALL'
        conditions = ['const = ? AND adopted_by LIKE ? AND number LIKE ?', "#{search.const_type}", "%#{search.name}%", "%" + search.number.to_s + "%"]
      end
      if search.flag_type > 0 && search.const_type != 'ALL'
        conditions = ['flag = ? AND const = ? AND adopted_by LIKE ? AND number LIKE ?', search.flag_type, "#{search.const_type}", "%#{search.name}%", "%" + search.number.to_s + "%"]
      end
    end

    order = "number"
    if search.brightness_order != 'num'
      order = "mag " + search.brightness_order
    end

    where(conditions).paginate(:per_page => 15, :page => page).order(order)
  end

  def nearby
    Star.where(["(lon_d + lon_m / 60.0 + lon_s / 3600.0) < ? AND (lon_d + lon_m / 60.0 + lon_s / 3600.0) > ? AND (lat_d + lat_m / 60.0 + lat_s / 3600.0) < ? AND (lat_d + lat_m / 60.0 + lat_s / 3600.0) > ?", self.lon_d + self.lon_m / 60.0 + self.lon_s / 3600.0 + 0.015, self.lon_d + self.lon_m / 60.0 + self.lon_s / 3600.0 - 0.015, self.lat_d + self.lat_m / 60.0 + self.lat_s / 3600.0 + 0.1, self.lat_d + self.lat_m / 60.0 + self.lat_s / 3600.0 - 0.1]).limit(200).order("id")
  end

  def latitude
    if self.lat_sign.include?("+")
      return ((self.lat_d.to_f + self.lat_m.to_f / 60.0 + self.lat_s.to_f / 3600.0)).to_s
    else
      return ((self.lat_d.to_f - self.lat_m.to_f / 60.0 - self.lat_s.to_f / 3600.0)).to_s
    end
  end

  def longitude
    return (-((self.lon_d.to_f + self.lon_m.to_f / 60.0 + self.lon_s.to_f / 3600.0) * 15 - 180)).to_s
  end

  def neglong
    return ((self.lon_d.to_f + self.lon_m.to_f / 60.0 + self.lon_s.to_f / 3600.0) * 15 - 180).to_s
  end

end
