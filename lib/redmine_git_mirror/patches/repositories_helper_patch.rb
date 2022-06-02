
module RedmineGitMirror
  module Patches
    # unloadable
    module RepositoriesHelperPatch
      def git_mirror_field_tags(form, repository)
        content_tag('p', form.text_field(
          :url,
          :size => 60,
          :required => true,
          :disabled => !repository.safe_attribute?('url'),
          ) +
          content_tag('em', l(:text_git_mirror_url_note), :class => 'info')
        )
      end
    end
  end
end


unless RepositoriesController.included_modules.include?(RedmineGitMirror::Patches::RepositoriesHelperPatch)
  RepositoriesController.send(:include, RedmineGitMirror::Patches::RepositoriesHelperPatch)
end
