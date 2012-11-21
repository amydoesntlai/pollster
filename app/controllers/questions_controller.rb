class QuestionsController < ApplicationController

  def new
    @poll = Poll.find(params[:poll_id])
    @question = Question.new
  end

  def index
    @poll = Poll.find(params[:poll_id])
    logger.info '---------------------------------------------------------------------'
    @questions = Question.where(:poll_id => @poll.id)
  end

  def create
    @poll = Poll.find(params[:poll_id])
    @question = Question.new(params[:question])
    @question.poll_id = @poll.id
    @question.save
    redirect_to @poll
  end

end