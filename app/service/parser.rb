class Parser
  def initialize(action,options)
    @action = action
    @options = options
    @options[:term] = URI.encode(@options[:term]) if @options[:term].present?
  end
  
  def process
    case @action
    when 'posts'
      Post.new(@options).process
    end
  end
  
end
