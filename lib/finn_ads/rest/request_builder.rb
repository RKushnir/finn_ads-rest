require 'nokogiri'

module FinnAds
  module Rest
    class Request < Struct.new(:body)
    end

    class MessageUpcaseProxy < BasicObject
      def initialize(obj)
        @obj = obj
      end

      def method_missing(method_name, *arguments, &block)
        unless @obj.respond_to?(method_name)
          method_name = method_name.to_s.upcase
        end

        @obj.__send__(method_name, *arguments, &block)
      end
    end

    class RequestBuilder
      def build(params, &block)
        xml_builder = ::Nokogiri::XML::Builder.new(encoding: 'ISO-8859-1') do |xml|
          xml.doc.create_internal_subset(
            'IAD.IF.JOB',
            nil,
            "http://finn.no/dtd/IADIF-job71.dtd"
          )

          xml.send "IAD.IF.JOB" do
            xml.HEAD do
              xml.PARTNER params.fetch(:partner_id)
            end
            block.call(MessageUpcaseProxy.new(xml))
          end
        end

        Request.new(xml_builder.to_xml)
      end
    end
  end
end
