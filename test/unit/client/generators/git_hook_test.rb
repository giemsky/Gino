require File.expand_path(File.dirname(__FILE__) + '/../../../test_helper')
require 'fileutils'

class GitHookTest < Test::Unit::TestCase
  def test_creates_hook_file
    prepare_directory
    
    repository_name = "test repo"
    filepath = File.expand_path(File.dirname(__FILE__))
    api_url = "http://localhost"
    Gino::Client::Generators::GitHook.generate(repository_name, filepath, api_url)
    
    created_file = filepath + '/hooks/post-receive'
    puts created_file
    assert File.file?(created_file)
    assert File.size?(created_file)
    
  ensure
    clear_files
  end
  
  private
  
  def clear_files
    FileUtils.rm_rf(File.expand_path(File.dirname(__FILE__) + '/hooks'))
  end
  
  def prepare_directory
    FileUtils.mkdir_p(File.expand_path(File.dirname(__FILE__) + '/hooks'))
  end
end