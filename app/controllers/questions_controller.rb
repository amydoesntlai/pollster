class QuestionsController < ApplicationController

  def index
    @poll = Poll.find(params[:poll_id])
    @questions = Question.where(:poll_id => @poll.id)
  end

  def new
    @poll = Poll.find(params[:poll_id])
    @question = Question.new
  end

  def create
    @poll = Poll.find(params[:poll_id])
    @question = Question.new(params[:question])
    @question.poll_id = @poll.id
    if @question.save
      redirect_to admin_link_path(@poll.admin_link)
    else
      render :partial => 'form', :question => @question
    end
  end

  def edit
    @question = Question.find(params[:id])
    @poll = Poll.find(params[:poll_id])
  end

  def update
    @poll = Poll.find(params[:poll_id])
    @question = Question.find(params[:id])
    @question.update_attributes(params[:question])
    redirect_to admin_link_path(@poll.admin_link)
  end

  def destroy
    question = Question.find(params[:id])
    poll = Poll.find(params[:poll_id])
    question.destroy
    redirect_to admin_link_path(poll.admin_link)
  end

end