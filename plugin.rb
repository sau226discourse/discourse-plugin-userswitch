# name: userswitch
# about: A plugin to allow users defined in its code to impersonate other defined users
# version: 0.0.1
# authors: sau226
enabled_site_setting :userswitch_plugin_enabled

after_initialize do
  dependency 'guardian'
  load File.expand_path('../lib/userswitch/logic.rb', __FILE__)
end
