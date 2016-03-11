//Put this script in the begin step event.  It works using the player's hitbox.
 


//First, check for ground below
grounded = true
if place_free(x,y+1) {
grounded = false
}
//If the space directly below the player is free, grounded = false
if grounded { //If there is ground below the player, set the player's vertical velocity to 0 if it is not already, and snap to the ground

} else {
    vVelocity = vVelocity + gravityValue //If there is no ground below the player, accelerate the player
    if vVelocity > terminalVelocity {
        vVelocity = terminalVelocity
    }
}

var hAccel;
hAccel = 0
var moveValue;
if obj_input.sprint {
    moveValue = sprintValue
} else {
    if obj_input.crouch {
        moveValue = crouchValue
    } else {
        moveValue = walkValue
    }
}
if obj_input.left { //Set acceleration horizontally (per step) based on keys pressed.  (both keys pressed = do nothing)
    hAccel = hAccel - moveValue
}
if obj_input.right {
    hAccel = hAccel + moveValue
}

if grounded { //Apply friction if the horizontal velocity is non-zero and the player is touching the floor
    if hVelocity > 0 {
        //show_message("left")
        hAccel = hAccel - frictionValue
        if hVelocity + hAccel < 0 { //Stop the player if the friction would make them change direction
            hAccel = -hVelocity
        }
    }
    if hVelocity < 0 {
        //show_message("right")
        hAccel = hAccel + frictionValue
        if hVelocity + hAccel > 0 { //As above
            hAccel = -hVelocity
        }
    }
   if place_free(x-slideXDifference,y+slideYDifference) and hVelocity <= 0 { //
        hAccel = hAccel - slideValue
    }
    if place_free(x+slideXDifference,y+slideYDifference) and hVelocity >= 0 { //
        hAccel = hAccel + slideValue
    }
    
}

if not grounded {
    hAccel = hAccel * midAirWalkFactor
}
hVelocity = hVelocity + hAccel

//If the player is moving faster than their maximum speed, slow them down
var maxHV;
if obj_input.sprint {
    maxHV = maxHorizontalVelocitySprinting
} else {
    if obj_input.crouch {
        maxHV = maxHorizontalVelocityCrouching
    } else {
        maxHV = maxHorizontalVelocityWalking
    } //maximum speed is different depending on movement type (Walking, running, crawling)
}
if hVelocity > maxHV {
    hVelocity = floor(hVelocity-(hVelocity-maxHV)*0.8)
}
if hVelocity < -maxHV{
    hVelocity = -hVelocity
    hVelocity = floor(hVelocity-(hVelocity-maxHV)*0.8)
    hVelocity = -hVelocity
}


//Move the player
var i;
if vVelocity >= 1 { //If the velocity is downwards, check each pixel and move by step
    for (i=1; i <= floor(vVelocity); i += 1) {
        if place_free(x,y + 1) {
            y = y + 1
        } else {
            vVelocity = 0 //Hitting the floor removes vertical velocity
        }
    }
} if vVelocity <= -1 { //If the velocity is upwards, do the same, but opposite.
    for (i=1; i <= floor(-vVelocity); i += 1) {
        if place_free(x,y - 1) {
            y = y - 1
        } else {
            vVelocity = 0 //Hitting the cieling removes vertical velocity.
        }
    }
}

var oldHV;
oldHV = hVelocity
if hVelocity >= 1 {
    for (i=1; i <= floor(oldHV); i+=1) {
        if place_free(x+1,y) { //Check first if the position in front of you is empty.
            x = x + 1
            if place_free(x,y+1) and grounded and (jumping = false) {
                y = y + 1
                //yVelocity = hVelocity
            }
            if place_free(x,y+1) and grounded and (jumping = false) {
                y = y + 1
                //yVelocity = 2*hVelocity
            }
        } else {
            if place_free(x+1,y-1) { //If not, check the position up a slope with gradient 1
                x = x + 1
                y = y - 1
                hVelocity = hVelocity*uphillFactor
                //yVelocity = -hVelocity
            } else {
                if place_free(x+1,y-2) { //If not, check the position up a slope with gradient 2
                    x = x + 1
                    y = y - 2
                    hVelocity = hVelocity*uphillFactor*uphillFactor
                    //yVelocity = -2*hVelocity
                } else {
                    hVelocity = 0 //Otherwise, conclude that the player has hit a wall, and set hVelocity to 0.
                }
            }
        }
    }
}
if hVelocity <= -1 {
    for (i=1; i <= floor(-oldHV); i+=1) {
        if place_free(x-1,y) { //Check first if the position in front of you is empty.
            x = x - 1
             if place_free(x,y+1) and grounded and (jumping = false) {
                y = y + 1
                //yVelocity = hVelocity
            }
            if place_free(x,y+1) and grounded and (jumping = false) {
                y = y + 1
                //yVelocity = 2*hVelocity
            }
        } else {
            if place_free(x-1,y-1) { //If not, check the position up a slope with gradient 1
                x = x - 1
                y = y - 1
                hVelocity = hVelocity*uphillFactor
                //yVelocity = hVelocity
            } else {
                if place_free(x-1,y-2) { //If not, check the position up a slope with gradient 2
                    x = x - 1
                    y = y - 2
                    hVelocity = hVelocity*uphillFactor*uphillFactor
                    //yVelocity = 2*hVelocity
                } else {
                    hVelocity = 0 //Otherwise, conclude that the player has hit a wall, and set hVelocity to 0.
                }
            }
        }
    }
}

jumping = false

if obj_input.jump and grounded {
    jumping = true 
    vVelocity = -jumpVelocity
}


