
class HomeController < ApplicationController
  def index
  end
  
  def programmer_auth
    client = Octokit::Client.new(:login => params[:username], :password => params[:password])
    
    begin
      gh_auth = client.create_authorization({:scopes => ["repo"], :note => "GHGP Testing", :note_url=> "http://githubguestpass.com"})
    rescue Octokit::Unauthorized
      flash[:error] = 'Error authenticing to Github, double check your credentials' 
      return redirect_to '/'
    rescue
      flash[:error] = 'Error authenticing to Github, unknown reason' 
      return redirect_to '/'
    end  

    flash[:success] = 'You have authenticated to Github'     
    #session[:gh_id] = gh_auth.id
    #session[:gh_token] = gh_auth.token
    session[:gh_login] = client.login
    session[:gh_password] = client.password
    redirect_to '/programmer'
  end
  
  def programmer
    client = Programmer.auth_user_from_session(session)
    @all_repos = client.repositories()
  end
  
end
