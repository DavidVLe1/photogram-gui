class PhotosController < ApplicationController
  def index
    matching_records = Photo.all
    @list_of_photos = matching_records.order({ :created_at => :desc })
    render({ :template => "photo_templates/index" })
  end

  def show
    #Parameters: {"path_id"=>"777"}
    url_id=params.fetch("path_id")
    matching_photos=Photo.where({:id=>url_id})

    @the_photo = matching_photos.at(0)
    render({ :template => "photo_templates/show" })
  end
  def delete
    #Parameters: {"toast_id"=>"773"}
    the_id=params.fetch("toast_id")
    matching_photos=Photo.where(:id=>the_id)
    the_photo=matching_photos.at(0)
    the_photo.destroy
    #render({:template =>"photo_templates/delete"})
    redirect_to("/photos")
  end
end
