CarrierWave.configure do |config|
  config.fog_provider = 'fog/aws'                        # required
  config.fog_credentials = {
    provider:              'AWS',                        # required
    aws_access_key_id:     ENV['S3_KEY'],                        # required
    aws_secret_access_key: ENV['S3_SECRET'],                        # required
    region:                'ap-southeast-1',                  # optional, defaults to 'us-east-1'
  }
  config.fog_directory  = ENV['S3_BUCKET']                          # required

  # For testing, upload files to local `tmp` folder.
  if Rails.env.test? || Rails.env.cucumber? || Rails.env.development?
    config.storage = :file
  else
    config.storage = :fog
  end
end
