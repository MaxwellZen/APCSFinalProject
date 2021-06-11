# APCSFinalProject

Google Doc: https://docs.google.com/document/d/1TAdbzErmyPTm-VrRlXJPJDjRmklgNQ92MiTY7oRVVT0/edit?usp=sharing \
\
UML Diagram: https://online.visual-paradigm.com/share.jsp?id=313432333837322d31 \
\
Group Name: Springing into Action\
\
Group Members: Jerry Liang, Maxwell Zen\
\
Brief Project Description: 2D soft body simulation composed of many particles connected by springs. We'd implement spring physics and rigid body collision, and let the user change parameters like spring strength, gravity, particle mass, friction, and number of moles (for Balloon). The simulation will also include balloons and rigid bodies. \
\
Compile/Run Instructions:\
Press run on Processing. This will lead you to the home page. On the home page, there are 4 options, the Soft Body Demo, Balloon Demo, Soft Bodies and Ballons Demo, and the Lab. In each, soft bodies and rigid bodies (including balloons) can be dragged with mouse to desired location. There are sliders on the right hand side that can adjust factors such as spring constant, spring dampening, gravity, particle mass, air friction, and atmospheric pressure. You can pump air into balloons by holding "," (comma key) and take air out of balloons by holding "." (period key). You can also return to the homepage by clicking on the button in the top left corner. There are a few things to note about changing these variables: you should not attempt to drag soft/rigid bodies below the ground or attempt to embed them into each other; you should not rapidly change any of the variables (e.g. spring constant) because springs/particles will need to recalculate each frame and it could cause the softbody to explode.\
\
Development Log:\
\
5/25:\
Jerry: Worked on the Particle class; wrote all of the constructors, get methods, and update methods (applyForce and updatePosition). Reached solution with Maxwell about how to create a standard time measure (we decided on creating a new class called Stage which has a public static void time variable). \
Maxwell: Worked on the Spring class, including the constructors, get methods, and the updateForce method which implements Hooke's Law to calculate the force on each particle. \
\
5/26: \
Maxwell: Created the Stage class and filled in the static variables and methods. Also refined the rectangular constructor, fixed a Spring.updateForce() bug, and changed the test case to demonstrate motion of the soft body. \
Jerry: Wrote and tested display method for Particle, Spring, and SoftBody classes. Wrote rectangular constructor for SoftBody class and also fixed error with static class with Maxwell. Outside of coding, also updated UML diagram to fit current structure.\
\
5/27:\
Jerry: Simulate gravity in SoftBody and added static variable g (for gravity) in Stage. Preliminary simulations of particles bouncing off floor (wrote bounceFloor() method). Outside of coding, updated UML diagram to fit revised structure. \
Maxwell: Created the Point class, changed the Particle class to use the Point class to represent position and velocity, and wrote methods for the Point class that will be useful for future calculations (such as spring dampening and particle collision, which we are going to implement soon). \
\
5/29: \
Maxwell: Made minor changes, including: dist, distsq, and reflect functions for Point, editing display radius and floor collisions for Particle, and fixing gravity calculation in SoftBody. \
Jerry: N/A \
\
5/30: \
Jerry: Wrote methods to simulate perfectly elastic collisions between particles. Also factored in air friction for particles. Tested collisions and effects of air friction. Updated UML diagram. \
Maxwell: implemented spring dampening, played with parameters for the demo, and worked on particle collisions so that the soft body doesn't collapse or "explode." \
\
6/1: \
Jerry: Wrote Balloon class constructor and get methods. Wrote addParticle, addSpring, and default constructors to Softbody. Created static atmPressure variable in Stage. Updated UML. \
Maxwell: Started work on the RigidBody class. \
\
6/3: \
Jerry: Wrote getPerimeter, getCenter, updateArea, updatePressure, updateCenter, and applyAirPressure methods for Balloon. Still needs debugging for applyAirPressure and updateCenter, but rest are tested. Also updated UML diagram slightly to fit new structure and add new methods. \
Maxwell: Implemented a bounding box for rigid body collision and an orientation method in the point class to make the complete collision method easier, also tried to debug the Balloon class and made some progress but didn't make it fully convincing. Also, first used a custom sort to make particle collisions look more appealing but realized that there was an easier way and replaced it with that implementation instead. \
\
6/4: \
Jerry: Simulated dragging for soft body and rigid body. Still need to implement checks to prevent dragging from causing soft bodies to explode + rigid bodies from going below the ground. \
Maxwell: implemented the RigidBody collide function (which included: finishing the RigidBody inside function, writing a bounce function for Point, writing the setCor and setVel methods for Particles, and altering the orientation method to have more leeway for the case where three points are collinear) \
\
6/6: \
Maxwell: implemented the convex hull algorithm and use it to determine when the mouse is dragging the soft body. \
Jerry: N/A \
\
6/7: \
Jerry: Updated UML diagram. Read up on how to implement/simulate pressure within the balloon class to be prepared for tomorrow. \
Maxwell: N/A \
\
6/8: \
Maxwell: Made a Display class to house methods for each demo and started working on the user interface. Also played with the order of softbody physics calculations to fix minor issue where particles got stuck on the edge of a rigidbody. \
Jerry: Fixed balloon applyAirPressure by changing method of calculation to use normal forces to the springs. Also created addMols method which can be used to inflate the balloon. \
\
6/9: \
Jerry: Worked on rewriting collide for rigid bodies such that it uses radius instead of center of particle. Removed extraneous code. Created changeMass method. Updated UML and outline. \
Maxwell: Helped debug the new collide method for rigidbody and rewrote some of the code to look nicer. \
\
6/10: \ 
Jerry: Created home page and added preliminary simulations for demo (rewrote structure of Display). Wrote method to allow for particles in different soft bodies to collide with each other. Cleaned up documentation + UML diagrams. 

