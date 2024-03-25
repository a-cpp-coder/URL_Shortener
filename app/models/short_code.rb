class ShortCode
  ALPHABET = '0123456789abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ'.freeze
  BASE = ALPHABET.length

  def self.encode(number)
    return ALPHABET.first if number.zero? || number.nil?
    # to avoid hardcode the "0", ALPHABET may change later
    result = ""

    while number > 0 do
      index = number % BASE
      char = ALPHABET[index]
      result.prepend char
      number = number / BASE
      # result = ALPHABET[number % BASE] + result
      # number = number / BASE
    end

    result
  end

  def self.decode(number)
  end
end

# Base62.encode(1024)
# Base62.decode('gw')