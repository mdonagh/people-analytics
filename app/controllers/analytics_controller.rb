# Calendar controller
class AnalyticsController < ApplicationController
  include AnalyticsHelper

  def index
    @selected_date = params["date"] ? parse_date(params["date"]) : parse_date(Date.today)
    puts @selected_date
    @call = get_analytics(access_token, 'call', @selected_date)
    @chat = get_analytics(access_token, 'chat', @selected_date)
    @email = get_analytics(access_token, 'email', @selected_date)
    @focus = get_analytics(access_token, 'focus', @selected_date)
    @meeting = get_analytics(access_token, 'meeting', @selected_date)
  rescue RuntimeError => e
    @errors = [
      {
        message: 'Microsoft Graph returned an error getting events.',
        debug: e
      }
    ]
  end

  def selected_date
    redirect_to analytics_url(date: params['date'])
  end
end
