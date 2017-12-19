class GenresController < ApplicationController
	def new
		@genre=Genre.new
	end

	def show
		@asubgenres=SubGenre.find_by_sql("select * from sub_genres where genreId = " + params[:id].to_s + " and subgenreName in(select subgenreName from leaderboards where userId = " + cur_user.id.to_s + ")")
		@subgenres=SubGenre.find_by_sql("select * from sub_genres where genreId = " + params[:id].to_s + " and subgenreName not in(select subgenreName from leaderboards where userId = " + cur_user.id.to_s + ")")
	end

	def create
		@genre = Genre.new(params.require(:genre).permit(:genreName))
  		if @genre.save
  			@genre.genreId=@genre.id
  			@genre.save
  			redirect_to '/genres/'+@genre.id.to_s
  		else
  			redirect_to "/genres/new"
  		end
	end

	def leaderboard
		@genreName = params[:genreName]
		@subgenreName = params[:subgenreName]
		@leaders=Leaderboard.order("score DESC").all
		#@leaders=@leader.find_by_sql("select * from leaderboards where genreName = '" + params[:genreName] + "' and subgenreName = '" + params[:subgenreName] + "'")
	end

	def destroy
		Genre.find_by(id: params[:id]).destroy
		redirect_to '/users/'
	end
end
