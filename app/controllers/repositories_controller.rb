class RepositoriesController < ApplicationController
  def index
    access_hash = {access_token: session[:token]}
    github = GithubService.new(access_hash)
    @repos_array = github.get_repos
  end

  def create
    response = Faraday.post "https://api.github.com/user/repos", {name: params[:name]}.to_json, {'Authorization' => "token #{session[:token]}", 'Accept' => 'application/json'}
    redirect_to '/'
  end
end
