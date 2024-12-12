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
        has_primary_address = @current_user.addresses.exists?(primary_address: true)

        address = @current_user.addresses.build(address_params)

        address.primary_address = true unless has_primary_address

        if address.save
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
