class PlainText < Message

  def encrypt(shifts)
    encryption = {}
    encryption[:encryption] = shift_text(shifts)
    encryption[:key] = ""
    encryption[:date] = ""
    encryption
  end
end
