# Load the rails application
require File.expand_path('../application', __FILE__)

# Initialize the rails application
Jotpocket1::Application.initialize!

# /config/environments.rb
require 'aws/s3'
AWS::S3::DEFAULT_HOST = "s3-ap-southeast-1.amazonaws.com" # if using sg buckets