class RequestDispatcher
  def initialize(url,method='get',options={},client_id)
    @url = url
    @method = method
    @options = (method=='get' ? options : options.to_json)
    @client_id = client_id
  end
  
  def dispatch
    if @method == 'get'
      @url = @url + "&" + (@options.to_query rescue '') if @options.present?
      agent = Curl::Easy.new(@url)
      agent.headers["X-Desidime-Client"] = @client_id
      agent.follow_location= true
      begin
        agent.perform
        result = JSON(agent.body_str) rescue agent.body_str
      rescue Exception => e
        error = e.message
      end
    else
      begin
        agent = Curl::Easy.http_post(@url, @options ) do |curl|
          curl.headers['Accept'] = 'application/json'
          curl.headers['Content-Type'] = 'application/json'
          curl.headers['Api-Version'] = '2.2'
        end
        result = agent.body_str
      rescue Exception => e
        error = e.message
      end
    end
    return {result: result,error: error}
  end
end