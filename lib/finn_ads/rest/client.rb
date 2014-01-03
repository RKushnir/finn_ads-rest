require 'nokogiri'
require 'finn_ads/errors'

module FinnAds
  module Rest
    class RequestBuilder
      def self.build(posting)
        xml_builder = ::Nokogiri::XML::Builder.new do |xml|

        end

        xml_builder.to_xml
      end
    end

    class Client
      attr_reader :partner_id

      def initialize(partner_id)
        @partner_id = partner_id
      end

      def post_job(posting)
        request = RequestBuilder.build(posting)
        response = send_request(request)
      end

      def ad(id)
        Struct.new(:id).new(id)
      end
    end
  end
end
