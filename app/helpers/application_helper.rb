module ApplicationHelper
  
  def bible_books
    b = Bible.new
    b.books
  end
  
  def longdate
    d = Date.parse(Time.now.to_date.to_s)
    d.strftime('%A - %B %d, %Y')
  end
  
  def head_page_title
    title_separator = " :: "
    begin
      if @page[:head_title].length > 0
        title = "#{title_separator}#{@page[:head_title]}"
      else
        title = "#{title_separator}#{page_title}"
      end
    rescue
      title = "#{title_separator}#{page_title}"
    end
  end
  def page_title
    begin
      @page[:title]
    rescue
      "#{params[:controller]} #{params[:action]}".titleize
    end
  end
  
  def active(location)
    if params[:controller] + params[:action] == location
      return " class='active'"
    end
  end
  
  def student_class
    if params[:controller] == "children" && params[:action] == "student"
      return " #{params[:name].downcase}"
    else
      return ""
    end
  end

end
