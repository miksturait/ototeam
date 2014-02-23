class SlidesController < ApplicationController
  layout 'remark'

  def index
    @available_slide_files = available_slide_files
  end

  def show
    if File.exists? current_slide_file
      render file: current_slide_file
    else
      redirect_to slides_path
    end
  end

  private
  def current_slide_file
    File.join(Rails.root, 'doc/slides', "#{params[:id]}.md")
  end

  def available_slide_files
    Dir[File.join(Rails.root, 'doc/slides', '*.md')].map{|file| file.split('/').last}
  end
end
