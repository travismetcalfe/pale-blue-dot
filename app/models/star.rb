class Star < ActiveRecord::Base
  def self.search(search, page)
    paginate :per_page => 30, :page => page,
             :conditions => ['adopted_by like ?', "%#{search}%"], :order => 'number'
  end
end
