class Admin::BadgesController < Admin::BaseController
  before_action :authenticate_user!
  before_action :set_badge, only: %i[show edit update destroy]

  def index
    @badges = Badge.all
  end

  def new
    @badge = Badge.new
  end

  def create
    @badge = Badge.new(badge_params)

    if @badge.save
      redirect_to admin_badge_path(@badge), notice: 'Add new badge!'
    else
      render :new
    end
  end

  def show; end

  def edit; end

  def update
    if @badge.update(badge_params)
      redirect_to admin_badge_path(@badge), notice: 'Updated badge!'
    else
      render :edit
    end
  end

  def destroy
    @badge.destroy
    redirect_to admin_badge_path, notice: 'Deleted badge!'
  end

  private

  def badge_params
    params.require(:badge).permit(:title, :url_image, :rule)
  end

  def set_badge
    @badge = Badge.find(params[:id])
  end
end


