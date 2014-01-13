require "./levenshtein.rb"

describe "levenshtein" do
  context "When has zero argument" do
    it{ expect(levenshtein()).to eq 0 }
  end

  context "When has one argument" do
    it{ expect(levenshtein("México")).to eq 6 }
  end

  context "When has Godfather and Godfather" do
    it{ expect(levenshtein("Godfather", "Godfather")).to eq 0 }
  end

  context "When has Godfather and Godfather" do
    it{ expect(levenshtein("Godfather", "Godfather")).to eq 0 }
  end

  context "When has Godfather and Godfathe" do
    it{ expect(levenshtein("Godfather", "Godfathe")).to eq 1 }
  end

  context "When has Godfather and odfather" do
    it{ expect(levenshtein("Godfather", "odfather")).to eq 1 }
  end

  context "When has Godfather and Gdfthr" do
    it{ expect(levenshtein("Godfather", "Gdfthr")).to eq 3 }
  end

  context "When has kitten and sitten" do
    it{ expect(levenshtein("kitten", "sitting")).to eq 3 }
  end

  context "When has horse and ros" do
    it{ expect(levenshtein("horse", "ros")).to eq 3 }
  end

  context "When has GUMBO and GAMBOL" do
    it{ expect(levenshtein("GUMBO", "GAMBOL")).to eq 2 }
  end

end
