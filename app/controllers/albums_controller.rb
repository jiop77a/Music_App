class AlbumsController < ApplicationController

  def show
    @album = Album.find(params[:id])
    render :show
  end

  def new
    @album = Album.new
    render :new
  end

  def create
    album = Album.new(album_params)
    if album.save!
      redirect_to albums_url
    else
      flash[:errors] = album.errors.full_messages
      redirect_to new_album_url
    end
  end

  def edit
    @album = Album.find(params[:id])
    render :edit
  end

  def update
    album = Album.find(params[:id])
    if album.update!(album_params)
      redirect_to album_url(album)
    else
      flash[:errors] = album.errors.full_messages
      redirect_to edit_album_url(album)
    end
  end

  def destroy
    album = Album.find(params[:id])
    if album.destroy!
      render text: "album destroyed"
    else
      flash[:errors] = album.errors.full_messages
      redirect_to edit_album_url(album)
    end
  end

  def album_params
    params.require(:album).permit(:name, :band_id, :recording_style)
  end
end
