class CommentsController < ApplicationController
  def index
    @grumble = Grumble.find(params[:grumble_id])
    @comments = @grumble.comments.order(:created_at)
    respond_to do |format|
      format.html { render :index }
      format.json { render json: @comments }
  end

  def show
    @grumble = Grumble.find(params[:grumble_id])
    @comment = Comment.find(params[:id])
  end

  def new
    @grumble = Grumble.find(params[:grumble_id])
    @comment = @grumble.comments.new
  end

  def create
    @grumble = Grumble.find(params[:grumble_id])
    @comment = @grumble.comments.create!(comment_params)
    redirect_to @grumble
  end

  def edit
    @grumble = Grumble.find(params[:grumble_id])
    @comment = Comment.find(params[:id])
  end

  def update
    @grumble = Grumble.find(params[:grumble_id])
    @comment = Comment.find(params[:id])
    @comment.update!(comment_params)
    redirect_to [@grumble, @comment]
  end

  def destroy
    @grumble = Grumble.find(params[:grumble_id])
    @comment = Comment.find(params[:id])
    @comment.destroy
    redirect_to @grumble
  end

  private

  def comment_params
    params.require(:comment).permit(:authorName, :content, :grumble_id)
  end
end
