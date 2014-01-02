module FinnAds
  module Rest
    class Client
      def post_job(*)
        Struct.new(:id).new(42)
      end

      def ad(id)
        Struct.new(:id).new(id)
      end
    end
  end
end
