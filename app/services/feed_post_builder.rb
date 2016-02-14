class FeedPostBuilder
  def initialize(args)
    opts = OpenStruct.new(args)
    self.term = opts.term
    self.location = opts.location
    self.data = args.data
  end
end
