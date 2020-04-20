class CipherText < Message

  def decrypt(shifts)
    unshifts = shifts.map{|shift_value| shift_value * -1}
    decryption = {}
    decryption[:decryption] = shift_text(unshifts)
    decryption[:key] = ""
    decryption[:date] = ""
    decryption
  end
end
