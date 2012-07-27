module ApplicationHelper
	def down_vote_link(voteable)
		if user_signed_in?
			link_to "Down", link_votes_path(voteable, :value => -1), :method => :post, :class => "icon-arrow-down" if current_user.karma_points > 100 
		end
	end

	def up_vote_link(voteable)
		link_to "",  link_votes_path(voteable, :value => 1), :method => :post, :class => "icon-arrow-up" if user_signed_in?
	end
end
