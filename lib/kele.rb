require 'httparty'
require 'json'
require './lib/roadmap.rb'

class Kele
  include HTTParty
  attr_reader :auth_token

  def initialize(email, password)
    response = self.class.post(base_url("sessions"), body: { email: email, password: password } )
    @auth_token = response["auth_token"]
    if @auth_token.nil?
      puts "Invalid credentials."
    end
  end

  def get_me
    response = self.class.get(base_url("users/me"), headers: { "authorizaton" => @auth_token })
    JSON.parse(response.body)
  end

  def get_mentor_availability(mentor_id)
    response = self.class.get(base_url("mentors/#{mentor_id}/student_availability"), headers: { "authorization" => @auth_token })
    JSON.parse(response.body)
  end


  private

  def base_url(endpoint)
    "https://www.bloc.io/api/v1/#{endpoint}"
  end
end
