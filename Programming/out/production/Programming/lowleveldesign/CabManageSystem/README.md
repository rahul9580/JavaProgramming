# CabManageSystem

This portal should be able to :
1. Register cabs.
2. Onboard various cities where cab services are provided.
3. Change current city (location) of any cab.
4. Change state of any cab. For this you will have to define a state machine for the cab ex:
a cab must have at least these two basic states; IDLE and ON_TRIP
5. Book cabs based on their availability at a certain location. In case more than one cab are
available , use the following strategy;
a. Find out which cab has remained idle the most and assign it.
b. In case of clash above, randomly assign any cab




Assumptions :

1. A cab once assigned a trip cannot cancel/reject it.


Notes -

 1. No Dependecy framework has been used
 2. Data is stored in java data structures instead of storing in some external databse like mysql in interest of time.
 3. Some dummy objects have been created in main class for testing purpose.
 4. No Unit test classes have are there.


