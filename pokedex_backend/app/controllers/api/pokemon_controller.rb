class Api::PokemonController < ApplicationController
    def types
        @types = Pokemon::TYPES
        render json: @types
    end
    
    def index
        @pokemons = Pokemon.all
        debugger
        # render json: @pokemons
        render json: @pokemons
    end

    def create
        @pokemon = Pokemon.new(pokemon_params)
        if @pokemon.save
            render :index
        else
            render json: @pokemon.errors.full_messages
        end
    end

    def show
        @pokemon = Pokemon.find(params[:id])
        render :show
    end

    def update
        @pokemon = Pokemon.find(params[:id])
        if @pokemon.update(pokemon_params)
            redirect_to api_pokemon_url(@pokemon)
        else
            flash.now[:errors] = @pokemon.errors.full_messages
            render :edit
        end
    end


    private
    
    def pokemon_params
        params.require(:pokemon).permit(:id, :number, :name, :attack, :defense, :poke_type, :image_url, :captured)
    end
    
end

