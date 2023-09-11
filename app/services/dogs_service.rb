class DogsService
  def initialize(api_key)
    @api_key = api_key
  end

  def fetch_dog_by_breed(breed)
    api_url = "https://api.api-ninjas.com/v1/dogs?name=#{breed}"
    uri = URI(api_url)

    request = Net::HTTP::Get.new(uri)
    request['X-Api-Key'] = @api_key

    response = Net::HTTP.start(uri.hostname, uri.port, use_ssl: true) do |http|
      http.request(request)
    end

    JSON.parse(response.body) if response.is_a?(Net::HTTPSuccess)
  end

  def create_dog(attributes)
    Dog.create(attributes)
  end
end
