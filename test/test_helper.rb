require 'test/unit'
require 'gino'

class Test::Unit::TestCase
  def create_repository_with_update
    @repository = Gino::Storage::Repository.new("some repo", "/var/lib/repo")
    @update = Gino::Storage::Update.new("aa453216d1b3e49e", "68f7abf4e6f9", "refs/heads/master")
    @repository << @update
  end
end