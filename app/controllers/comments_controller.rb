class CommentsController < ApplicationController
  before_filter :load_commentable
  before_filter :authenticate_user!, except: [:index, :show]


  def new
    @comment = @commentable.comments.new
  end
  
  def create
    @comment = @commentable.comments.new(params[:comment].merge(:user_id => current_user))
    @link_id = @comment.find_parent_link
    if @comment.save
      redirect_to "/links/#{@link_id}", messages: "Comment Created"
    else 
      render :new 
    end
  end
  
  def edit
    
  end
  
  def show
    @comment = @commentable.comments.new
  end
  
  private
    def load_commentable
      if params[:comment_id]
        @commentable = Comment.find(params[:comment_id])
      else params[:link_id]
        @commentable = Link.find(params[:link_id])
      end
    end
    
    
  
end
