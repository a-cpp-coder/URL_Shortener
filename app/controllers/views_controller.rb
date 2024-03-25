class ViewsController < ApplicationController
  before_action :set_link

  def show
    @link.views.create(
      ip: request.ip,
      user_agent: request.user_agent,
    ) # anti bot, increase a lot of view

    redirect_to @link.url, allow_other_host: true
  end


end