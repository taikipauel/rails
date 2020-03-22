class ApplicationController < ActionController::Base
  include SessionsHelper #これで、すべてのコントローラでセッション用のモジュールが使えるようになる
end
