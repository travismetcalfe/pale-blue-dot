class StarsController < ApplicationController
  # GET /stars
  # GET /stars.xml
  def index
    @search = Search.new(params[:search])

    @stars = Star.search(@search, params[:page])

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @stars }
    end
  end

  # GET /stars/1
  # GET /stars/1.xml
  def show
    @star = Star.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @star }
    end
  end

  # GET /stars/nearest/1
  # GET /stars/nearest/1.xml
  def nearest
     @nearby_stars = Star.find(:all, :limit => 10, :order => "id")

      respond_to do |format|
        format.html # nearest.html.erb
        format.xml  { render :xml => @nearby_stars }
      end
  end

end
