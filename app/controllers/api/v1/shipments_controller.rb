module Api
  module V1
    class ShipmentsController < ApplicationController
      def index
        @shipments = Shipment.all
      end
    end
  end
end