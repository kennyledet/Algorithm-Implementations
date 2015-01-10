import Data.List
import Data.Maybe

data Color = Blue | Green | Red | White | Yellow deriving (Eq, Show, Enum, Bounded)
data Nationality = Brit | Dane | German | Norwegian | Swede deriving (Eq, Show, Enum, Bounded)
data Beverage = Beer | Coffee | Milk | Tea | Water deriving (Eq, Show, Enum, Bounded)
data Cigar = BlueMaster | Dunhill | PallMall | Prince | Blend deriving (Eq, Show, Enum, Bounded)
data Pet = Cat | Bird | Dog | Fish | Horse deriving (Eq, Show, Enum, Bounded)

type House = (Color, Nationality, Beverage, Cigar, Pet)

type Houses = (House, House, House, House, House)

allValues :: (Enum a, Bounded a) => [a]
allValues = [ minBound .. maxBound ]

colors = allValues
nationalities = allValues
beverages = allValues
cigars = allValues
pets = allValues

-- The Brit lives in a red house.
rule1 :: [House]
rule1 = [ (color, nationality, beverage, cigar, pet) | color <- colors,
                                                      nationality <- nationalities,
                                                      beverage <- beverages,
                                                      cigar <- cigars,
                                                      pet <- pets,
                                                      color == Red,
                                                      nationality == Brit]

-- The Swede keeps dogs as pets.
rule2 :: [House]
rule2 = [ (color, nationality, beverage, cigar, pet) | color <- colors,
                                                      nationality <- nationalities,
                                                      beverage <- beverages,
                                                      cigar <- cigars,
                                                      pet <- pets,
                                                      pet == Dog,
                                                      nationality == Swede]

-- The Dane drinks tea.
rule3 :: [House]
rule3 = [ (color, nationality, beverage, cigar, pet) | color <- colors,
                                                      nationality <- nationalities,
                                                      beverage <- beverages,
                                                      cigar <- cigars,
                                                      pet <- pets,
                                                      beverage == Tea,
                                                      nationality == Dane]

-- The green house owner drinks coffee.
rule5 :: [House]
rule5 = [ (color, nationality, beverage, cigar, pet) | color <- colors,
                                                      nationality <- nationalities,
                                                      beverage <- beverages,
                                                      cigar <- cigars,
                                                      pet <- pets,
                                                      beverage == Coffee,
                                                      color == Green]

-- The person who smokes Pall Mall rears birds.
rule6 :: [House]
rule6 = [ (color, nationality, beverage, cigar, pet) | color <- colors,
                                                      nationality <- nationalities,
                                                      beverage <- beverages,
                                                      cigar <- cigars,
                                                      pet <- pets,
                                                      cigar == PallMall,
                                                      pet == Bird]

-- The owner of the yellow house smokes Dunhill.
rule7 :: [House]
rule7 = [ (color, nationality, beverage, cigar, pet) | color <- colors,
                                                      nationality <- nationalities,
                                                      beverage <- beverages,
                                                      cigar <- cigars,
                                                      pet <- pets,
                                                      cigar == Dunhill,
                                                      color == Yellow]

-- The owner who smokes Blue Master drinks beer.
rule12 :: [House]
rule12 = [ (color, nationality, beverage, cigar, pet) | color <- colors,
                                                      nationality <- nationalities,
                                                      beverage <- beverages,
                                                      cigar <- cigars,
                                                      pet <- pets,
                                                      cigar == BlueMaster,
                                                      beverage == Beer]

-- The owner who smokes Blue Master drinks beer.
rule13 :: [House]
rule13 = [ (color, nationality, beverage, cigar, pet) | color <- colors,
                                                      nationality <- nationalities,
                                                      beverage <- beverages,
                                                      cigar <- cigars,
                                                      pet <- pets,
                                                      nationality == German,
                                                      cigar == Prince]

partRules :: [House]
partRules = nub $ rule1 ++ rule2 ++ rule3 ++ rule5 ++ rule6 ++ rule7 ++ rule12 ++ rule13

