__author__ = "Mahaveer Verma"
__email__ = "mahaveer.verma1@gmail.com"

'''
Convex Hull:
In mathematics, the convex hull or convex envelope of a set X of points in the Euclidean plane or Euclidean space is the smallest convex set that contains X. 
For instance, when X is a bounded subset of the plane, the convex hull may be visualized as the shape enclosed by a rubber band stretched around X.
See : http://en.wikipedia.org/wiki/Convex_hull

Algorithm used: Gift Wrapping aka Jarvis March (2D)

Usage:
ConvexHull([(x1,y1),(x2,y2)...,(xn,yn)]) -- or -- ConvexHull([[x1,y1)],[x2,y2]...,[xn,yn]])
This will return a list of pts that define our convex hull. See convex_hull_test.py for a 40 point test case with output plot.
'''

import math
def ConvexHull(pts):
	convex_hull=[] # Result array which gets appended over loops
	start_pt=pts[0] # This array will (ultimately) store the value of bottom-right-most point in X-Y plane. This is where we start gift wrapping from.
	start_id=0 # Just for swapping purpose
	for x in range(1,len(pts)): # Loop to find out the bottom-right-most point.
		if(pts[x][1]<start_pt[1]):
			start_pt=pts[x]
			start_id=x
		elif (pts[x][1]==start_pt[1] and pts[x][0]>start_pt[0]):
			start_pt=pts[x]
			start_id=x
	convex_hull.append(start_pt) # First element of convex hull
	pts[0],pts[start_id]=pts[start_id],pts[0] # Modifying the input array so that our first element goes to the 0th array position. Done by swapping.
	current_pt=start_pt # To store the last found point on convex hull. Necessary for calculating angles.
	last_angle=math.pi # To store angle made by last 2 points on convex hull. Used for checking a condition which says that no new point on the hull paired with the last found point can make an angle larger than the 2nd last found point paired with the last point.
	while(pts[0]==start_pt): # Main loop. Continues as long as a closed loop is not formed.
		max_angle=-(math.pi) # Starting from -180 degree. This comes from the fact that we started with the bottom-right-most point.
		for i in range(len(pts)):
			angle=math.atan2((pts[i][1]-current_pt[1]),(pts[i][0]-current_pt[0]))
			if(angle>=max_angle and angle<last_angle):
				max_angle=angle
				temp_pt=pts[i]
		if(temp_pt!=current_pt):
			convex_hull.append(temp_pt)
			current_pt=temp_pt
			pts.remove(temp_pt)
			last_angle=max_angle
		elif(temp_pt==start_pt):
			break
	del convex_hull[-1] # To remove last element in result array which is the same as the first element.
	return convex_hull