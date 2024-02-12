class PhotosController < ApplicationController
  def create
    #  Parameters: {"input_image"=>"https://oyster.ignimgs.com/mediawiki/apis.ign.com/starcraft-2/d/db/TychusFindlay_SC2-1.jpg", "input_caption"=>"lolol", "input_owner_id"=>"117"}

    a_new_photo = Photo.new
    a_new_photo.image = params.fetch("input_image")
    a_new_photo.caption = params.fetch("input_caption")
    a_new_photo.owner_id = params.fetch("input_owner_id")
    a_new_photo.save
    #render({ :template => "photo_templates/create" })
    redirect_to("/photos/" + a_new_photo.id.to_s)
  end

  def update
    #Parameters: {"input_image"=>"https://oyster.ignimgs.com/mediawiki/apis.ign.com/starcraft-2/d/db/TychusFindlay_SC2-1.jpg", "input_caption"=>"Its about high time", "toast_id"=>"952"}
    the_id = params.fetch("toast_id")
    matching_photos = Photo.where(:id => the_id)
    the_photo = matching_photos.at(0)

    input_image = params.fetch("input_image")
    input_caption = params.fetch("input_caption")

    the_photo.image=input_image
    the_photo.caption=input_caption
    the_photo.save

    #render({ :template => "photo_templates/update" })
    next_url= "/photos/" + the_photo.id.to_s
    redirect_to(next_url)
  end

  def index
    matching_records = Photo.all
    @list_of_photos = matching_records.order({ :created_at => :desc })
    render({ :template => "photo_templates/index" })
  end

  def show
    #Parameters: {"path_id"=>"777"}
    url_id = params.fetch("path_id")
    matching_photos = Photo.where({ :id => url_id })

    @the_photo = matching_photos.at(0)
    render({ :template => "photo_templates/show" })
  end

  def delete
    #Parameters: {"toast_id"=>"773"}
    the_id = params.fetch("toast_id")
    matching_photos = Photo.where(:id => the_id)
    the_photo = matching_photos.at(0)
    the_photo.destroy
    #render({:template =>"photo_templates/delete"})
    redirect_to("/photos")
  end
end
