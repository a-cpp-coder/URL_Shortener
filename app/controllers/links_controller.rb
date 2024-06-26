class LinksController < ApplicationController
  before_action :set_link, only: [:show, :edit, :update, :destroy]
  def index
    @links = Link.recent_first
    @link ||= Link.new
  end

  def show
  end

  def create
    @link = Link.new(link_params)
    if @link.save
      respond_to do |format|
        format.html { redirect_to root_path }
        format.turbo_stream { render turbo_stream: turbo_stream.prepend("links", @link)}
           # background job done
      end
    else
      index # to make sure not render the nil
      render :index, status: :unprocessable_entity
    end
  end

  def edit
  end

  def update
    if @link.update(link_params)
      redirect_to @link
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @link.destroy
    redirect_to root_path, notice: "Link has been successfully deleted."
  end

  private
  def link_params
    params.require(:link).permit(:url)  # only allow the `url` parameter
  end
end