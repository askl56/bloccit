require 'rails_helper'

RSpec.describe PostsController, regressor: true do
  # === Routes (REST) ===
  it { should route(:get, '/posts').to('posts#index', {}) }
  # === Callbacks (Before) ===
  it { should use_before_filter(:set_xhr_redirected_to) }
  it { should use_before_filter(:set_request_method_cookie) }
  it { should use_before_filter(:configure_permitted_parameters) }
  # === Callbacks (After) ===
  it { should use_after_filter(:abort_xdomain_redirect) }
  # === Callbacks (Around) ===
end
