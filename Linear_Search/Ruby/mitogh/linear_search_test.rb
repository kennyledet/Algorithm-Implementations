require "./linear_search.rb"

describe "#linear_search" do
    let!(:array){[1,5,8,23,123,123,345,1,-3,5,23542,23,32423]}
    context "When has zero elements" do
        it{ expect(linear_search()).to be_nil }
    end
    context "When only has one argument" do
        it{ expect(linear_search(array)).to be_nil }
        it{ expect(linear_search([],12)).to be_nil }
    end
    context "When the key exists" do
        it{ expect(linear_search(array, -3)).to be_true }
        it{ expect(linear_search(array, 23)).to be_true }
        it{ expect(linear_search(array, 1)).to be_true }
        it{ expect(linear_search(array, 23542)).to be_true }
    end
    context "When the key does not exists" do
        it{ expect(linear_search(array, 39123)).to be_nil }
        it{ expect(linear_search(array, 0)).to be_nil }
        it{ expect(linear_search(array, 90)).to be_nil }
        it{ expect(linear_search(array, 312)).to be_nil }
    end
end
