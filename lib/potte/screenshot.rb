require 'capybara/dsl'
require 'capybara/poltergeist'

module Potte
  class Screenshot
    include Capybara::DSL

    def initialize(user)
      @user = user

      Capybara.run_server = false
      Capybara.default_driver = :poltergeist
    end

    def capture!
      url = "#{ENV['ANNICT_URL']}/shot/#{@user.username}"
      path = "tmp/shots/#{@user.username}.png"

      begin
        result = visit(url)

        if result['status'] == 'success'
          path = save_screenshot(path, full: true)
          open(path)
        end
      rescue => e
        title = 'スクリーンショット撮影中にエラーが発生しました。'
        data = {
          inspect: e.inspect,
          backtrace: e.backtrace,
          username: @user.username,
          severity: 'error'
        }
        Bugsnag.notify(RuntimeError.new(title), data)
      end
    end
  end
end
