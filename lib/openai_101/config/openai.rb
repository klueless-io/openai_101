# frozen_string_literal: true

require 'dotenv'
# Dotenv.load(".env.#{ENV['APP_ENV']}") # Loads environment-specific dotenv file.
Dotenv.load('.env')

OpenAI.configure do |config|
  config.access_token = ENV.fetch('OPENAI_ACCESS_TOKEN')
  config.organization_id = ENV.fetch('OPENAI_ORGANIZATION_ID', nil)
end
