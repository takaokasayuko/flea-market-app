class ApplicationController < ActionController::Base
  include SessionsHelper

  before_action :logged_in_user

  private

  # ホームと商品詳細ページはゲストも表示
  def logged_in_user
    allowed_paths = [ root_path ]
    product_regex = %r{^/products/\d+$}
    return if allowed_paths.include?(request.path) || request.path.match?(product_regex)

    unless logged_in?
      redirect_to login_path
    end
  end
end
