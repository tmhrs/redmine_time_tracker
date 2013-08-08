Rails.application.routes.draw do
  match 'time_trackers/stop'   , :to => "time_trackers#stop"
  match 'time_trackers/start'  , :to => "time_trackers#start"
  match 'time_trackers/suspend', :to => "time_trackers#suspend"
  match 'time_trackers/resume' , :to => "time_trackers#resume"
  match 'time_trackers/render_menu', :to => "time_trackers#render_menu"
  match 'time_trackers/add_status_transition', :to => "time_trackers#add_status_transition"
  match 'time_trackers/delete_status_transition', :to => "time_trackers#delete_status_transition"
  match 'time_trackers/show_report', :to => "time_trackers#show_report"
  match 'time_trackers/delete', :to => "time_trackers#delete"
  match 'time_trackers' , :to => "time_trackers#index"
end
