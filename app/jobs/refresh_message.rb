require 'torquebox-cache'
    
class RefreshMessage
  
  def key
    "message_key"
  end
  
  def run
    cache = TorqueBox::Infinispan::Cache.new( :name => 'messages')
    Rails.logger.info "1) Does it contain key already? #{cache.contains_key?(self.key)}"
    Rails.logger.info "1.1) Time value: #{cache.get(key)}"
    cache.put(self.key, Time.now)
    Rails.logger.info "2) Does it contain key already? #{cache.contains_key?(self.key)}"
    Rails.logger.info "2.1) Time value: #{cache.get(key)}"
  end
  
end
