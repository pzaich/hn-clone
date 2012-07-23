class LinksController < ApplicationController

	def index
	  @links = Kaminari::paginate_array(Link.find(:all)).page(params[:page]).per(10)
	end

	def new
	end

	def create
	end

	def show
	end

end
