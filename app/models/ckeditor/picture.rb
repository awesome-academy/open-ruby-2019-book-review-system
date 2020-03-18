class Ckeditor::Picture < Ckeditor::Asset
  def url_content
    rails_representation_url(storage_data.variant(resize: Settings.ckeditor.resize_url_content).processed, only_path: true)
  end

  def url_thumb
    rails_representation_url(storage_data.variant(resize: ettings.ckeditor.resize_url_thumb).processed, only_path: true)
  end
end
