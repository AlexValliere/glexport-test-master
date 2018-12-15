module Api
  module V1
    class ShipmentsController < ApplicationController


      def index

        if (params[:company_id].blank?)
          render json: {'errors' => ["company_id is required"] }, status: 422
        else
          @shipments = Shipment.where(:company_id => params[:company_id]).includes(:shipment_products)

          if (params[:sort].present?)
            if (params[:direction].present?)
              @shipments = @shipments.reorder("shipments." + params[:sort] + " " + params[:direction])
            else
              @shipments = @shipments.reorder("shipments." + params[:sort] + " asc")
            end
          end

          if (params[:page].present?)
            if (params[:per].blank?)
              @shipments = Kaminari.paginate_array(@shipments).page(params[:page]).per(4)
            else
              @shipments = Kaminari.paginate_array(@shipments).page(params[:page]).per(params[:per])
            end
          else
            @shipments = Kaminari.paginate_array(@shipments).page(1).per(4)
          end
        end

        if (params[:international_transportation_mode].present?)
          @shipments = @shipments.select { |shipment| shipment.international_transportation_mode == params[:international_transportation_mode] }
        end

      end


    end
  end
end