module Roadmap
  include HTTParty

  def get_roadmap(chain_id)
    response = self.class.get(base_url("roadmaps/#{chain_id}"), headers: { "authorization" => @auth_token })
    JSON.parse(response.body)
  end

  def get_checkpoint(checkpoint_id)
    response = self.class.get(base_url("checkpoints/#{checkpoint_id}"), headers: { "authorization" => @auth_token })
    JSON.parse(response.body)
  end
end 
