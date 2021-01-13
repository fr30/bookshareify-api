class Services::JsonWebToken
  require 'jwt'
  JWT_SECRET = '2137'

  def self.encode(payload, exp = 24.hours.from_now)
    payload[:exp] = exp.to_i
    JWT.encode(payload, JWT_SECRET)
  end

  def self.decode(token)
    body = JWT.decode(token, JWT_SECRET)
    HashWithIndifferentAccess.new body.first
  end
end