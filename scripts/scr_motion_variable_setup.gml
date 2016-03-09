gravityValue = 0.5 //Acceleration per step by gravity.
terminalVelocity = 8 //The maximum velocity the player can fall.  Keep this low enough that the player doesn't fall through thin platforms.

walkValue = 0.4 //Acceleration when holding horizonal movement keys per step
sprintValue = 0.8 
crouchValue = 0.2

frictionValue = 0.2 //Acceleration due to friction per step

maxHorizontalVelocityWalking = 6 //The maximum horizontal velocity that the player can move in a single step.  If the player is moving through walls, this may be too high.
maxHorizontalVelocitySprinting = 10
maxHorizontalVelocityCrouching = 3

jumpVelocity = 10 //The velocity of the player's jump, affects jump height.
midAirWalkFactor = 0.02 //A factor to reduce the player's velocity control while in the air.  Keep in the range [0,1].
uphillFactor = 0.96 //The factor the player's velocity is multiplied by if they're going uphill.  This slows them down but doesn't stop them.
slideXDifference = 1
slideYDifference = 2
slideValue = 0.3
jumping = false //This is for calculating motion, do not use or change this.

hVelocity = 0;
vVelocity = 0;
canMove = true;
leftPressed = false;
rightPressed = false;
jumpPressed = false;
sprintPressed = false;
crouchPressed = false;