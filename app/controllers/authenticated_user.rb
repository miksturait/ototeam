class AuthenticatedUser < ApplicationController
  before_filter :authenticate_user!
end
