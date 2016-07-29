class Post
  def initialize(options)
    @options = options
    @url = AppConfig.desi_api["post"] + "?" 
  end
  
  def process
    @options.each do |key,value|
      @url += "&#{key}=#{value}"
    end
    results = RequestDispatcher.new(@url,'get',nil,AppConfig.desi_api["client_id"]).dispatch

    if results[:error].blank?
      return {post: results[:result]['data'],count:results[:result]["total_count"]}
    else
      return {post:[]}
    end 
  end
end