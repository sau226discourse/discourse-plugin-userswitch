# name: userswitch
# about: A plugin to allow users defined in its code to impersonate other defined users
# version: 0.0.1
# authors: sau226

require 'guardian'

module UserSwitch
  def self.included base
    base.class_eval do

     # Can we impersonate this user?
     def can_impersonate?(target)
       target &&

       # You must be an admin to impersonate (unless you are allowed to switch per the rules below)
       (target_user.username = "someuseradmin" && source_user.username = "someuser" || is_admin?) &&

       # You may not impersonate other admins unless you are a dev or are allowed to do so by the rules
       (!target.admin? || is_developer? || target_user.username = "someuseradmin" && source_user.username = "someuser")

       # Additionally, you may not impersonate yourself;
       # but the two tests for different admin statuses
       # make it impossible to be the same user.
     end

  end
 end
end

Guardian.send(:include, UserSwitch)
