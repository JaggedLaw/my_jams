class SongsController < ApplicationController
  before_action :set_song, only: [:show, :edit, :update]    # set the song for these actions

  def index
    @songs = Song.all
  end

  def show
  end

  def new
    @song = Song.new
  end

  def create
    @song = Song.new(song_params)      # grabbing from the private method
    if @song.save                      # if the validations went through okay
      flash[:notice] = "Song successfully added!"
      redirect_to songs_path
    else
      flash[:errors] = "Do it right!"
      render :new                      #go back to form page if there was a problem
    end
  end

  def edit
  end

  def update        # replace old params and redirect
    if @song.update(song_params)    #if the song updates with params
      redirect_to song_path(@song)
    else
      flash.now[:errors] = @song.errors.full_messages.join(", ")
      render :edit                  # re-render edit page
    end
  end

  def destroy
    song = Song.find(params[:id])
    song.destroy                          # built in Rails destroy method
    redirect_to songs_path
  end

  private

  def set_song                            # taking out repeated code
    @song = Song.find(params[:id])
  end

  def song_params
    params.require(:song).permit(:title, :artist)    #require the key song and only take the title and the artist
  end
end
