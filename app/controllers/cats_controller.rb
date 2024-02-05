class CatsController < ApplicationController
    def index
        cats = Cat.all
        render json: cats
      end
    
      def show
        cat = Cat.find(params[:id])
        render json: cat
      end
    
      def create
        cat = Cat.create(cat_params)
        if cat.valid?
          render json: cat
        else
          render json: cat.errors
        end
      end
    
      def update
        cat = Cat.find(params[:id])
        cat.update(cat_params)
        if cat.valid?
          render json: cat
        else
          render json: cat.errors
        end
      end
    
      private
      def cat_params
        params.require(:cat).permit(:name, :age, :enjoys, :image)
      end
end