require 'httparty'
class Kele
  include HTTParty
  attr_reader :auth_token

  def initialize(email, password)
    response = self.class.post( base_url("sessions"),
      body: { email: email, password: password } )
    @auth_token = response["auth_token"]
    if @auth_token.nil?
      puts "Invalid credentials."
    end
  end

  private

  def base_url(endpoint)
    "https://www.bloc.io/api/v1/#{endpoint}"
  end
end
