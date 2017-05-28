CarrierWave.configure do |config|
  config.dropbox_app_key = Rails.application.secrets.dropbox_app_key
  config.dropbox_app_secret = Rails.application.secrets.dropbox_app_secret
  config.dropbox_access_token = Rails.application.secrets.dropbox_access_token
  config.dropbox_access_token_secret = Rails.application.secrets.dropbox_access_token_secret
  config.dropbox_user_id = Rails.application.secrets.dropbox_user_id
  config.dropbox_access_type = "app_folder"
end