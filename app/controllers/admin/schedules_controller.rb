# google_calendarの設定
# Initialize the client & Google+ APIrequire "google/apis/calendar_v3"
require "googleauth"
require "googleauth/stores/file_token_store"
require "date"
require "fileutils"

class Admin::SchedulesController < ApplicationController
# class GoogleCalendar
  def initialize
    @calendar = Google::Apis::CalendarV3::CalendarService.new
    @calendar.client_options.application_name = ENV['GOOGLE_CALENDAR_APPLICATION_NAME']
    #ENV[‘GOOGLE_CALENDAR_APPLICATION_NAME’] => GCPで作ったサービスアカウント名※.envに記載
    @calendar.authorization = credential
    @calendar_id = ENV['GOOGLE_CALENDAR_ID'] 
    # ENV['GOOGLE_CALENDAR_ID'] => Google Developerで取得したclient id を入れる※.envに記載
  end

  def credential
     credential = Google::Auth::ServiceAccountCredentials.make_creds(
      json_key_io: File.open(ENV['GOOGLE_CALENDAR_SECRET_PATH']), 
      #ENV[‘GOOGLE_CALENDAR_SECRET_PATH’] => 先ほどダウンロードしたjsonファイルをのパス※.envに記載
      scope: Google::Apis::CalendarV3::AUTH_CALENDAR)

    credential.fetch_access_token!

    credential
  end

  def build_event(summary:, description:, location:, start_time:, end_time:)
    Google::Apis::CalendarV3::Event.new(
        summary: summary,
        description: description,
        location: location,
        start: Google::Apis::CalendarV3::EventDateTime.new(date_time: start_time),
        end: Google::Apis::CalendarV3::EventDateTime.new(date_time: end_time)
    )
  end
  
  def index
  end

  
  def create
    event = build_event(
      summary: 'new event',
      description: 'new event is created',
      location: 'tokyo',
      start_time: DateTime.now,
      end_time: DateTime.now + 1.hour
    )

    response = @calendar.insert_event(
      @calendar_id,
      event
    )
  end

  def read
    events = @calendar.list_events(@calendar_id,
                                  time_min: Time.now,
                                  time_max: Time.now + 1.day)
    events.items.each do |event|
      Rails.logger.debug '----------------------------'
      Rails.logger.debug "-#{event.id} "
      Rails.logger.debug "-#{event.summary} "
      Rails.logger.debug "-#{event.location} "
      Rails.logger.debug "-#{event.start.date_time} "
      Rails.logger.debug "-#{event.end.date_time} "
    end
  end

  def update(event_id:)
    event = build_event(
      summary: 'updated event',
      description: 'updated event',
      location: 'Chiba',
      start_time: DateTime.now + 1.hour,
      end_time: DateTime.now + 2.hour
    )

    res = @calendar.update_event(
      @calendar_id,
      event_id,
      event
    )

    Rails.logger.debug '----------------------------'
    Rails.logger.debug "-#{res.id} "
    Rails.logger.debug "-#{res.summary} "
    Rails.logger.debug "-#{res.location} "
    Rails.logger.debug "-#{res.start.date_time} "
    Rails.logger.debug "-#{res.end.date_time} "
  end

  def delete(event_id:)
    @calendar.delete_event(
      @calendar_id,
      event_id
    )
  end
end