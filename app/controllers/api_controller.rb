class ApiController < ApplicationController

    def news
        @products = Product.all.order(created_at: :desc).limit(50)
        @products = jsoned_products @products
        render json: @products
    end
    
    def between_dates
        @products = Product.where(created_at: date1..date2)
        @products = jsoned_products @products
        render json: @products
    end
    
    private

    def date1
        params[:date1]&.to_date&.beginning_of_day
    end
    
    def date2
        params[:date2]&.to_date&.end_of_day
    end

    def jsoned_products(products)
        unless date1.nil? && date2.nil?
            return {message: "Please puts valid dates"} if date1 > date2
        end

        products.map do |p|
            {
                id: p.id,
                name: p.name,
                price: p.price,
                stock: p.stock,
                image: p.image
            }
        end
    end

end
