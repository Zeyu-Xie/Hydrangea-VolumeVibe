# For every boid . . .
for each boid (boid):

    # Zero all accumulator variables (can't do this in one line in C)
​    xpos_avg, ypos_avg, xvel_avg, yvel_avg, neighboring_boids, close_dx, close_dy = 0

    # For every other boid in the flock . . .
​    for each other boid (otherboid):

        # Compute differences in x and y coordinates
​        dx = boid.x - otherboid.x
​        dy = boid.y - otherboid.y

        # Are both those differences less than the visual range?
​        if (abs(dx)<visual_range and abs(dy)<visual_range):  

            # If so, calculate the squared distance
​            squared_distance = dx*dx + dy*dy

            # Is squared distance less than the protected range?
​            if (squared_distance < protected_range_squared):

                # If so, calculate difference in x/y-coordinates to nearfield boid
​                close_dx += boid.x - otherboid.x 
​                close_dy += boid.y - otherboid.y

            # If not in protected range, is the boid in the visual range?
​            else if (squared_distance < visual_range_squared):

                # Add other boid's x/y-coord and x/y vel to accumulator variables
​                xpos_avg += otherboid.x 
​                ypos_avg += otherboid.y 
​                xvel_avg += otherboid.vx
​                yvel_avg += otherboid.vy

                # Increment number of boids within visual range
​                neighboring_boids += 1 


    # If there were any boids in the visual range . . .            
​    if (neighboring_boids > 0): 

        # Divide accumulator variables by number of boids in visual range
​        xpos_avg = xpos_avg/neighboring_boids 
​        ypos_avg = ypos_avg/neighboring_boids
​        xvel_avg = xvel_avg/neighboring_boids
​        yvel_avg = yvel_avg/neighboring_boids

        # Add the centering/matching contributions to velocity
​        boid.vx = (boid.vx + 
​                   (xpos_avg - boid.x)*centering_factor + 
​                   (xvel_avg - boid.vx)*matching_factor)

​        boid.vy = (boid.vy + 
​                   (ypos_avg - boid.y)*centering_factor + 
​                   (yvel_avg - boid.vy)*matching_factor)

    # Add the avoidance contribution to velocity
​    boid.vx = boid.vx + (close_dx*avoidfactor)
​    boid.vy = boid.vy + (close_dy*avoidfactor)


    # If the boid is near an edge, make it turn by turnfactor
    # (this describes a box, will vary based on boundary conditions)
​    if outside top margin:
​        boid.vy = boid.vy + turnfactor
​    if outside right margin:
​        boid.vx = boid.vx - turnfactor
​    if outside left margin:
​        boid.vx = boid.vx + turnfactor
​    if outside bottom margin:
​        boid.vy = boid.vy - turnfactor

​    ##############################################################
    ### ECE 5730 students only - dynamically update bias value ###
​    ##############################################################
    # biased to right of screen
​    if (boid in scout group 1): 
​        if (boid.vx > 0):
​            boid.biasval = min(maxbias, boid.biasval + bias_increment)
​        else:
​            boid.biasval = max(bias_increment, boid.biasval - bias_increment)
    # biased to left of screen
​    else if (boid in scout group 2): # biased to left of screen
​        if (boid.vx < 0):
​            boid.biasval = min(maxbias, boid.biasval + bias_increment)
​        else:
​            boid.biasval = max(bias_increment, boid.biasval - bias_increment)
​    ##############################################################

    # If the boid has a bias, bias it!
    # biased to right of screen
​    if (boid in scout group 1):
​        boid.vx = (1 - boid.biasval)*boid.vx + (boid.biasval * 1)
    # biased to left of screen
​    else if (boid in scout group 2):
​        boid.vx = (1 - boid.biasval)*boid.vx + (boid.biasval * (-1))

    # Calculate the boid's speed
    # Slow step! Lookup the "alpha max plus beta min" algorithm
​    speed = sqrt(boid.vx*boid.vx + boid.vy*boid.vy)

    # Enforce min and max speeds
​    if speed < minspeed:
​        boid.vx = (boid.vx/speed)*minspeed
​        boid.vy = (boid.vy/speed)*minspeed
​    if speed > maxspeed:
​        boid.vx = (boid.vx/speed)*maxspeed
​        boid.vy = (boid.vy/speed)*maxspeed

    # Update boid's position
​    boid.x = boid.x + boid.vx
​    boid.y = boid.y + boid.vy