class RepositoriesController < ApplicationController
  def index
    access_hash = { 'access_token' => session[:token] }
    github = GithubService.new(access_hash)
    @repos_array = github.get_repos
  end

  def create
    access_hash = { 'access_token' => session[:token] }
    github = GithubService.new(access_hash)

    name = params[:name].to_json
    response = github.create_repo(name)

    redirect_to '/'
  end
end
