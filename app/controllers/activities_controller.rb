class ActivitiesController < ApplicationController
rescue_from ActiveRecord::RecordNotFound, with: :render_404

    def index 
        activities = Activity.all
        render json: activities
    end

    def destroy 
        activity = Activity.find(params[:id])
        activity.destroy
        head :no_content
    end

    private 

    def render_404 
        render json: { error: "Activity not found"}, status: 404
    end
end
