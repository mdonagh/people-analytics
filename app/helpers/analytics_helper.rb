require 'httparty'
require 'date'
# Graph API helper methods
module AnalyticsHelper
  def readable_duration(duration)
    return "0" if duration == 'PT0S'
    DateTime.parse(duration).strftime('%l').strip
  end

  def call_api(url, token)
    headers = {
      Authorization: "Bearer #{token}"
    }

    HTTParty.get url, headers: headers
  end

  def get_analytics(token, type, date)
      #types = ['call', 'chat', 'email', 'focus', 'meeting']
      url = "https://graph.microsoft.com/beta/me/analytics/activitystatistics/#{type}_#{date}"
      response = call_api(url, token)
      raise response.parsed_response.to_s || "Request returned #{response.code}" unless response.code == 200
      response
  end

  def parse_date(date)
    date = Date.strptime(date, "%m/%d/%Y") if date.is_a?(String)
    "#{date.yesterday.strftime('%Y-%m-%d')}_#{date.strftime('%Y-%m-%d')}"
  end
end
