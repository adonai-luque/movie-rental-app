class ApplicationController < ActionController::Base
  include Pagy::Backend
  include ExternalService
end
