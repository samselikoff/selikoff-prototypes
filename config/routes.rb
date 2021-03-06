Rails.application.routes.draw do

  protected_app = Rack::Auth::Basic.new(FrontEndBuilds::Engine) do |username, password|
    username == 'admin' && password == (Rails.env.production? ? ENV['FEB_ADMIN_PASSWORD'] : '')
  end
  mount protected_app, at: '/frontends'

  front_end 'debtonator'
  front_end 'ted-ed-lesson-creator'
  front_end 'collectrium-room'

end
