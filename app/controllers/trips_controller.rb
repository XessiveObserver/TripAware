class TripsController < ApplicationController
    def index
        #display trips for a particular user
        @trips = current_user.trips.all.order(created_at: :desc)
    end

    def show
        @trip = Trip.find(params[:id])
    end

    def new
        @trip = current_user.trips.build
    end

    def create
        @trip = current_user.trips.build(trip_params)

        if @trip.save
            redirect_to trips_path, notice: "Trip was successfully created."
        else
            render :new, status: :unprocessable_entity
        end
    end

    def edit
        @trip = Trip.find(params[:id])
    end

    def update
        @trip = Trip.find(params[:id])
        if @trip.update(trip_params)
            redirect_to @trip, notice: "Trip was successfully updated."
        else
            render :new, status: :unprocessable_entity
        end
    end

    def destroy
        @trip = Trip.find(params[:id])
        @trip.destroy
        
        redirect_to @trip, status: :see_other, notice: "Trip was successfully deleted."
    end

    private
        def trip_params
            params.require(:trip).permit(:name, :origin, :destination, :reason, :for_how_long)
        end
end
