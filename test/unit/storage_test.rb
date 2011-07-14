require File.expand_path(File.dirname(__FILE__) + '/../test_helper')

class StorageTest < Test::Unit::TestCase
  def test_to_json
    create_repository_with_update
    assert_not_nil Gino::Storage.to_json
  end
end