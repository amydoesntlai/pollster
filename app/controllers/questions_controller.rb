class QuestionsController < ApplicationController

  def new
    @poll = Poll.find(params[:poll_id])
    @question = Question.new
  end

  def index
    @poll = Poll.find(params[:poll_id])
    @questions = Question.where(:poll_id => @poll.id)
  end

  def create
    @poll = Poll.find(params[:poll_id])
    @question = Question.new(params[:question])
    @question.poll_id = @poll.id
    if @question.save
      render '/polls/edit'
    else
      render 'new'
    end
  end

end