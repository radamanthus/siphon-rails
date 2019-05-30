class LogsController < ApplicationController
  before_action :authenticate, :verify_headers
  
  def index
    Rails.logger.info "Messages received: #{message_count}"
    request.body.each_line do |line|
      Rails.logger.info line
    end
    head :ok
  end

private

  def authenticate
    username, password = ActionController::HttpAuthentication::Basic::user_name_and_password(request)
    drop_request unless (username == ENV['LOGDRAIN_USERNAME']) && (password == ENV['LOGDRAIN_PASSWORD'])
  end

  def drop_request
    head :ok
  end

  def message_count
    request.env['HTTP_LOGPLEX_MSG_COUNT']
  end

  def valid_content_type?
    request_content_type = request.env['CONTENT_TYPE']
    request_content_type == 'application/logplex-1'
  end

  def valid_logplex_drain_token?
    logplex_drain_token = request.env['HTTP_LOGPLEX_DRAIN_TOKEN']
    logplex_drain_token == ENV['LOGPLEX_DRAIN_TOKEN']
  end

  def verify_headers
    drop_request unless valid_content_type? && valid_logplex_drain_token?
  end
end
