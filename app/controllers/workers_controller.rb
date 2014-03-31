class WorkersController < ApplicationController
  def index
    @search = User.search(params[:q])
    @workers = @search.result.where('role = ?', :worker).includes(:user_fields).page(params[:page])
  end

  def show
    @worker = User.find(params[:id])
  end
end
