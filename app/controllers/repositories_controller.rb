class RepositoriesController < ApplicationController
  def index
    access_hash = { 'access_token' => session[:token] }
    github = GithubService.new(access_hash)
    @repos_array = github.get_repos
  end

  def create
    github = GithubService.new(access_hash)
    name = params[:name].to_json
    github.create_repo(name)
    
    redirect_to '/'
  end
end
