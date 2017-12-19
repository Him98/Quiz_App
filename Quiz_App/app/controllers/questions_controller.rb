class QuestionsController < ApplicationController
  
  def new
  	@question=Question.new
  end

  def show
  	@question=Question.find(params[:id])
  end

  def create
  	if cur_user.admin_mode
  		@question = Question.new(params.require(:question).permit(:genreName,:subgenreName,:content,:A,:B,:C,:D,:answer))
  		if @question.save
  			redirect_to '/questions/'+@question.id.to_s
  		else
  			redirect_to "/questions/new"
  		end
  	end
  end

  def index
    @questions = Question.find_by_sql("select * from questions where genreName = '" + params[:genreName] + "' and subgenreName = '" + params[:subgenreName] + "'")
    @genreName = params[:genreName]
    @subgenreName = params[:subgenreName]
  end
end
