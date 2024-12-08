module Api
  module V1
    class AddressesController < ApplicationApiController
      def index
        address = @current_user.addresses
        render json: address, status: :ok
      end

      def show
        address = @current_user.addresses.find(params[:id])
        render json: address, status: :ok
      end

      def create
        address = @current_user.addresses.build(address_params)

        if address.save
          @current_user.addresses.exclude_current(address.id).update_all(primary_address: false) if @current_user.addresses.count > 1
          render json: address, status: :created
        else
          render json: { errors: address.errors.full_messages }, status: :unprocessable_entity
        end
      end

      private

      def address_params
        params.require(:address).permit(:street, :city, :state, :zip, :country)
      end
    end
  end
end
