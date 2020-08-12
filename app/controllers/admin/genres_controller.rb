class Admin::GenresController < ApplicationController
	before_action :authenticate_admin!
	def index
		@genres = Genre.all
		@genre = Genre.new
	end

	def create
		@genre = Genre.new(genre_params)
		@genres = Genre.all
		if @genre.save
		   redirect_back(fallback_location: root_path)
		else
		   render :index
		end
	end

	def edit
		@genre = Genre.find(params[:id])
	end

	def update
		@genre = Genre.find(params[:id])
		@genre.update(genre_params)
		redirect_to admin_genres_path
	end

	private
    def genre_params
    	params.require(:genre).permit(:name)
    end
end
