class OptionsController < ApplicationController
  before_action :get_question
  
  def index
    @options = @question.options
    render json: {options: @options}
  end

  def create
    @option = @question.options.new(option_params)
    if @option.save
      render json: {message: "option '#{@option.body}' aded to question: #{@question.body}"}
    else
      render json: {errors: @option.errors}, status: 400
    end
  end

  private

  def option_params
    params.require(:option).permit(:body, :correct)
  end

  def get_question
    @question = Question.find(params[:question_id])
  end
end
