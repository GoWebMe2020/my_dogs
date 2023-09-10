if Rails.env.development? || Rails.env.test?
  require 'dotenv/load'
end
