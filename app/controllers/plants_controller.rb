class PlantsController < ApplicationController

    def index
        all_plants = Plant.all 
        render json: all_plants
    end

# GET /plants/:id
def show
    plant = Plant.find_by(id: params[:id])
    if plant
      render json: plant
    else
      render json: { error: "Plant not found" }, status: :not_found
    end
  end

#   def create
#     plant = Plant.create(name: params[:name], species: params[:species])
#     render json: plant, status: :created
#   end 

  def create
    plant = Plant.create(params.permit(:name, :image, :price))
    render json: plant, status: :created
  end 



end     
