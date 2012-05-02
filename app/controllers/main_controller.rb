class MainController < ApplicationController
  def index
    key = "message_key"
    cache = TorqueBox::Infinispan::Cache.new( :name => 'messages')
    time = cache.get(key)
    time ||= "was not found!"

    Rails.logger.info "3) Does it contain key already? #{cache.contains_key?(key)}"
    render :text => time
  end
end
