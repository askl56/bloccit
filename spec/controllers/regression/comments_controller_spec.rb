require 'rails_helper'

RSpec.describe CommentsController, regressor: true do
  # === Routes (REST) ===
  it { should route(:get, '/comments/create').to('comments#create', {}) }
	it { should route(:delete, '/posts/1/comments/1').to('comments#destroy', {post_id:"1", id:"1"}) } 
  # === Callbacks (Before) ===
  it { should use_before_filter(:set_xhr_redirected_to) }
	it { should use_before_filter(:set_request_method_cookie) }
	it { should use_before_filter(:configure_permitted_parameters) }
  # === Callbacks (After) ===
  it { should use_after_filter(:abort_xdomain_redirect) }
  # === Callbacks (Around) ===
  
end