class SignupsController < ApplicationController
    def create
        camper_rsvp = Signup.create!(signup_params)
        render json: camper_rsvp.activity, status: :created
    rescue ActiveRecord::RecordInvalid => invalid
        render json: { error: invalid.record.errors.full_messages}, status: :unprocessable_entity
    end

    private 

    def signup_params
        params.permit(:time, :camper_id, :activity_id)
    end
end
