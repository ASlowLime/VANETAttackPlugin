INSTALLATION AND SETUP
Once you have installed the plugin, there are a few things that need to be done in order for it to be usable. Firstly, you will need to have both INET and Veins installed in your project workspace. The recommended versions are 4.2.2 and 5.2 respectively, assuming you are using OMNeT++ version 5.6.2. Next you need to right click on the VANETAttackPackage and go to properties. In project references, tick the boxes next to INET and Veins. You will also need to set your project to use the newer compiler versions in OMNeT++ if you are on Windows. Next, move the files AttackingIpv4.cc and AttackingIpv4.h from the VANETAttackPackage src folder into the inet/src/inet/networklayer/ipv4 directory. With this done, you can begin building INET, Veins, and the attack package.
With all of the required plugins built, you next need to go to the properties of your own project folder, and mark VANETAttackProject as a reference in the project references tab along with INET and Veins.

USAGE
With the setup complete, you can now begin to use the attacks in your own simulations. This plugin has been developed to work with SUMO simulations, so make sure to start a locally hosted SUMO server in the command line that you launched OMNeT++ from. The plugin comes bundled with a simulation that allows you to easily change attack parameters and see how each attack works. Multiple premade configurations have been created, allowing you to simply pick one and watch the attack in action. When creating your own simulations, be sure to change the module type field to “vanetattackpackage.veins_inet.VeinsInetAttackingCar”. This allows your nodes to access attack behaviours.
The attacks have many parameters that can be adjusted to change their behaviours. These can be found in the AttackingIpv4.ned file.
 
The attackString parameter can be set to “blackHole”, “greyHole”, “DoS”, “delay”, and “wormhole”. These are case sensitive. 

