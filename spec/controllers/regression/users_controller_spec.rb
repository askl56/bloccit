require 'rails_helper'

RSpec.describe UsersController, regressor: true do
  # === Routes (REST) ===
  it { should route(:patch, '/users/1').to('users#update', id: '1') }
  it { should route(:get, '/users').to('users#index', {}) }
  it { should route(:get, '/users/1').to('users#show', id: '1') }
  # === Callbacks (Before) ===
  it { should use_before_filter(:set_xhr_redirected_to) }
  it { should use_before_filter(:set_request_method_cookie) }
  it { should use_before_filter(:configure_permitted_parameters) }
  it { should use_before_filter(:authenticate_user!) }
  # === Callbacks (After) ===
  it { should use_after_filter(:abort_xdomain_redirect) }
  # === Callbacks (Around) ===
end
