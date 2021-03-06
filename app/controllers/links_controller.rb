class LinksController < ApplicationController
  before_filter :authenticate_user!, except: [:index, :show]

	def index
	  @links = Kaminari::paginate_array(sort_by_votes_desc).page(params[:page]).per(10)
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
	  @link = Link.find(params[:id])
	  @comment = Comment.new
	  @commentable = @link
	end
	
	def edit  
	  @link = Link.find(params[:id])
    if current_user.id != @link.user_id
	    redirect_to root_path, :alert => "You are not authorized to edit that page"
    end
    redirect_to root_path, :alert => "Editing time has expired." if @link.unmodifiable?
  end
  
  def update
    @link = current_user.links.find(params[:id])
    if @link.update_attributes(params[:link])
      flash[:messages] = "Your submission has been edited!"
      redirect_to root_path
    else
      render :edit
    end    
  end
  
  private
  
  def sort_by_votes_desc
    (Link.find(:all).sort_by{|link| link.total_votes }).reverse
  end

end
