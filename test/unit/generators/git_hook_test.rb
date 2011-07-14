require File.expand_path(File.dirname(__FILE__) + '/../../test_helper')
require 'fileutils'

class GitHookTest < Test::Unit::TestCase
  def setup
    FileUtils.mkdir_p(File.expand_path(File.dirname(__FILE__) + '/hooks'))
  end
  
  def teardown
    FileUtils.rm_rf(File.expand_path(File.dirname(__FILE__) + '/hooks'))
  end
  
  def test_creates_hook_file
    repository_name = "test repo"
    filepath = File.expand_path(File.dirname(__FILE__))
    api_url = "http://localhost"
    Gino::Generators::GitHook.generate(repository_name, filepath, api_url)
    
    created_file = filepath + '/hooks/post-receive'
    puts created_file
    assert File.file?(created_file)
    assert File.size?(created_file)
  end
end