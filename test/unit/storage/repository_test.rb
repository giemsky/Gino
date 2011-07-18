require File.expand_path(File.dirname(__FILE__) + '/../../test_helper')

class RepositoryTest < Test::Unit::TestCase
  
  def setup
    create_repository_with_update    
  end
  
  def test_save
    assert @repository.save
    assert_equal @repository, Gino::Storage::Repository.find(@repository.uuid)
  end
  
  def test_to_json
    @repository.to_json
  end
end