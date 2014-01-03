require 'nokogiri'

module FinnAds
  module Rest
    class RequestBuilder
      def build(params)
        xml_builder = ::Nokogiri::XML::Builder.new do |xml|
          xml.doc.create_internal_subset(
            'IAD.IF.JOB',
            nil,
            "http://finn.no/dtd/IADIF-job71.dtd"
          )

          xml.send "IAD.IF.JOB" do
            xml.HEAD do
              xml.PARTNER params.partner_id
            end
            params.objects.each do |object|
              xml.OBJECT do
                xml.OBJECT_HEAD do
                  xml.ORDERNO #object.object_head.orderno
                  xml.OVERWRITE_MMO('MODUS' => 'no') # all|images|urls|no
                  xml.OBJECT_LOCATION
                end
                xml.JOB do
                  xml.JOB_TITLE
                  xml.SITUATION
                  xml.SECTOR
                  xml.JOB_CATEGORY do
                    xml.CATEGORY
                    xml.SUBCATEGORY
                  end
                  xml.DURATION
                  xml.APPLICATION_LABEL
                  xml.NO_OF_POSITIONS
                end
              end
            end
          end
        end

        xml_builder.to_xml
      end
    end
  end
end
