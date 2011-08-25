require "easy_arel/version"

module EasyArel
  extend ActiveSupport::Concern

  module ClassMethods

    # Shorthand access to Arel attributes
    def [] name
      arel_table[name]
    end

    def _
      self
    end
  end

  module InstanceMethods

    def _
      self.class._
    end
  end
end

ActiveSupport.on_load(:active_record) do
  include EasyArel
end