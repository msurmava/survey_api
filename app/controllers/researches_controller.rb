class ResearchesController < ApplicationController

  def index
    sql = "select * from researches "
    @researches =  ActiveRecord::Base.connection.execute(sql)
    render json: {researches: @researches}
  end
  
  def show
  end

  def create
    @research = Research.new(name: params[:name])
    if @research.save 
      render json: {message: "research #{@research.name} created"}
    else
      render json: {errors: @research.errors}, status: 400
    end
  end
end
