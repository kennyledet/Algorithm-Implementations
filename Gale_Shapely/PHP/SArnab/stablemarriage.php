<?php

/**
*	The Stable Marriage Problem (http://en.wikipedia.org/wiki/Stable_marriage_problem)
*	
*	The stable marriage problem is the problem of finding a stable match between 2 sets of elements given a set of preferences
*	for each elements. In this example, a list of men is provided each with a preference of women. A list of women is also
*	provided, each with a preference of men. We solve this problem by iterating through all available men and engaging
*	him to the wife he most desires. If that wife is unavailable, we go to the next one. If the wife is available and she 
*	would prefer him over her current husband, we break them up.
*	
*	@storedPreferences is used to hold a list of a man's preferences in the case he ends up back in the dating pool.
*	@engagements holds the current list of marriages.
**/

function gale_shapely($men, $women){
	$engagements = array();
	
	while(!empty($men)){
		foreach($men as $manKey => &$manPreferences){
			$preferredWoman = $manPreferences[0];
			// Is The Woman Available?
			if(!isset($engagements[$preferredWoman])){
				// Engage These Two Lovely People
				$engagements[$preferredWoman] = $manKey;
				$storedPreferences[$manKey] = $manPreferences;
				unset($men[$manKey]);
			} else {
				// The Lady Is Already Engadged :( ..But Would She Prefer This Man Instead?
				if(array_search($engagements[$preferredWoman],$women[$preferredWoman]) > array_search($manKey,$women[$preferredWoman])){
					// A Higher Index For The Engagement Means She Prefers Him LESS. (Preferences Are Ranked From Most To Least...Thus 0 => Most Preferred)
					// Put The Poor Guy Back Into The Dating Pool
					$newlySingleMan = $engagements[$preferredWoman];
					$men[$newlySingleMan] = $storedPreferences[$newlySingleMan];
					// Engage The New Homewrecking Guy To The Wife
					$engagements[$preferredWoman] = $manKey;
					$storedPreferences[$manKey] = $men[$manPreferences];
					unset($storedPreferences[$newlySingleMan],$men[$manKey]);
				} else {
					// Sorry Man..She's Happy With Her Husband
					array_shift($manPreferences);
				}
			}
		}
	}

	return ($engagements);
}
?>