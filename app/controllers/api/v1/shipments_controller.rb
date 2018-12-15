module Api
  module V1
    class ShipmentsController < ApplicationController


      def index

        # Only accept request with a company_id
        if (params[:company_id].blank?)
          render json: {'errors' => ["company_id is required"] }, status: 422
        else # Get records
          @shipments = Shipment.where(:company_id => params[:company_id]).includes(:shipment_products)

          # Check query string for sort query and reorder results
          if (params[:sort].present?)
            @shipments = @shipments.reorder( "shipments." + params[:sort] + " " + (params[:direction].present? ? params[:direction] : "asc") )
          end

          # Check query string for pagination query and paginate (4 records per page by default)
          if (params[:page].present?)
              @shipments = Kaminari.paginate_array(@shipments).page(params[:page]).per( (params[:per].present? ? params[:per] : 4) )
          else
            @shipments = Kaminari.paginate_array(@shipments).page(1).per(4)
          end
        end

        # Check query string for pagination query and filter results
        if (params[:international_transportation_mode].present?)
          @shipments = @shipments.select { |shipment| shipment.international_transportation_mode == params[:international_transportation_mode] }
        end

      end


    end
  end
end