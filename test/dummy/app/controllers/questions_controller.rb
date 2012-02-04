class QuestionsController < ApplicationController
  
  def show
    @question = Question.find(params[:id])
    @question.view!(request.remote_ip)
  end

end
