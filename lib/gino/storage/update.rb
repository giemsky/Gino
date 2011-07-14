module Gino
  module Storage
    class Update
      attr_accessor :oldrev, :newrev, :created_at, :refname
      
      def initialize(oldrev, newrev, refname)
        @oldrev = oldrev
        @newrev = newrev
        @refname = refname
        @created_at = Time.now
      end
      
      def ==(other_update)
        @oldrev = other_update.oldrev &&
          @newrev = other_update.newrev &&
          @created_at = other_update.created_at &&
          @refname = other_update.refname
      end
      
      def as_json(*a)
        {
          :oldrev => @oldrev.to_json(*a),
          :newrev => @newrev.to_json(*a),
          :refname => @refname.to_json(*a),
          :created_at => @created_at.to_json(*a)
        }
      end
    end
  end
end