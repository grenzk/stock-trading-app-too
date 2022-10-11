IEX::Api.configure do |config|
  config.publishable_token = 'pk_68818a612ddb481686e2e6040fac49dc' # defaults to ENV['IEX_API_PUBLISHABLE_TOKEN']# defaults to ENV['IEX_API_SECRET_TOKEN']
  config.endpoint = 'https://cloud.iexapis.com/v1' # use 'https://sandbox.iexapis.com/v1' for Sandbox
end