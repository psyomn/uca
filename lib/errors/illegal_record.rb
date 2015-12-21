module Errors
  # This denotes that some action with our business logic tried to do something
  # illegal, and we disallow it with this type
  # @author psyomn
  class IllegalError < StandardError; end
end
