class Api::ShotsController < ApplicationController
  def create(username)
    user = User.find_by(username: username)
    f = Screencap::Fetcher.new("#{ENV['ANNICT_URL']}/shot/#{user.username}")
    screenshot = f.fetch(output: "tmp/shots/#{user.username}.png", width: 1000)
    @shot = user.shots.new(image: screenshot)

    if @shot.save
      render status: 201
    end
  end
end
