# name: userswitch
# about: A plugin to allow users defined in its code to impersonate other defined users
# version: 0.0.1
# authors: sau226

after_initialize do
  require 'guardian'
  load File.expand_path('../lib/userswitch/logic.rb', __FILE__)
end
