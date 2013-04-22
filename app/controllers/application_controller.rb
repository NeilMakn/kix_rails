class ApplicationController < ActionController::Base
  protect_from_forgery

  # Make sure we only select the attributes we want from the backbone request.
  def pick (hash, *keys)
    filtered = {}
    hash.each do |key, value|
      filtered[key.to_sym] = value if keys.include?(key.to_sym)
    end
    filtered
  end
end
