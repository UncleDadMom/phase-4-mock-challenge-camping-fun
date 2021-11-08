class CampersController < ApplicationController
rescue_from ActiveRecord::RecordNotFound, with: :render_404

    def index 
        campers = Camper.all
        render json: campers
    end

    def show 
        camper = Camper.find(params[:id])
        render json: camper, serializer: CamperActivitiesSerializer
    end

    def create 
        new_camper = Camper.create!(params.permit(:name, :age))
        render json: new_camper, status: :created
     rescue ActiveRecord::RecordInvalid => invalid
        render json: { error: invalid.record.errors.full_messages}, status: :unprocessable_entity
    end

    private 

    def render_404 
        render json: { error: "Camper not found"}, status: 404
    end

end
