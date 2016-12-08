class CarsController < ApplicationController

  def index

    # give me the value of session[:car]
    # the value of session[:car] is YAML
    # convert YAML back into ruby object instance
    #
    # @car -> to YAML -> session => redirect_to index => session => convert from YAML => @car

    # @car = YAML.load(session[:car])
  end

  def create
    if !params.has_key?(:make) || params[:make].strip.empty? ||
       !params.has_key?(:model) || params[:model].strip.empty? ||
       !params.has_key?(:year) || params[:year].strip.empty?
         flash[:info] = "Information Missing!"
    else
      @car = Car.new(params[:make], params[:model], params[:year])
      Rails.logger.info @car.inspect
      flash[:info] = "Your car has been created!"
      session[:car] = @car.to_yaml #this will save the car
    end
    redirect_to "/cars/index"
  end

  # def put_in_transporter(car)
  #   session[:car] = car.to_yaml
  # end
  #
  # def remove_from_transporter(session)
  #   car = YAML.load(session[:car])
  # end


end
