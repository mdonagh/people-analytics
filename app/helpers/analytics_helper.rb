require 'httparty'

# Graph API helper methods
module AnalyticsHelper

  def call_api(url, token)
    headers = {
      Authorization: "Bearer #{token}"
    }

    HTTParty.get url, headers: headers
  end

  def get_analytics(token, type)
      #types = ['call', 'chat', 'email', 'focus', 'meeting']
      url = "https://graph.microsoft.com/beta/me/analytics/activitystatistics/#{type}_2019-12-05_2019-12-06"
      response = call_api(url, token)
      ap response
      raise response.parsed_response.to_s || "Request returned #{response.code}" unless response.code == 200
      response
  end
end
