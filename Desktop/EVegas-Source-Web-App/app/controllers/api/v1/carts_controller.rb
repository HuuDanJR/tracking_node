class Api::V1::CartsController < Api::V1::BaseController
  skip_before_action :doorkeeper_authorize!, only: [] # Requires access token for all actions
  before_action :authenticate_user!, only: [:index, :show, :create, :update]

  include CartModule

  def initialize()
    super(CART_ATTRIBUTE)
  end

end