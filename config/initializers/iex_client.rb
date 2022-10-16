IEX::Api.configure do |config|
  config.publishable_token = Rails.credentials.iex[:iex_publishable] # defaults to ENV['IEX_API_PUBLISHABLE_TOKEN']# defaults to ENV['IEX_API_SECRET_TOKEN']
  config.endpoint = 'https://cloud.iexapis.com/v1' # use 'https://sandbox.iexapis.com/v1' for Sandbox
end