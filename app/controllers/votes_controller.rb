class VotesController < ApplicationController
  # validate :author?
  # validates_uniqueness_of :voteable_id, :scope => :user_id
  before_filter :load_voteable


  

  def create
    new_params = {:value => params[:value], :voteable_id => params[:link_id], :user_id => current_user.id}
    @vote = @voteable.votes.new(new_params)
    warn params
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



end
