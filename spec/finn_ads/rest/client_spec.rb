require 'finn_ads/rest'

describe FinnAds::Rest::Client do
  subject(:client) { described_class.new }
  let(:job_posting) { double }

  it "posts jobs" do
    job = client.post_job(job_posting)
    expect(client.ad(job.id).id).to eq(job.id)
  end
end
