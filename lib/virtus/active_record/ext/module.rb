# Suggested by http://stackoverflow.com/a/5197277.
unless Module.methods.include?(:extended_modules)
  class Module
    def extended_modules
      (class << self; self end).included_modules
    end
  end
end
