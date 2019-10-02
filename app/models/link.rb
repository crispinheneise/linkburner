# frozen_string_literal: true

class Link < ApplicationRecord
  has_secure_token :token
end
