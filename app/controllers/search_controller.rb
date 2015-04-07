class SearchController < ApplicationController
  def index
    @alliance = Alliance.all
  end

  def update_airline
    if  params[:alliance_val] == 'Star Alliance'
      params[:alliance_val]= 'Star-Alliance'
    end
    @airline =  Alliance.where("alliance = ?", params[:alliance_val])
    respond_to do |format|
      format.js
    end
  end

  def update_seat
    @seat =  Aircraft.where("airline = ?", params[:airline_val]).pluck(:seat).uniq
    @airline_logo =  Airline.where("airline= ?", params[:airline_val]).first.airline_logo
    respond_to do |format|
      format.js
    end
  end

  def update_aircraft
    @aircraft = Aircraft.where("airline = ? AND seat =?",params[:airline_val],params[:product_val])
    #@logo = Aircraft.where("AIRLINE = ? AND SEAT =?",params[:airline],params[:seat]).pluck(:AIRCRAFT_LOGO).first

    respond_to do |format|
      format.js
    end
  end


  def update_routes
   @routes = Route.where("airline = ? AND aircraft = ?", params[:airline_val],  params[:aircraft_val])
   @aircraft_logo = Aircraft.where("airline = ? AND aircraft = ?", params[:airline_val],  params[:aircraft_val]).pluck(:aircraft_logo)

   respond_to do |format|
      format.js
    end
  end

  def result
    @routes = Route.where("airline = ? AND origin = ? AND destination = ?",
                          params[:search][:airline],params[:search][:routes1],params[:search][:routes2] )
    @miles = @routes.map{|route| Mile.where("zone = ?", route.zone.to_i)}

  respond_to do |format|
    format.html
  end
  end

end
