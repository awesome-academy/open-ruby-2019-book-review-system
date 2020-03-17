Ckeditor.setup do |config|
  config.cdn_url = Settings.ckeditor.version
  require "ckeditor/orm/active_record"
end
