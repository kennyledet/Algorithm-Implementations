require './fisher_yates.rb'

describe "#fisher_yates" do
  context "empty array" do
    it{ expect(fisher_yates([])).to eq []}
  end

  context "shuffle array" do
      let(:arr){(1..10).to_a}
      it{ expect((1..10).to_a).not_to eq(fisher_yates arr)}
  end
end
