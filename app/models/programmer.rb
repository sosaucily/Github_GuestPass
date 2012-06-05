class Programmer < ActiveRecord::Base
  attr_accessible :email
  
  private
  def self.auth_user_from_session(session)
    client = Octokit::Client.new(login:session["gh_login"],password:session["gh_password"])
    client.create_authorization({:scopes => ["repo"], :note => "GHGP Testing", :note_url=> "http://githubguestpass.com"})
    return client
  end
end