-- The man living in the house right in the center drinks milk.
rule8 :: House -> Bool
rule8 (_,_,bev,_,_) | bev == Milk = True
                    | otherwise = False



-- The Norwegian lives in the first house.
rule9 :: House -> Bool
rule9 (_,nor,_,_,_) | nor == Norwegian = True
                    | otherwise = False

-- The Norwegian lives next to the blue house.
rule14 :: House -> Bool
rule14 (blue,_,_,_,_) | blue == Blue = True
                      | otherwise = False




almost = [ [h1, h2, h3, h4, h5] |  h1 <- (filter rule9 $ filter (not . rule8) $ filter (not . rule14) partRules),
                                   h2 <- (filter rule14 partRules),
                                   h3 <- (filter rule8 partRules),
                                   h4 <- partRules,
                                   h5 <- partRules,
                                   blendNeighborKeepsCats [h1, h2, h3, h4, h5] == True,
                                   blendSmokerNeighborDrinksWater [h1, h2, h3, h4, h5] == True,
                                   horseKeeperNextToDunhillSmoker [h1, h2, h3, h4, h5] == True,
                                   greenHouseLeftOfWhite [h1, h2, h3, h4, h5] == True,
                                   englishmanInRedHouse [h1, h2, h3, h4, h5] == True,
                                   swedeKeepsDogs [h1, h2, h3, h4, h5] == True,
                                   daneDrinksTea [h1, h2, h3, h4, h5] == True,
                                   greenOwnerDrinksCoffee [h1, h2, h3, h4, h5] == True,
                                   pallmallSmokerKeepsBirds [h1, h2, h3, h4, h5] == True,
                                   yellowOwnerSmokesDunhills [h1, h2, h3, h4, h5] == True,
                                   blueMasterSmokerDrinksBeer [h1, h2, h3, h4, h5] == True,
                                   germanSmokesPrince [h1, h2, h3, h4, h5] == True]
-- Kleur, nationaliteit, drank, cigaar, huisdier

-- The green house is on the left of the white house (next to it).
greenHouseLeftOfWhite (_:[]) = False
greenHouseLeftOfWhite ((Green, _, _, _, _):(White, _, _, _, _):_) = True
greenHouseLeftOfWhite ((_, _, _, _, _):(White, _, _, _, _):_) = False
greenHouseLeftOfWhite ((Green, _, _, _, _):(_, _, _, _, _):_) = False
greenHouseLeftOfWhite (_:xs) = greenHouseLeftOfWhite xs





-- The man who smokes blend lives next to the one who keeps cats.
blendNeighborKeepsCats ((_, _, _, _, Cat):(_, _, _, Blend, _):_) = True
blendNeighborKeepsCats ((_, _, _, Blend, _):(_, _, _, _, Cat):_) = True
blendNeighborKeepsCats ((_, _, _, _, Cat):(_, _, _, _, _):_) = False
blendNeighborKeepsCats ((_, _, _, _, _):(_, _, _, _, Cat):_) = False
blendNeighborKeepsCats ((_, _, _, _, _):(_, _, _, Blend, _):_) = False
blendNeighborKeepsCats ((_, _, _, Blend, _):(_, _, _, _, _):_) = False
blendNeighborKeepsCats [_] = False
blendNeighborKeepsCats (_:xs) = blendNeighborKeepsCats xs

-- The man who keeps horses lives next to the man who smokes Dunhill.

horseKeeperNextToDunhillSmoker ((_, _,_, _, Horse):(_, _, _, Dunhill, _):_) = True
horseKeeperNextToDunhillSmoker ((_, _, _, Dunhill, _):(_, _, _, _, Horse):_) = True
horseKeeperNextToDunhillSmoker ((_, _,_, _, Horse):(_, _, _, _, _):_) = False
horseKeeperNextToDunhillSmoker ((_, _, _, _, _):(_, _, _, _, Horse):_) = False
horseKeeperNextToDunhillSmoker ((_, _,_, _, _):(_, _, _, Dunhill, _):_) = False
horseKeeperNextToDunhillSmoker ((_, _, _, Dunhill, _):(_, _, _, _, _):_) = False
horseKeeperNextToDunhillSmoker [_] = False
horseKeeperNextToDunhillSmoker (_:xs) = horseKeeperNextToDunhillSmoker xs

