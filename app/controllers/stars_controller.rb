class StarsController < ApplicationController
  # GET /stars
  # GET /stars.xml
  def index

    @search = Search.new(search_params[:search])
    @stars = Star.search(@search, params[:page])

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render xml: @stars }
    end
  end

  # GET /stars/1
  # GET /stars/1.xml
  def show
    @star = Star.find(params[:id])
    @nearby_stars = @star.nearby
    @maps_api_key = Rails.configuration.google_maps_api_key
   
    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render xml: @star }
    end
  end

  # GET /stars/nearest/1
  # GET /stars/nearest/1.xml
  def nearest
    @star = Star.find(params[:id])
    @nearby_stars = @star.nearby

      respond_to do |format|
        format.html # nearest.html.erb
        format.xml { render xml: @nearby_stars }
      end
  end

  def search_params
    params.permit(:search => [:name, :number, :flag_type, :const_type, :brightness_order, :only_available])
  end

end
