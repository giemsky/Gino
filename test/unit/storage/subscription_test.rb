require File.expand_path(File.dirname(__FILE__) + '/../../test_helper')

class SubscriptionTest < Test::Unit::TestCase
  
  def setup
    create_subscription
  end
  
  def test_save
    assert @subscription.save
    assert_equal @subscription, Gino::Storage.subscriptions.first
  end
  
  def test_to_json
    @subscription.to_json
  end
end