-- The man who smokes blend has a neighbor who drinks water.
blendSmokerNeighborDrinksWater ((_, _, Water, _, _):(_, _, _, Blend, _):_) = True
blendSmokerNeighborDrinksWater ((_, _, _, Blend, _):(_, _, Water, _, _):_) = True
blendSmokerNeighborDrinksWater ((_, _, _, _, _):(_, _, _, Blend, _):_) = False
blendSmokerNeighborDrinksWater ((_, _, _, Blend, _):(_, _, _, _, _):_) = False
blendSmokerNeighborDrinksWater ((_, _, Water, _, _):(_, _, _, _, _):_) = False
blendSmokerNeighborDrinksWater ((_, _, _, _, _):(_, _, Water, _, _):_) = False
blendSmokerNeighborDrinksWater [_] = False
blendSmokerNeighborDrinksWater (_:xs) = blendSmokerNeighborDrinksWater xs

-- -----

englishmanInRedHouse [] = False  
englishmanInRedHouse ((Red, Brit, _, _, _):_) = True
englishmanInRedHouse ((_, Brit, _, _, _):_) = False
englishmanInRedHouse ((Red, _, _, _, _):_) = False
englishmanInRedHouse (_:xs) = englishmanInRedHouse xs

swedeKeepsDogs [] = False
swedeKeepsDogs ((_, Swede, _, _, Dog):_) = True
swedeKeepsDogs ((_, Swede, _, _, _):_) = False
swedeKeepsDogs ((_, _, _, _, Dog):_) = False
swedeKeepsDogs (_:xs) = swedeKeepsDogs xs

daneDrinksTea [] = False
daneDrinksTea ((_, Dane, Tea, _, _):_) = True
daneDrinksTea ((_, Dane, _, _, _):_) = False
daneDrinksTea ((_, _, Tea, _, _):_) = False
daneDrinksTea (_:xs) = daneDrinksTea xs

greenOwnerDrinksCoffee [] = False
greenOwnerDrinksCoffee ((Green, _, Coffee, _, _):_) = True
greenOwnerDrinksCoffee ((Green, _, _, _, _):_) = False
greenOwnerDrinksCoffee ((_, _, Coffee, _, _):_) = False
greenOwnerDrinksCoffee (_:xs) = greenOwnerDrinksCoffee xs

pallmallSmokerKeepsBirds [] = False
pallmallSmokerKeepsBirds ((_, _, _, PallMall, Bird):_) = True
pallmallSmokerKeepsBirds ((_, _, _, PallMall, _):_) = False
pallmallSmokerKeepsBirds ((_, _, _, _, Bird):_) = False
pallmallSmokerKeepsBirds (_:xs) = pallmallSmokerKeepsBirds xs

yellowOwnerSmokesDunhills [] = False
yellowOwnerSmokesDunhills ((Yellow, _, _, Dunhill, _):_) = True
yellowOwnerSmokesDunhills ((_, _, _, Dunhill, _):_) = False
yellowOwnerSmokesDunhills ((Yellow, _, _, _, _):_) = False
yellowOwnerSmokesDunhills (_:xs) = yellowOwnerSmokesDunhills xs


blueMasterSmokerDrinksBeer [] = False
blueMasterSmokerDrinksBeer ((_, _, Beer, BlueMaster, _):_) = True
blueMasterSmokerDrinksBeer ((_, _, Beer, _, _):_) = False
blueMasterSmokerDrinksBeer ((_, _, _, BlueMaster, _):_) = False
blueMasterSmokerDrinksBeer (_:xs) = blueMasterSmokerDrinksBeer xs

germanSmokesPrince [] = False
germanSmokesPrince ((_, German, _, Prince, _):_) = True
germanSmokesPrince ((_, _, _, Prince, _):_) = False
germanSmokesPrince ((_, German, _, _, _):_) = False
germanSmokesPrince (_:xs) = germanSmokesPrince xs

