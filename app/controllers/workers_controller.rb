class WorkersController < ApplicationController
  def index
    @search = User.search(params[:q])
    @workers = @search.result.includes(:user_fields).workers.page(params[:page])
  end

  def show
    @worker = User.find(params[:id])
  end
end
