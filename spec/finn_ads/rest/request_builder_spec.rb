require 'nokogiri'
require 'helper'
require 'finn_ads/rest/request_builder'

module RequestSchema
  class Document
  end

  class Head
  end

  class Object
  end

  class ObjectHead
  end

  class Job
  end

  class JobExecutive
  end

  class JobParttime
  end
end

class RequestParams < Struct.new(:partner_id, :objects)

end

describe FinnAds::Rest::RequestBuilder do
  subject(:builder) { described_class.new }
  let(:request_params) do
    RequestParams.new(
      'finntechqa',
      [nil],
    )
  end

  it "builds request xml according to DTD" do
    xml = builder.build(request_params)
    # xml = Nokogiri::XML(fixture('job_example.xml')).to_xml
    xml.sub!("<!DOCTYPE IAD.IF.JOB SYSTEM \"http://finn.no/dtd/IADIF-job71.dtd\">", "<!DOCTYPE IAD.IF.JOB SYSTEM \"spec/fixtures/IADIF-job71.dtd\">")
    puts xml

    options = Nokogiri::XML::ParseOptions::DEFAULT_XML | Nokogiri::XML::ParseOptions::DTDLOAD | Nokogiri::XML::ParseOptions::DTDVALID
    doc = Nokogiri::XML(xml, nil, nil, options)
    p doc.external_subset
    doc.external_subset.validate(doc).each {|e| raise e }
  end
end
