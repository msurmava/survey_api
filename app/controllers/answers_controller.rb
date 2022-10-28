class AnswersController < ApplicationController
  before_action :get_question
  before_action :check_responder, only: [:create]
  before_action :authenticate, only: [:index]
  before_action :check_if_user_has_access, only: [:index]
  def index
    @answers = @question.answers
    render json: {answers: @answers}
  end

  def create
    @answer = Answer.new(answer_params)
    @answer.question = @question

    @answer.user = User.first
    if @answer.save    
      save_responder
    else
      render json: {erors: @answer.errors}, status: 400
    end
  end

  private
  def get_question
    @question = Question.find(params[:question_id])
  end

  def answer_params
    params.require(:answer).permit(:text, :option_id)
  end

  def save_responder
    answerresponder =  Answerresponder.new(answer_id: @answer.id, responder_id: @responder.id)
    if answerresponder.save
      render json: {message: "Answered qustion: #{@question.body}"}
    else
      @answer.destroy
      render json: {erors: answerresponder.errors}, status: 400
    end
  end

  def check_if_user_has_access
    u_companies = @user.companies.collect(&:id)
    q_companies = @question.inquiry.research.companies.collect(&:id)
    access = q_companies.length == (q_companies.length - u_companies.length )
    if access == true
      return render json: {errors: "you don't have access to the answers of this question"} 
    else
      return
    end
  end
end
