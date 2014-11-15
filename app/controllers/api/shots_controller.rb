class Api::ShotsController < ApplicationController
  def create(username)
    user = User.find_by(username: username)
    image_file = Potte::Screenshot.new(user).capture!
    @shot = user.shots.new(image: image_file)

    if @shot.save
      render status: 201
    else
      render status: 400, nothing: true
    end
  end
end
