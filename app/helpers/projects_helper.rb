require 'net/http'
require 'json'
module ProjectsHelper
	def auth(code)
	uri = URI("https://slack.com/api/oauth.access?client_id=2760961654.22987639603&client_secret=3213c7b05a20bdffdbfb1c42a94f1e2b&code=#{code}&redirect_uri=http://localhost:3000/report")
	res = 	Net::HTTP.get(uri)
	return JSON.parse(res)["access_token"]
    end

    def get_user(token)
    	uri=URI("https://slack.com/api/auth.test?token=#{token}")
    	res = Net::HTTP.get(uri)
    	return JSON.parse(res)
    end
end
