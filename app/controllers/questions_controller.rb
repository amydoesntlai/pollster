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
      redirect_to admin_link_path(@poll.admin_link)
    else
      render 'new'
    end
  end

  def edit
    @question = Question.find(params[:id])
  end

  def update
  end

  def destroy
    question = Question.find(params[:id])
    poll = Poll.find(params[:poll_id])
    question.destroy
    redirect_to admin_link_path(poll.admin_link)
  end

end