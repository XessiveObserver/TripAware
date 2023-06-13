class PitStopsController < ApplicationController
    before_action :set_trip
    before_action :set_pit_stop, only: [:edit, :update, :destroy]

    def new
        @pit_stop = @trip.pit_stops.build
    end

    def create
        @pit_stop = @trip.pit_stops.build(pit_stop_params)

        if @pit_stop.save
           redirect_to @trip, notice: 'Pit stop was successfully created.'
        else
           render :new
        end
    end

    def edit
    end

    def update
        if @pit_stop.update(pit_stop_params)
            redirect_to @trip, notice: 'Pit stop was successfully updated.'
        else
            render :edit
        end
    end

    def destroy
        @pit_stop.destroy

        redirect_to @trip, notice: 'Pit stop was successfully destroyed.'
    end

    private
        def set_trip
            @trip = Trip.find(params[:trip_id])
        end

        def set_pit_stop
            @pit_stop = @trip.pit_stops.find(params[:id])
        end

        def pit_stop_params
            params.require(:pit_stop).permit(:name, :location, :remarks)
        end
end
