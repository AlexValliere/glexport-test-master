module Api
  module V1
    class ShipmentsController < ApplicationController


      def index
        if (params[:company_id].blank?)
          @shipments = Shipment.all.includes(:shipment_products)
        else
          @shipments = Shipment.where(:company_id => params[:company_id]).includes(:shipment_products)
        end

        if (params[:sort].present?)
          if (params[:direction].present?)
            @shipments = @shipments.reorder("shipments." + params[:sort] + " " + params[:direction])
          else
            @shipments = @shipments.reorder("shipments." + params[:sort] + " asc")
          end
        end

        if (params[:international_transportation_mode].present?)
          @shipments = @shipments.select { |shipment| shipment.international_transportation_mode == params[:international_transportation_mode] }
        end

      end


    end
  end
end