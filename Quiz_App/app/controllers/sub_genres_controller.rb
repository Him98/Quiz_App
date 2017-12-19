class SubGenresController < ApplicationController
	def new
		@subgenre=SubGenre.new
	end

	def show
	end

	def create
		@subgenre = SubGenre.new(params.require(:subgenre).permit(:subgenreName,:genreName))
		@genre=Genre.find_by_sql("select * from genres where genreName='" + params[:subgenre][:genreName] + "'")
  		if @subgenre.save
  			@subgenre.genreId=@genre[0].id
  			@subgenre.save
  			redirect_to '/sub_genres/'+@subgenre.id.to_s
  		else
  			redirect_to "/sub_genres/new"
  		end
	end

end
