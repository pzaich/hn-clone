class LinksController < ApplicationController

	def index
	  @links = Kaminari::paginate_array(Link.find(:all)).page(params[:page]).per(10)
	end

	def new
	  @link = Link.new
	end

	def create
	  @link = current_user.links.new(params[:link])
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
