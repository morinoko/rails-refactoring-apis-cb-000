class RepositoriesController < ApplicationController
  before_action :set_access_hash

  def index
    github = GithubService.new(access_hash)
    @repos_array = github.get_repos
  end

  def create
    github = GithubService.new(access_hash)
    response = Faraday.post "https://api.github.com/user/repos", {name: params[:name]}.to_json, {'Authorization' => "token #{session[:token]}", 'Accept' => 'application/json'}
    redirect_to '/'
  end

  private

  def set_access_hash
    access_hash = { 'access_token' => session[:token] }
  end
end
