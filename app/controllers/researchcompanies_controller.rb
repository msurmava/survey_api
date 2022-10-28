class ResearchcompaniesController < ApplicationController
    before_action :authenticate, only: [:create]
    before_action :get_company, :get_research

  def create 
    @researchcompany = Researchcompany.new(company_id: @company.id, research_id: @research.id)
    if @researchcompany.save
      render json: {message: "#{@research.name} added to #{@company.name} sucessfully"}
    else
      render json: {errors: @researchcompany.errors}, status: 400
    end
  end

  private
  def get_company
    @company = Company.find(params[:company_id])
  end

  def get_research
    @research = Research.find(params[:research_id])
  end
end
