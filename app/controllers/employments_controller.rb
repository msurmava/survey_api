class EmploymentsController < ApplicationController
  before_action :get_company, :get_user

  def create 
    @employment = Employment.new(company_id: @company.id, user_id: @user.id)
    if @employment.save
      render json: {message: "#{@user.email} added to #{@company.name} sucessfully"}
    else
      render json: {errors: @employment.errors}, status: 400
    end
  end

  private
  def get_company
    @company = Company.find(params[:company_id])
  end

  def get_user
    @user =  User.find(params[:user_id])
  end
end
