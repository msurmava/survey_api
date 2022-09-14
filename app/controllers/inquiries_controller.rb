class InquiriesController < ApplicationController
  before_action :authenticate, only: [:create, :destroy, :update]
  before_action :get_research
  before_action :get_inquiry, only: [:show, :destroy, :update]

  def index
    @inquiries = @research.inquiries
    render json: {inquiries: @inquiries}
  end

  def show
    render json: {inquiry: @inquiry}
  end

  def create
    @inquiry = @research.inquiries.new(name: params[:name])
    @inquiry.research = @research
    if @inquiry.save
      render json: {message: "inquiry '#{@inquiry.name}' registered for #{@research.name} research"}
    else
      render json: {errors: @inquiry.errors}, status: 400
    end
  end

  def update
    if @inquiry.update(name: params[:name])
      render json: {message: "updated successfully"}
    else
      render json: {errors: @inquiry.errors}, status: :unprocessable_entity
    end
  end

  def destroy
    if @inquiry.destroy 
      render json: {message: "deleted successfully"}
    else
      render json: {error: "couldn't delete"}, status: 400
    end
  end

  private

  def get_research
    @research = Research.find(params[:research_id])    
  end

  def get_inquiry
    @inquiry = Inquiry.find(params[:id])    
  end
end
