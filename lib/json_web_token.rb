class JsonWebToken
  class << self
  	def encode(paylaod, exp = 12.hours.from_now)
      paylaod[:exp] = exp.to_i
      JWT.encode(paylaod, Rails.application.secret_key_base)
  	end

    def decode(token)
      body = JWT.decode(token, Rails.application.secret_key_base)[0]
      HashWithIndifferentAccess.new body
    rescue
      nil
    end
  end
end