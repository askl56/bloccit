require 'rails_helper'

RSpec.describe Topics::PostsController, regressor: true do
  # === Routes (REST) ===
  it { should route(:get, '/topics/1/posts/1').to('topics/posts#show', topic_id: '1', id: '1') }
  it { should route(:get, '/topics/1/posts/new').to('topics/posts#new', topic_id: '1') }
  it { should route(:post, '/topics/1/posts').to('topics/posts#create', topic_id: '1') }
  it { should route(:get, '/topics/1/posts/1/edit').to('topics/posts#edit', topic_id: '1', id: '1') }
  it { should route(:patch, '/topics/1/posts/1').to('topics/posts#update', topic_id: '1', id: '1') }
  it { should route(:delete, '/topics/1/posts/1').to('topics/posts#destroy', topic_id: '1', id: '1') }
  # === Callbacks (Before) ===
  it { should use_before_filter(:set_xhr_redirected_to) }
  it { should use_before_filter(:set_request_method_cookie) }
  it { should use_before_filter(:configure_permitted_parameters) }
  # === Callbacks (After) ===
  it { should use_after_filter(:abort_xdomain_redirect) }
  # === Callbacks (Around) ===
end
