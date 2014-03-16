class GroupDecorator < ApplicationDecorator
  def active_tab_class
    'active' if group.new_record?
  end
end
