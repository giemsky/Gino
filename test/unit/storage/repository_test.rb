require File.expand_path(File.dirname(__FILE__) + '/../../test_helper')

class RepositoryTest < Test::Unit::TestCase
  def test_save
    repository = Gino::Storage::Repository.new("some repo", "/var/lib/repo")
    repository << Gino::Storage::Update.new("aa453216d1b3e49e", "68f7abf4e6f9", "refs/heads/master")
 
    assert repository.save
    assert_equal repository, Gino::Storage::Repository.find(repository.name)
  end
  
  def test_to_json
    repository = Gino::Storage::Repository.new("some repo", "/var/lib/repo")
    repository << Gino::Storage::Update.new("aa453216d1b3e49e", "68f7abf4e6f9", "refs/heads/master")
    repository.to_json
  end
end