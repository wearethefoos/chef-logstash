require "spec_helper"

describe "chef-logstash::default" do
  let(:chef_run) do
    ChefSpec::Runner.new { |node| }.converge described_recipe
  end

  context "ubuntu", ubuntu: true do
    it "should include the apt repo" do
      exect( chef_run ).to include_recipe "chef-logstash::apt"
    end
  end
end
