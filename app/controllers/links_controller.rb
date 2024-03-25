class LinksController < ApplicationController
  def index
    @link = Link.all
  end
end