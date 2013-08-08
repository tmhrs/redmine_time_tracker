# encoding: utf-8

require 'redmine'

require_dependency 'redmine_time_tracker/time_tracker_hooks'

Redmine::Plugin.register :redmine_time_tracker do
    name 'Redmine Time Tracker plugin'
    #author 'Jérémie Delaitre'
    author 'Jeremie Delaitre / y.yoshida'
    description 'This is a plugin to track time in Redmine'
    version '0.5'
    url 'https://github.com/yoshidayo/redmine_time_tracker'
    author_url 'http://www.ibs.inte.co.jp/'

    requires_redmine :version_or_higher => '1.1.0'

    settings :default => { 'refresh_rate' => '60', 'status_transitions' => {} }, :partial => 'settings/time_tracker'

    permission :view_others_time_trackers, :time_trackers => :index
    permission :delete_others_time_trackers, :time_trackers => :delete

    menu :account_menu, :time_tracker_menu, '',
        {
            :caption => '',
            :html => { :id => 'time-tracker-menu' },
            :first => true,
            :param => :project_id,
            :if => Proc.new { User.current.logged? }
        }
end

require 'dispatcher' unless Rails::VERSION::MAJOR >= 3

if Rails::VERSION::MAJOR >= 3
   ActionDispatch::Callbacks.to_prepare do
     # use require_dependency if you plan to utilize development mode
     require 'redmine_time_tracker/time_trackers_patches'
   end
else
  Dispatcher.to_prepare BW_AssetHelpers::PLUGIN_NAME do
    # use require_dependency if you plan to utilize development mode
    require 'redmine_time_tracker/time_trackers_patches'
  end
end