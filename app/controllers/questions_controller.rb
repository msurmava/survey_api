class QuestionsController < ApplicationController
  before_action :get_inquiry
  def index
    @questions = @inquiry.questions
    render json: {questions: @questions}
  end

  def create
    @question = Question.new(question_params)
    @question.inquiry = @inquiry
    if @question.save && @question.optional == true
      render json: {message: "'#{@question.body}' was asked, please add options"}
      # redirect_to controller: :options, action: :create, params: request.query_parameters and return
    elsif @question.save 
      render json: {message: "'#{@question.body}' was asked"}
    else
      render json: {errors: @question.errors}, status: 400
    end
  end

  private

  def get_inquiry
    # binding.irb
    @inquiry = Inquiry.find(params[:inquiry_id])
  end

  def question_params
    params.require(:question).permit(:body, :optional)
  end
end
