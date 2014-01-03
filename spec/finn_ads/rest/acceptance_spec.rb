require 'finn_ads/rest'
require 'finn_ads/job_posting'

describe "finn.no REST client" do
  let(:partner_id) { ENV['FINN_ADS_PARTNER_ID'] }
  let(:ad_id) { 'unique-ad-id' }
  subject(:client) { FinnAds::Rest::Client.new(partner_id) }

  let(:job_posting) do
    posting = FinnAds::JobPosting.new
    posting.orderno = 'unique-order-id'
    posting.job_title = 'The Pirate Captain'
    posting
  end

  it "posts jobs" do
    expect { client.ad(job_posting.orderno) }.to raise_error(FinnAds::AdNotFound)
    job = client.post_job(job_posting)
    expect(client.ad(job.id).orderno).to eq(job.orderno)
  end
end
