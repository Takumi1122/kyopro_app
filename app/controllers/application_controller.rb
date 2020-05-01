class ApplicationController < ActionController::Base
  helper_method :current_user, :recent_articles, :recent_problems
  before_action :login_required

  private

  def current_user
    @current_user ||= User.find_by(id: session[:user_id]) if session[:user_id]
  end

  def recent_articles
    @articles = Article.all
    @articles.order(created_at: :desc).limit(5)
  end

  def recent_problems
    @problems = Problem.all
    @problems.order(created_at: :desc).limit(5)
  end

  def login_required
    redirect_to login_path unless current_user
  end
end
