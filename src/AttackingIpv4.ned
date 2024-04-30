//
// This program is free software: you can redistribute it and/or modify
// it under the terms of the GNU Lesser General Public License as published by
// the Free Software Foundation, either version 3 of the License, or
// (at your option) any later version.
// 
// This program is distributed in the hope that it will be useful,
// but WITHOUT ANY WARRANTY; without even the implied warranty of
// MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
// GNU Lesser General Public License for more details.
// 
// You should have received a copy of the GNU Lesser General Public License
// along with this program.  If not, see http://www.gnu.org/licenses/.
//
package vanetattackpackage;

import inet.networklayer.ipv4.Ipv4;
simple AttackingIpv4 extends Ipv4
{
    parameters:
        @class(inet::AttackingIpv4); //Use AttackingIpv4 class defined in AttackingIpv4.h and AttackingIpv4.cc
        //Parameters for attacking behaviours
        bool attacking = default(false); //Determines whether host can use attacking behaviour
        string attackString = default("None"); //Determines which attack to use
        double attackStartTime = default(0); //Determines at what time in milliseconds to begin an attack
        bool ignoreTransportLayer = default(true); //Determines whether hosts ignore packets inbound from the transportOut gate in blackhole and greyhole attacks
        int greyHoleDropChance = default(60); //Percentage chance for a packet to be dropped in a grey hole attack
        int DoSPackets = default(5); //Number of packets to send in a DoS attack
        double DoSTime = default(5000);
        bool impersonating = default(false); //Determines whether host is impersonating another host
        int impersonatingIPFragOne = default(0); //First part of IP address for impersonation
        int impersonatingIPFragTwo = default(0); //Second part of IP address for impersonation
        int impersonatingIPFragThree = default(0); //Third part of IP address for impersonation
        int impersonatingIPFragFour = default(0); //Fourth part of IP address for impersonation
        bool sybil = default(false); //Determines whether a sybil attack will be used
        int sybilIdentities = default(1); //Number of identities to use in sybil
        int delayTime = default(0); //Determines delay time in seconds
        int wormholeIPFragOne = default(0); //First part of IP address for wormhole target
        int wormholeIPFragTwo = default(0); //Second part of IP address for wormhole target
        int wormholeIPFragThree = default(0); //Third part of IP address for wormhole target
        int wormholeIPFragFour = default(0); //Fourth part of IP address for wormhole target
        
        
        //Signals used for evlauating packet behaviours
        @signal[messageDropped](type=cPacket); //Signal for when a message is dropped due to attack
        @statistic[attackerPacketDropped](title="packets dropped while attacking"; source=messageDropped; record=vector(packetBytes),count,sum(packetBytes);interpolationmode=none);
        @signal[messageReceived](type=cPacket);
        @statistic[totalPacketsReceieved](title="packets received from network"; source=messageReceived; record=vector(packetBytes),count,sum(packetBytes);interpolationmode=none);
        @signal[DoSPacketSent](type=cPacket);
        @statistic[DoSPacketsSent](title="packets sent using DoS"; source=DoSPacketSent; record=vector(packetBytes),count,sum(packetBytes);interpolationmode=none);
        
}