require 'redmine'


base_url = File.dirname(__FILE__)

require_dependency base_url + '/lib/redmine_git_mirror/git'
require_dependency base_url + '/lib/redmine_git_mirror/ssh'
require_dependency base_url + '/lib/redmine_git_mirror/url'
require_dependency base_url + '/lib/redmine_git_mirror/settings'

Redmine::Scm::Base.add 'GitMirror'

Redmine::Plugin.register :redmine_git_mirror do
  name 'Git Mirror'
  author 'Sergey Linnik'
  description 'Add ability to create readonly mirror of remote git repository'
  version '0.8.0'
  url 'https://github.com/linniksa/redmine_git_mirror'
  author_url 'https://github.com/linniksa'

  requires_redmine :version_or_higher => '3.3.0'

  settings :default => RedmineGitMirror::Settings::DEFAULT, :partial => 'git_mirror/settings'

end


require 'repositories_helper'
require base_url + '/lib/redmine_git_mirror/patches/repositories_helper_patch'

def include(klass, patch)
  klass.send(:include, patch) unless klass.included_modules.include?(patch)
end

include(RepositoriesHelper, RedmineGitMirror::Patches::RepositoriesHelperPatch)


require base_url + '/lib/redmine_git_mirror'







