# frozen_string_literal: true

class ModalSmallComponent < ViewComponent::Base
  include Turbo::FramesHelper
  def initialize(title:, msg:)
    @title = title
    @msg = msg
  end

end
