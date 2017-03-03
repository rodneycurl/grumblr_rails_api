class GrumblesController < ApplicationController
  def index
    @grumbles = Grumble.all.order(:created_at)
    respond_to do |format|
      format.html { render :index }
      format.json { render json: @grumble }
  end

  def show
    @grumble = Grumble.find(params[:id])
    respond_to do |format|
      format.html { render :show }
      format.json { render json: @grumble }
  end
end

  def new
    @grumble = Grumble.new
  end

  def create
    @grumble = Grumble.create(grumble_params)
  end

  def edit
    @grumble = Grumble.find(params[:id])
  end

  def update
    @grumble = Grumble.find(params[:id])
    @grumble.update(grumble_params)
    redirect_to @grumble
  end

  def destroy
    @grumble = Grumble.find(params[:id])
    @grumble.destroy
    redirect_to grumbles_path
  end

  private

  def grumble_params
    params.require(:grumble).permit(:authorName, :content, :title, :photoUrl)
  end
end
