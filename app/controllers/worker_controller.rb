class WorkerController < ApplicationController
  def index
    @workers = User.where(role: :worker)
  end
end
