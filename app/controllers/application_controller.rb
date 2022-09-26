class ApplicationController < ActionController::Base
  before_action :set_all_tags
  def set_all_tags
    @all_tags = Tag.order('id ASC').limit(4)
  end
end
