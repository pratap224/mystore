# Configure Spree Preferences
#
# Note: Initializing preferences available within the Admin will overwrite any changes that were made through the user interface when you restart.
#       If you would like users to be able to update a setting with the Admin it should NOT be set here.
#
# Note: If a preference is set here it will be stored within the cache & database upon initialization.
#       Just removing an entry from this initializer will not make the preference value go away.
#       Instead you must either set a new value or remove entry, clear cache, and remove database entry.
#
# In order to initialize a setting do:
# config.setting_name = 'new value'
Spree.config do |config|
	config.use_s3 = true
  config.s3_bucket = ''
  config.s3_access_key = "AKIAINC7N3KDQDBLUWAA"
  config.s3_secret = "SlS2aSMu0my5ZgA3dhxE4Ykf5yjkHsJ1TiTHbz2v"

  # if you create your Amazon S3 bucket on Western Europe server, you need these two additional options:
  # config.attachment_url = ":s3_eu_url"
  # config.s3_host_alias = "s3-eu-west-1.amazonaws.com"
  Paperclip.interpolates(:s3_eu_url) do |attachment, style|
"#{attachment.s3_protocol}://#{Spree::Config[:s3_host_alias]}/#{attachment.bucket_name}/#{attachment.path(style).gsub(%r{^/},"")}"
  # Example:
  # Uncomment to stop tracking inventory levels in the application
  # config.track_inventory_levels = false
end

Spree.user_class = "Spree::User"
