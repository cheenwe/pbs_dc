module ApplicationHelper


  def colors
    %w( blue-light blue blue-dark azure-light azure azure-dark indigo-light indigo indigo-dark purple-light purple purple-dark pink-light pink pink-dark red-light red red-dark orange-light orange orange-dark yellow-light yellow yellow-dark lime-light lime lime-dark green-light green green-dark teal-light teal teal-dark cyan-light cyan cyan-dark gray-light gray gray-dark gray-dark-light gray-dark gray-dark-dark white-light white white-dark)
  end

  def form_token
    s =  "<input type='hidden' name='authenticity_token' value='#{form_authenticity_token}'>"
    s << "<input name='utf8' type='hidden' value='✓'>"
    s.html_safe
  end

  def input_text_tag(label, name, value='', required = false)
      # tran_placeholder = t("hr_job.code") placeholder='#{tran_placeholder}'
      s = "    <label class='col-md-2 col-form-label mb-2'>"
      s << "        #{label} "
        if required == true
      s << "      <span class='form-required'>*</span> \n "
        end
      s << "    </label> "
      s << "<div class='col-md-12'>"
        if required == true
      s << "    <input id='#{name}' class='form-control' data-parsley-required required type='text' value='#{value}' name='#{name}'  data-parsley-trigger='keyup'   data-parsley-maxlength='254' > "
        else
      s << "    <input id='#{name}' class='form-control' type='text' value='#{value}' name='#{name}' > "
        end
      s << "</div>"
     s.html_safe
  end

  def sort_column(q, clm, model)
    # @sort_column = sort_column
    sort_link(q, clm) do
      t("#{model}.#{clm}")
    end
  end

  def t(name)
    name =  name.to_s
    if name.include?(".")
      name.split('.').last.titleize
    else
      name.titleize
    end
    # name.split('.').last.titleize
  end

  def bt(time)
    time.strftime("%Y-%m-%d %H:%M")
  end

  def bst(time)
    time.strftime("%Y-%m-%d %H:%M")
  end


end
