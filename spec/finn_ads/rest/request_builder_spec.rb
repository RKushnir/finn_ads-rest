require 'nokogiri'
require 'helper'
require 'finn_ads/rest/request_builder'

describe FinnAds::Rest::RequestBuilder do
  subject(:builder) { described_class.new }

  it "builds request xml according to DTD" do
    request = builder.build(partner_id: 'finntechqa') do |r|
      r.object do
        r.object_head do
          r.orderno '10100576'
          r.user_reference 'enter_any_own_reference'
          r.overwrite_mmo('MODUS' => "no")
          r.versionno '1'
          r.fromdate '10.01.2013'
          r.todate '10.02.2013'
          r.object_location do
            r.streetaddress 'Grensen 5'
            r.zipcode '0159'
            r.countrycode 'NO'
          end

          r.heading 'Bli med oss og skap verdens beste markedsplass'
        end

        r.job_executive do
          r.job_title 'Javautvikler'
          r.situation 'Oslo'
          r.sector 'private'
          r.job_category do
            r.category 'ITTELECOMINTERNET'
            r.subcategory 'APPLICDEV'
          end

          r.job_category do
            r.category 'ENGINEERING'
            r.subcategory 'COMPUTERENG'
          end

          r.duration 'permanent'
          r.salary 'can be discussed'
          r.application_address do
            r.address
          end

          r.company do
            r.company_name 'FINN.no AS'
            r.logo
            r.url 'http://www.finn.no/jobb'
            r.ingress do
              r.cdata 'FINN.no har over 300 engasjerte medarbeidere som sitter samlet i Oslo sentrum. FINN er en viktig del av mediekonsernet Schibsted og av Media Norge ASA, og består av markedene FINN eiendom, FINN bil, FINN jobb, FINN torget, FINN reise og FINN oppdrag.<br/><br/>FINNs verdier som preger oss i alt vi gjør:<br/>SULT - PRESISJON - TAKHØYDE - HUMØR'
            end
            r.facebook_url 'https://www.facebook.com/finn.no'
            r.linkedin_url 'www.linkedin.com/company/12062'
            r.twitter '@FINN_no'
          end

          r.general_text_job do
            r.general_heading
            r.general_text do
              r.cdata 'Vi ser etter deg som ønsker en utfordrende hverdag med fokus på innovativ produktutvikling og heftig koding.<br/><br/>r.b Slik håper vi du er</b><br/>Du er veldig opptatt av å levere det toppsjefen vår, Christian, kaller "Good, Clean Code".'
            end
          end

          r.application_deadline '24.09.2013'
          r.application_email 'soknadPerEpost@finn.no'
          r.start_date 'Så snart som mulig'
          r.job_contact do
            r.name 'Pedro Thormodsen'
            r.title 'Produktdirektør'
            r.phone '906 72 817'
            r.email 'jobb@finn.no'
            r.linkedin_url 'http://www.linkedin.com/in/thormodsen'
            r.twitter '@hormodsen'
          end

          r.job_contact do
            r.name 'Lennart A. Augustson'
            r.title 'HR Konsulent / Ansvarlig rekruttering'
            r.phone '416 51 193'
            r.email 'hr@finn.no'
            r.linkedin_url 'http://www.linkedin.com/pub/lennart-augustson/23/475/42b'
            r.twitter
          end

          r.application_label 'Javautvikler'
          r.moreinfo do
            r.url
          end
          r.moreinfo do
            r.url
          end
          r.moreinfo do
            r.url
          end
          r.moreinfo do
            r.url 'http://labs.finn.no/'
            r.urltext 'FINN labs'
          end

          r.moreinfo do
            r.url 'http://finnjobb.wordpress.com/'
            r.urltext 'Produktblogg'
          end

          r.no_of_positions 2
          r.tags 'Java'
          r.tags 'Smidig'
          r.tags 'Lean'
          r.tags 'TDD'
          r.tags 'ruby'
          r.please_refer 'YES'
          r.video_url 'https://player.vimeo.com/video/14731655'
          r.application_mobile_url 'http://import-annonse.with.mobiletilpasset.url.no'
          r.manager_role 'senmanager'
        end
      end
    end

    p request.body
  end
end
