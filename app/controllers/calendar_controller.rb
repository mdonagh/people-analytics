# Calendar controller
class CalendarController < ApplicationController
  include GraphHelper
  include AnalyticsHelper

  def index
    @events = get_calendar_events access_token || []
    @call = get_analytics(access_token, 'call')
    @chat = get_analytics(access_token, 'chat')
    @email = get_analytics(access_token, 'email')
    @focus = get_analytics(access_token, 'focus')
    @meeting = get_analytics(access_token, 'meeting')
  rescue RuntimeError => e
    @errors = [
      {
        message: 'Microsoft Graph returned an error getting events.',
        debug: e
      }
    ]
  end
end
