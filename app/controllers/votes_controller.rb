class VotesController < ApplicationController
  # validate :author?
  # validates_uniqueness_of :voteable_id, :scope => :user_id
  before_filter :load_voteable


  

  def create
    @vote = @voteable.votes.new({:value => params[:value], :voteable_id => params[:link_id]}.merge(:user_id => current_user))
    if @vote.save
      redirect_to :back, messages: "Thank you for voting"
    else 
      redirect_to :back, :alert => "Unable to vote."
    end
  end
  
  private
    def load_voteable
      if params[:comment_id]
        @voteable = Comment.find(params[:comment_id])
      else
        @voteable = Link.find(params[:link_id])
      end
    end
    # 
    # def voted?
    #   @voteable.votes.each do |vote|
    #     redirect_to :back if vote.user == @vote.user 
    #   end
    # end
    
    # def author?
    #   
    #   redirect_to :back, :alert => "You cannot vote for your own article" if @vote.user_id == current_user
    # end
    # 


end
