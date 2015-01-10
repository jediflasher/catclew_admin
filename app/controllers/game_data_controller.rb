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
    json = request.body.read
    record = GameData.all.first
    record[:dict] = json
    record.save
    render json: json
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
    json = request.body.read
    record = GameData.all.first
    record[:state] = json
    record.save

    render json: json
  end
end
