class PollsController < ApplicationController

  def new
    @poll = Poll.new
  end

  def create
    @poll = Poll.new(params[:poll])
    @poll.set_admin_link

    if @poll.save
      render 'edit'
    else
      render 'new'
    end
  end

  def edit
    redirect_to root_path
  end

  def show
    if params[:id]
      @poll = Poll.find(params[:id])
    elsif params[:link]
      @poll = Poll.find_by_admin_link(params[:link])
      render 'edit'
    end
  end

end