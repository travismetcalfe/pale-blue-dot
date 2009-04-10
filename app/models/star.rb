class Star < ActiveRecord::Base
  def self.search(search, page)
    if search.only_available
      conditions = ['adopted_by = ? ', ""]
    else 
      conditions = ['adopted_by like ?', "%#{search.name}%"]
    end

    order = "number"
    if search.brightness
      order = "mag " + search.brightness_order
    end

    paginate :per_page => 30, :page => page,
             :conditions => conditions, :order => order
  end
end
