class CompaniesController < ApplicationController
  before_action :authenticate, only: [:create, :update, :destory]

  def index
    sql = "select * from companies "
    @companies =  ActiveRecord::Base.connection.execute(sql)
    render json: {companies: @companies}
  end
  
  def show
  end

  def create
    @company = Company.new(name: params[:name])
    if @company.save 
      render json: {message: "company #{@company.name} created"}
    else
      render json: {errors: @company.errors}, status: 400
    end
  end

  def update
  end

  def destroy 
  end

end


