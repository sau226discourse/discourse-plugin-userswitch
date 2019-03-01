module UserSwitch
  def self.included base
    base.class_eval do

  # Can we impersonate this user?
  def can_impersonate?(target)
    target &&

    # You must be an admin to impersonate (unless you are allowed to switch per the rules below)
    (target.username = "SomeUserAdmin" && current_user.username = "SomeUser" || is_admin?) &&

    # You may not impersonate other admins unless you are a dev or are allowed to do so by the rules
    (!target.admin? || is_developer? || target.username = "SomeUserAdmin" && current_user.username = "SomeUser")

    # Additionally, you may not impersonate yourself;
    # but the two tests for different admin statuses
    # make it impossible to be the same user.
  end

   end
 end
end

Guardian.send(:include, UserSwitch)
