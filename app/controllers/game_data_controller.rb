class GameDataController < ApplicationController

  # GET /dict
  # GET /dict.json
  def dict
    @json = GameData.all.first_or_create(:dict => '{}', :state => '{}')[:dict]
    @post_url = request.url

    if request.format == 'json'
      render json: @json
    end
  end

  # POST /dict
  def save_dict
    _json = request.body.read
    _record = GameData.all.first
    _record[:dict] = _json
    _record.save
    render json: _json
  end

  # GET /state
  # GET /state.json
  def state
    @json = GameData.all.first_or_create(:dict => '{}', :state => '{}')[:state]
    @post_url = request.url

    if request.format == 'json'
      render json: @json
    end
  end

  # POST /state
  def save_state
    _json = request.body.read
    _record = GameData.all.first
    _record[:state] = _json
    _record.save

    render json: _json
  end

  # GET /game
  def game
  end

  # GET /game/assets/:path
  def assets
    _path = 'public/assets/game'
    _files = Dir.glob("#{_path}/sounds/*.*") + (Dir.glob("#{_path}/graphics/*.*").delete_if { |element| element.include?('icon') })
    _files += Dir.glob("#{_path}/graphics/#{params[:path]}/**/*.*")

    _files.map { |element| element['public/'] = '' }

    render json: _files
  end
end
