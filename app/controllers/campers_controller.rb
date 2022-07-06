class CampersController < ApplicationController
rescue_from ActiveRecord::RecordNotFound, with: :record_not_found
def index
    campers = Camper.all
    render json:campers.to_json(only: [:name, :age])
end

def show
    camper = Camper.find(params[:id])
    render json:camper
end

private

def record_not_found
    render json: {error: "Camper not found" }, status: :not_found
end

end
