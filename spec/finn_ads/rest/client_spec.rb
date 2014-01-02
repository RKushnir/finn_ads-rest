require 'finn_ads/job_posting'
require 'finn_ads/rest'

describe FinnAds::Rest::Client do
  subject(:client) { described_class.new }
  let(:job_posting) do
    posting = FinnAds::JobPosting.new
    posting.job_title = 'The Pirate Captain'
    posting
  end

  it "posts jobs" do
    job = client.post_job(job_posting)
    expect(client.ad(job.id).id).to eq(job.id)
  end
end
