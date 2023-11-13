# frozen_string_literal: true

class ModalComponent < ViewComponent::Base
  include Turbo::FramesHelper
  def initialize( title: , submitEnd: "turbo:submit-end->turbo-modal#submitEnd")
    @title = title
    @submitEnd = submitEnd
  end

end
