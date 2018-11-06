module FlashHelper
  def message_class(type)
    case type
    when 'alert'
      'negative'
    when 'notice'
      'warning'
    when 'success'
      'positive'
    end
  end

  def icon_class(type)
    case type
    when 'alert'
      'exclamation circle'
    when 'notice'
      'exclamation triangle'
    when 'success'
      'check circle'
    end
  end
end
