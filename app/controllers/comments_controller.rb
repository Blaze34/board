class CommentsController < ApplicationController
  before_action :load_obj_and_build_comment, only: :create
  load_resource except: :create
  authorize_resource

  def create
    if @comment.save

      unless params[:comment][:parent_id].blank?
        parent = @obj.comment_threads.find_by(id: params[:comment][:parent_id])

        @comment.move_to_child_of parent if parent
      end

      render partial: 'comments/comment', locals: { comment: @comment },
             layout: false, status: :created
    else
      render js: "alert('error saving');"
    end
  end

  def destroy
    if @comment.destroy
      render json: @comment, status: :ok
    else
      render js: "alert('error deleting comment');"
    end
  end

  def vote
    vote = params[:type] != 'dislike'
    if current_user.voted_as_when_voted_for(@comment) != vote
      @comment.vote voter: current_user, vote: vote
    end
    render json: likes_data
  end

  def unvote
    @comment.unliked_by current_user
    render json: likes_data
  end

  private

  def load_obj_and_build_comment
    data = params.require(:comment)
    @obj = Comment.find_commentable(data[:commentable_type], data[:commentable_id])
    @comment = Comment.build_from(@obj, current_user.id, data[:body])
  end

  def likes_data
    {
        like: @comment.count_votes_up,
        dislike: @comment.cached_votes_down,
        vote: current_user.voted_as_when_voted_for(@comment)
    }
  end
end
