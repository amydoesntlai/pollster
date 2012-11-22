class PollsController < ApplicationController

  def index
    @polls = Poll.all
  end

  def new
    @poll = Poll.new
  end

  def create
    @poll = Poll.new(params[:poll])
    @poll.set_admin_link
    @question = Question.new
    if @poll.save
      render 'edit'
    else
      render 'new'
    end
  end

  def edit
  end

  def show
    @question = Question.new
    if params[:id]
      @poll = Poll.find(params[:id])
    elsif params[:link]
      @poll = Poll.find_by_admin_link(params[:link])
      render 'edit'
    end
  end

end