require 'rails_helper'

RSpec.describe VotesController, regressor: true do
  # === Routes (REST) ===
  it { should route(:post, '/posts/1/up-vote').to('votes#up_vote', {:post_id=>"1"}) } 
	it { should route(:post, '/posts/1/down-vote').to('votes#down_vote', {:post_id=>"1"}) } 
  # === Callbacks (Before) ===
  it { should use_before_filter(:set_xhr_redirected_to) }
	it { should use_before_filter(:set_request_method_cookie) }
	it { should use_before_filter(:configure_permitted_parameters) }
	it { should use_before_filter(:load_post_and_vote) }
  # === Callbacks (After) ===
  it { should use_after_filter(:abort_xdomain_redirect) }
  # === Callbacks (Around) ===
  
end