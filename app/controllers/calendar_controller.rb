# Calendar controller
class CalendarController < ApplicationController
  include GraphHelper
  include AnalyticsHelper

  def index
    @events = get_calendar_events access_token || []
    puts get_analytics(access_token)
  rescue RuntimeError => e
    @errors = [
      {
        message: 'Microsoft Graph returned an error getting events.',
        debug: e
      }
    ]
  end
end
