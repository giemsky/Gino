require File.expand_path(File.dirname(__FILE__) + '/../../test_helper')

class UpdateTest < Test::Unit::TestCase
  def test_to_json
    assert_not_nil Gino::Storage::Update.new("aa453216d1b3e49e", "68f7abf4e6f9", "refs/heads/master")
  end
end