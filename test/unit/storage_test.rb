require File.expand_path(File.dirname(__FILE__) + '/../test_helper')

class StorageTest < Test::Unit::TestCase
  def test_to_json
    repository = Gino::Storage::Repository.new("some repo", "/var/lib/repo")
    repository << Gino::Storage::Update.new("aa453216d1b3e49e", "68f7abf4e6f9", "refs/heads/master")
    
    assert_not_nil Gino::Storage.to_json
  end
end