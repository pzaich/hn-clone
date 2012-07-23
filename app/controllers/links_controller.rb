class LinksController < ApplicationController

	def index
	  @links = Link.all
	end

	def new
	  @link = Link.new
	end

	def create
	  @link = Link.new(params[:link])
    if @link.save
      flash[:messages] = "Thank you for your submission!"
      redirect_to root_path
    else
      render :new
    end
	end

	def show
	end

end
