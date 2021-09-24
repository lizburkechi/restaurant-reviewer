module Api
    module V1
        class RestaurantsController < ApplicationController
            protect_from_forgery with: :null_session
          def index
              restaurants = Restaurant.all

              render json: RestaurantSerializer.new(restaurants, options).serialized_json
          end  

          def show
            restaurant = Restaurant.find_by(slug: params[:slug])
            render json: RestaurantSerializer.new(restaurant, options).serialized_json              
          end

          def create
            restaurant = Restaurant.new(restaurant_params)

            if restaurant.save
                render json: RestaurantSerializer.new(restaurant).serialized_json
            else
                render json: { error: restaurant.errors.messages }
            end  
          end

          def update
            restaurant = Restaurant.find_by(slug: params[:slug])

            if restaurant.update(restaurant_params)
                render json: RestaurantSerializer.new(restaurant, options).serialized_json
            else
                render json: { error: restaurant.errors.messages }
            end 
          end

          def destroy
            restaurant = Restaurant.find_by(slug: params[:slug])

            if restaurant.destroy
                head :no_content
            else
                render json: { error: restaurant.errors.messages }
            end 
          end

          private

          def restaurant_params
            params.require(:restaurant).permit(:name, :image_url)
          end

          #includes associated reviews rendered from serializer with restaurant data json
          #now can pass in additional resources with new instances of restaurant serializer

          def options
              @options ||= { include: %i[reviews] }
          end

        end
    end
end