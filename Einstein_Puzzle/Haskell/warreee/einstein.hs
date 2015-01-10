module Einstein where
import Control.Monad (guard)
import Data.List (permutations, zip5)

data Nationality = English | Swede | Dane | Norwegian | German deriving (Eq, Show)
data Color = Red | Green | White | Yellow | Blue deriving (Eq, Show)
data Pet = Dogs | Birds | Cats | Horses | Fish deriving (Eq, Show)
data Beverage = Tea | Coffee | Milk | Beer | Water deriving (Eq, Show)
data Cigarette = PallMall | Dunhill | BlueMaster | Prince | Blend deriving (Eq, Show)

nats = [Norwegian, English, Swede, Dane, German]
colors = [Red, Green, White, Yellow, Blue]
pets = [Dogs, Birds, Cats, Horses, Fish]
bevs = [Milk, Tea, Coffee, Beer, Water]
cigs = [PallMall, Dunhill, BlueMaster, Prince, Blend]

solution = do
  k <- permutations colors
  n <- permutations nats
  p <- permutations pets
  b <- permutations bevs
  c <- permutations cigs
  let solutions = zip5 k n p b c
  guard $ englishmanInRedHouse solutions
  guard $ swedeKeepsDogs solutions
  guard $ daneDrinksTea solutions
  guard $ greenHouseLeftOfWhite solutions
  guard $ greenOwnerDrinksCoffee solutions
  guard $ pallmallSmokerKeepsBirds solutions
  guard $ yellowOwnerSmokesDunhills solutions
  guard $ centerHouseDrinksMilk solutions
  guard $ norwegianFirstHouse solutions
  guard $ blendNeighborKeepsCats solutions
  guard $ blueMasterSmokerDrinksBeer solutions
  guard $ horseKeeperNextToDunhillSmoker solutions
  guard $ germanSmokesPrince solutions
  guard $ norwegianNextToBlueHouse solutions
  guard $ blendSmokerNeighborDrinksWater solutions
  return solutions


sol = zip5 k n p b c where
				  k = permutations colors
				  n = permutations nats
				  p = permutations pets
				  b = permutations bevs
				  c = permutations cigs



englishmanInRedHouse [] = False  
englishmanInRedHouse ((Red, English, _, _, _):_) = True
englishmanInRedHouse (_:xs) = englishmanInRedHouse xs

swedeKeepsDogs [] = False
swedeKeepsDogs ((_, Swede, Dogs, _, _):_) = True
swedeKeepsDogs (_:xs) = swedeKeepsDogs xs

daneDrinksTea [] = False
daneDrinksTea ((_, Dane, _, Tea, _):_) = True
daneDrinksTea (_:xs) = daneDrinksTea xs

greenHouseLeftOfWhite (_:[]) = False
greenHouseLeftOfWhite ((Green, _, _, _, _):(White, _, _, _, _):_) = True
greenHouseLeftOfWhite (_:xs) = greenHouseLeftOfWhite xs

greenOwnerDrinksCoffee [] = False
greenOwnerDrinksCoffee ((Green, _, _, Coffee, _):_) = True
greenOwnerDrinksCoffee (_:xs) = greenOwnerDrinksCoffee xs

pallmallSmokerKeepsBirds [] = False
pallmallSmokerKeepsBirds ((_, _, Birds, _, PallMall):_) = True
pallmallSmokerKeepsBirds (_:xs) = pallmallSmokerKeepsBirds xs

yellowOwnerSmokesDunhills [] = False
yellowOwnerSmokesDunhills ((Yellow, _, _, _, Dunhill):_) = True
yellowOwnerSmokesDunhills (_:xs) = yellowOwnerSmokesDunhills xs

centerHouseDrinksMilk (_:_:(_, _, _, Milk, _):_) = True
centerHouseDrinksMilk _ = False
                                 
norwegianFirstHouse ((_, Norwegian, _, _, _):_) = True
norwegianFirstHouse _ = False

blendNeighborKeepsCats ((_, _, Cats, _, _):(_, _, _, _, Blend):_) = True
blendNeighborKeepsCats ((_, _, _, _, Blend):(_, _, Cats, _, _):_) = True
blendNeighborKeepsCats [_] = False
blendNeighborKeepsCats (_:xs) = blendNeighborKeepsCats xs

blueMasterSmokerDrinksBeer [] = False
blueMasterSmokerDrinksBeer ((_, _, _, Beer, BlueMaster):_) = True
blueMasterSmokerDrinksBeer (_:xs) = blueMasterSmokerDrinksBeer xs

horseKeeperNextToDunhillSmoker ((_, _, Horses, _, _):(_, _, _, _, Dunhill):_) = True
horseKeeperNextToDunhillSmoker ((_, _, _, _, Dunhill):(_, _, Horses, _, _):_) = True
horseKeeperNextToDunhillSmoker [_] = False
horseKeeperNextToDunhillSmoker (_:xs) = horseKeeperNextToDunhillSmoker xs

germanSmokesPrince [] = False
germanSmokesPrince ((_, German, _, _, Prince):_) = True
germanSmokesPrince (_:xs) = germanSmokesPrince xs

norwegianNextToBlueHouse ((Blue, _, _, _, _):(_, Norwegian, _, _, _):_) = True
norwegianNextToBlueHouse ((_, Norwegian, _, _, _):(Blue, _, _, _, _):_) = True
norwegianNextToBlueHouse [_] = False
norwegianNextToBlueHouse (_:xs) = norwegianNextToBlueHouse xs

blendSmokerNeighborDrinksWater ((_, _, _, Water, _):(_, _, _, _, Blend):_) = True
blendSmokerNeighborDrinksWater ((_, _, _, _, Blend):(_, _, _, Water, _):_) = True
blendSmokerNeighborDrinksWater [_] = False
blendSmokerNeighborDrinksWater (_:xs) = blendSmokerNeighborDrinksWater xs
