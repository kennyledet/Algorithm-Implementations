-- The algorithm is a combination of http://www.crsr.net/Notes/EinsteinsProblem.html and http://blog.darrenstruthers.net/2012/10/solving-einsteins-puzzle-with-haskell.html

module EinsteinPuzzle where

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

poss :: [House]
poss = [ (color, nationality, beverage, cigar, pet) | color <- colors,
                                                      nationality <- nationalities,
                                                      beverage <- beverages,
                                                      cigar <- cigars,
                                                      pet <- pets]

-- The Brit lives in a red house.
rule1 :: House -> Bool
rule1 (color, nationality, _, _, _) | color == Red && nationality == Brit = True
				    | color == Red = False
				    | nationality == Brit = False
                                    | otherwise = True


-- The Swede keeps dogs as pets.

rule2 :: House -> Bool
rule2 (_, nationality, _, _, pet) | nationality == Swede && pet == Dog = True
			          | pet == Dog = False
			          | nationality == Swede = False
			          | otherwise = True

-- The Dane drinks tea.
rule3 :: House -> Bool
rule3 (_, nationality, beverage, _, _) | nationality == Dane && beverage == Tea = True
			               | nationality == Dane = False
			               | beverage == Tea = False
			               | otherwise = True

-- The green house owner drinks coffee.

rule5 :: House -> Bool
rule5 (color,_, beverage, _, _) | color == Green && beverage == Coffee = True
                                | color == Green = False
                                | beverage == Coffee = False
                                | otherwise = True


-- The person who smokes Pall Mall rears birds.

rule6 :: House -> Bool
rule6 (_, _, _, cigar, pet) | cigar == PallMall && pet == Bird = True
                            | cigar == PallMall = False
                            | pet == Bird = False
			    | otherwise = True

-- The owner of the yellow house smokes Dunhill.


rule7 :: House -> Bool
rule7 (color, _, _, cigar, _) | cigar == Dunhill && color == Yellow = True
                            | cigar == Dunhill = False
                            | color == Yellow = False
			    | otherwise = True

-- The owner who smokes Blue Master drinks beer.

rule12 :: House -> Bool
rule12 (_, _, beverage, cigar, _) | cigar == BlueMaster && beverage == Beer = True
                            | cigar == BlueMaster = False
                            | beverage == Beer = False
			    | otherwise = True


-- The German smokes Prince.

rule13 :: House -> Bool
rule13 (_, nationality, _, cigar, _) | cigar == Prince && nationality == German = True
                            | cigar == Prince = False
                            | nationality == German = False
			    | otherwise = True


deelsol = filter rule1 $ filter rule2 $ filter rule3 $ filter rule5 $ filter rule6 $ filter rule7 $ filter rule12 $ filter rule13 poss


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


norwegianLeftOfBlue (_:[]) = False
norwegianLeftOfBlue ((_, Norwegian, _, _, _):(Blue, _, _, _, _):_) = True
norwegianLeftOfBlue ((_, _, _, _, _):(Blue, _, _, _, _):_) = False
norwegianLeftOfBlue ((_, Norwegian, _, _, _):(_, _, _, _, _):_) = False
norwegianLeftOfBlue (_:xs) = greenHouseLeftOfWhite xs

solution = [ [h1, h2, h3, h4, h5] |h1 <- (filter rule9 $ filter (not . rule8) $ filter (not . rule14) deelsol),
                                   h2 <- (filter rule14 $ filter (not . rule8) $ filter (not . rule9) deelsol),
                                   h3 <- (filter rule8 $ filter (not . rule9) $ filter (not . rule14) deelsol),
                                   h4 <- (filter (not . rule8) $ filter (not . rule9) $ filter (not . rule14) deelsol),
                                   h5 <- (filter (not . rule8) $ filter (not . rule9) $ filter (not . rule14) deelsol),
                                   h1 `eq` h2 == False,
                                   h1 `eq` h3 == False,
                                   h1 `eq` h4 == False,
                                   h1 `eq` h5 == False,
                                   h2 `eq` h3 == False,
                                   h2 `eq` h4 == False,
                                   h2 `eq` h5 == False,
                                   h3 `eq` h4 == False,
                                   h3 `eq` h5 == False,
                                   h4 `eq` h5 == False,                               
                                   greenHouseLeftOfWhite [h1, h2, h3, h4, h5] == True,
                                   blendNeighborKeepsCats [h1, h2, h3, h4, h5] == True,
                                   horseKeeperNextToDunhillSmoker [h1, h2, h3, h4, h5] == True,
                                   blendSmokerNeighborDrinksWater [h1, h2, h3, h4, h5] == True]

 

eq :: House -> House -> Bool
eq (a,b,c,d,e) (f,g,h,i,j) | a == f = True
                           | b == g = True
                           | c == h = True
                           | d == i = True
                           | e == j = True
                           | otherwise = False 


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

