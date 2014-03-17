# -*- coding: utf-8 -*-
# Configures your navigation
SimpleNavigation::Configuration.run do |navigation|
  navigation.items do |primary|
    if @current_user
      primary.item :events, t('layouts.application.events'), events_path, highlights_on: %r(^/$|/events)
      primary.item :friends, t('layouts.application.friends'), friends_path, highlights_on: %r(/friends)
      primary.item :groups, t('layouts.application.groups'), groups_path, highlights_on: %r(/groups)
      primary.item :profile, t('layouts.application.profile'), edit_user_registration_path
      primary.item :logout, t('layouts.application.logout'), destroy_user_session_path, method: :delete
    end
    primary.dom_class = 'nav navbar-nav'
  end
end
