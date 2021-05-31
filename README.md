# APCSFinalProject

Google Doc: https://docs.google.com/document/d/1TAdbzErmyPTm-VrRlXJPJDjRmklgNQ92MiTY7oRVVT0/edit?usp=sharing \
\
UML Diagram: https://online.visual-paradigm.com/share.jsp?id=313432333837322d31 \
\
Group Name: Springing into Action\
\
Group Members: Jerry Liang, Maxwell Zen\
\
Brief Project Description:  2D soft body simulation composed of many particles connected by springs. We'd implement spring physics and rigid body collision, and let the user change parameters like spring strength, gravity, particle density, and friction. Also, if we have time, we could repurpose the same mechanics to simulate other interesting things. \
\
Compile/Run Instructions:\
\
LOREM IPSUM\
\
Development Log:\
\
5/25:\
\
Jerry: Worked on the Particle class; wrote all of the constructors, get methods, and update methods (applyForce and updatePosition). Reached solution with Maxwell about how to create a standard time measure (we decided on creating a new class called Stage which has a public static void time variable). \
\
Maxwell: Worked on the Spring class, including the constructors, get methods, and the updateForce method which implements Hooke's Law to calculate the force on each particle. \
\
5/26: \
\
Maxwell: Created the Stage class and filled in the static variables and methods. Also refined the rectangular constructor, fixed a Spring.updateForce() bug, and changed the test case to demonstrate motion of the soft body. \
\
Jerry: Wrote and tested display method for Particle, Spring, and SoftBody classes. Wrote rectangular constructor for SoftBody class and also fixed error with static class with Maxwell. Outside of coding, also updated UML diagram to fit current structure.\
\
5/27:\
\
Jerry: Simulate gravity in SoftBody and added static variable g (for gravity) in Stage. Preliminary simulations of particles bouncing off floor (wrote bounceFloor() method). Outside of coding, updated UML diagram to fit revised structure. \
\
Maxwell: Created the Point class, changed the Particle class to use the Point class to represent position and velocity, and wrote methods for the Point class that will be useful for future calculations (such as spring dampening and particle collision, which we are going to implement soon). \
\
5/29: \
\
Maxwell: Made minor changes, including: dist, distsq, and reflect functions for Point, editing display radius and floor collisions for Particle, and fixing gravity calculation in SoftBody. \
\
Jerry: N/A \
\
5/30: \
\
Jerry: Wrote methods to simulate perfectly elastic collisions between particles. Also factored in air friction for particles. Tested collisions and effects of air friction. Updated UML diagram.
