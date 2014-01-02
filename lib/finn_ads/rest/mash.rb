require 'hashie'
require 'multi_xml'

module FinnAds
  module Rest
    class Mash < ::Hashie::Mash
      def self.from_xml(xml_string)
        new(::MultiXml.parse(xml_string))
      end
    end
  end
end
