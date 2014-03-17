class ApplicationDecorator < Draper::Decorator
  delegate_all
  delegate :link_to, :url_for, :content_tag, :to_s, :button_to, :t, to: :h

  def edit_link
    link_to t('edit'), url_for([:edit, object])
  end

  def show_link
    link_to t('show'), object
  end

  def destroy_link
    link_to t('destroy'), object, data: { confirm: t('confirmation') }, method: :delete
  end
end
