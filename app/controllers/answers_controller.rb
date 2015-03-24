class AnswersController < ApplicationController

  def new
    @answers = Answer.all
  end

  def create
    @question = Question.find(params[:question_id])
    @answer = @question.answers.new(answer_params)
    if @answer.save
      flash[:notice] = "Answer has been added!"
      redirect_to :back
    else
      flash[:alert] = "There was a problem. Try again."
      redirect :back
    end
  end

  private
  def answer_params
    params.require(:answer).permit(:body, :user_id, :question_id)
  end

end
