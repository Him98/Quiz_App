class PlayController < ApplicationController
  def new
  end
  
  def complete
    @scores=Leaderboard.all
    @score=@scores[@scores.length - 1].score
  end

  def show  	
    @score=0
    @genreName = params[:genreName]
    @subgenreName = params[:subgenreName]
  	@questions=Question.find_by_sql("select * from questions where genreName = '" + params[:genreName] +"' and subgenreName = '" + params[:subgenreName] + "'")
    @question=@questions[0].id
    @qs=Statestore.find_by_sql("select * from statestores where genreName = '" + params[:genreName] +"' and subgenreName = '" + params[:subgenreName] + "'")
    if @qs != []    
      @questions.each do |i|
        if i.id == @qs[0].lastquesId
          @question=i.id
          break
        end
      end
    end
    if @qs == []
      @questions.each do |i|
        Statestore.create(:genreName => @genreName, :subgenreName => @subgenreName, :lastquesId => i.id ,:score => 0)
      end
    end
    @q=Question.find_by_id(@question)
    #@qs=Statestore.find_by_sql(@subgenreName)
    @qs=Statestore.find_by_sql("select * from statestores where genreName = '" + params[:genreName] +"' and subgenreName = '" + params[:subgenreName] + "'")
    @w=@qs[0]
    @sec=@qs[1]
  end

  def update
    @score=params[:Score]
    if params[:ans].length>1 && params[:Answer].length>1
      ansarr=params[:Answer].split(',')
      f=0
      params[:ans].each do |j|
        if j.eql? ansarr[f]
          f+=1
        end
      end
      if f==ansarr.length
        @score=params[:Score].to_i+1
      end
    else
      if params[:ans].length==1 && params[:ans][0]==params[:Answer]
        @score=params[:Score].to_i+1
      end
    end
    if params[:secid]
      @cs=Statestore.find_by_sql("select * from statestores where genreName = '" + params[:genreName] + "' and subgenreName = '" + params[:subgenreName] + "' and lastquesId = " + params[:secid].to_s)
      if @cs != []
        @cs[0].score=@score
        @cs[0].save
      end
    end
    Statestore.where( lastquesId: params[:qid]).destroy_all
  	@questions=Question.find_by_sql("select * from questions where genreName = '" + params[:genreName] + "' and subgenreName = '" + params[:subgenreName] + "'")
    @qs=Statestore.find_by_sql("select * from statestores where genreName = '" + params[:genreName] + "' and subgenreName = '" + params[:subgenreName] + "'")    
    if @qs != []
      @questions.each do |i|
        if i.id == @qs[0].lastquesId
          @question=i.id
          break
        end
      end
      @q=Question.find_by_id(@question)
      @w=@qs[0]
      if @qs[1]
        @sec=@qs[1]
      end
      redirect_to play_path(:genreName => params[:genreName] , :subgenreName => params[:subgenreName])
    else
      Leaderboard.create(:genreName => params[:genreName], :subgenreName => params[:subgenreName], :score => @score, :userId => cur_user.id)
      redirect_to "/play/complete"
    end
  end
end
