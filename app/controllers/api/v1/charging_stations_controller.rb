module Api
  module V1
    class ChargingStationsController < ApplicationController
      before_action :set_charging_station, only: %i[show update delete]

      def index
        station = ChargingStation.all
        if station
          render json: station, status: :ok
        else
          render json: { message: 'Зарядных станций пока нету' }, status: :unprocessable_entity
        end
      end

      def show
        if @station
          render json: @station, status: :ok
        else
          render json: { message: 'Зарядная станция не найдена' }, status: :unprocessable_entity
        end
      end

      def create
        station = ChargingStation.new(charging_station_params)

        if station.save
          render json: station, status: :ok
        else
          render json: { message: 'Зарядная станция не создана' }, status: :unprocessable_entity
        end
      end

      def update
        if @station.update(charging_station_params)
          render json: @station, status: :ok
        else
          render json: { message: 'Не удалось обновить зарядную станцию' }, status: :unprocessable_entity
        end
      end

      def delete
        if @station.delete
          render json: { message: 'Зарядная станция удалена' }, status: :ok
        else
          render json: { message: 'Не удалось удалить зарядную станцию' }, status: :unprocessable_entity
        end
      end

      private

      def charging_station_params
        params.require(:charging_station).permit(:name, :status, :max_power)
      end

      def set_charging_station
        @station = ChargingStation.find(params[:id])
      end
    end
  end
end
