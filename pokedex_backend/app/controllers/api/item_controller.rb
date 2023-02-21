class Api::ItemController < ApplicationController
    def index
        @items = Items.all
        render :index
    end

    def create
        @items = Item.new(items_params)
        if @items.save
            render :index
        else
            render json: @items.errors.full_messages
        end
    end

    def update
        @item = Item.find(params[:id])
        if @item.update(item_params)
            redirect_to api_pokemon_url(@item)
        else
            flash.now[:errors] = @item.errors.full_messages
            render :edit
        end
    end

    def destroy
        @item = Item.find(params[:id])
        @item.destroy
        redirect_to api_pokemon_items_url
    end

    private
    def item_params
        params.require(:items).permit(:pokemon_id, :name, :price, :happiness, :image_url)
    end
end
