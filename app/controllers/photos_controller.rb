class PhotosController < ApplicationController
  def index
    matching_records = Photo.all
    @list_of_photos = matching_records.order({:created_at => :desc})
    render({ :template => "photo_templates/index" })
  end
end
