# -*-	Mode:tcl; tcl-indent-level:8; tab-width:8; indent-tabs-mode:t -*-
#
# Time-stamp: <2000-09-13 13:48:04 haoboy>
#
# Copyright (c) 1996-1997 Regents of the University of California.
# All rights reserved.
# 
# Redistribution and use in source and binary forms, with or without
# modification, are permitted provided that the following conditions
# are met:
# 1. Redistributions of source code must retain the above copyright
#    notice, this list of conditions and the following disclaimer.
# 2. Redistributions in binary form must reproduce the above copyright
#    notice, this list of conditions and the following disclaimer in the
#    documentation and/or other materials provided with the distribution.
# 3. All advertising materials mentioning features or use of this software
#    must display the following acknowledgement:
# 	This product includes software developed by the MASH Research
# 	Group at the University of California Berkeley.
# 4. Neither the name of the University nor of the Research Group may be
#    used to endorse or promote products derived from this software without
#    specific prior written permission.
# 

# @(#) $Header: /var/lib/cvs/ns-2.29/tcl/lib/ns-default.tcl,v 1.2 2006/03/30 20:51:30 haolangx Exp $

# THIS SOFTWARE IS PROVIDED BY THE REGENTS AND CONTRIBUTORS ``AS IS'' AND
# ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE
# IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE
# ARE DISCLAIMED.  IN NO EVENT SHALL THE REGENTS OR CONTRIBUTORS BE LIABLE
# FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL
# DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS
# OR SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION)
# HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT
# LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY
# OUT OF THE USE OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF
# SUCH DAMAGE.
#
#
#
# Set up all the default paramters.  Each default parameter
# is stored in the OTcl class template and copied from the
# class into the instance when the object is created
# (this happens in the Tcl/tcl-object.tcl helper library)
#

########################################################

# Debojyoti added this
Simulator set useasim_ 1
Asim set debug_ false

set MAXSEQ 1073741824
# Increased Floating Point Precision
set tcl_precision 17

Connector set debug_ false
TTLChecker set debug_ false

Trace set src_ -1
Trace set dst_ -1
Trace set callback_ 0
Trace set show_tcphdr_ 0
Trace set show_sctphdr_ 0
Trace set debug_ false


CMUTrace set debug_ false
CMUTrace set show_sctphdr_ 0
CMUTrace set radius_scaling_factor_ 1.0
CMUTrace set duration_scaling_factor_ 3.0e4

Scheduler/RealTime set maxslop_ 0.010; # max allowed slop b4 error (sec)

#
# Queues and associated
#
Integrator set lastx_ 0.0
Integrator set lasty_ 0.0
Integrator set sum_ 0.0

# 10->50 to be like ns-1
Queue set limit_ 50
Queue set blocked_ false
Queue set unblock_on_resume_ true

Queue set interleave_ false
Queue set acksfirst_ false
Queue set ackfromfront_ false
Queue set debug_ false

Queue/SFQ set maxqueue_ 40
Queue/SFQ set buckets_ 16

Queue/FQ set secsPerByte_ 0
# change DropTail to RED for RED on individual queues
FQLink set queueManagement_ DropTail

Queue/DropTail set drop_front_ true
Queue/DropTail set summarystats_ false
Queue/DropTail set queue_in_bytes_ false
Queue/DropTail set mean_pktsize_ 500

Queue/DropTail/PriQueue set Prefer_Routing_Protocols    1

# special cmu implemented priority queue used by DSR
CMUPriQueue set qlen_logthresh_ 10
CMUPriQueue set fw_logthresh_ 25
CMUPriQueue set debug_ false

#notel's diffserv module
Queue/dsRED set numQueues_ 4
Queue/dsRED set ecn_ 0

Queue/XCP set spread_bytes_ 0

# XXX Temporary fix XXX
# support only xcp flows; set to 1 when supporting both tcp and xcp flows; temporary fix for allocating link BW between xcp and tcp queues until dynamic queue weights come into effect. This fix should then go away
Queue/XCP set tcp_xcp_on_ 0  ;

Queue/RED set bytes_ true ;		# default changed on 10/11/2004.
Queue/RED set queue_in_bytes_ true ;	# default changed on 10/11/2004.
# Queue/RED set thresh_ 5
Queue/RED set thresh_ 0
# Queue/RED/thresh_ was changed on 12/29/01, for automatic configuration.
# Queue/RED set maxthresh_ 15
Queue/RED set maxthresh_ 0
# Queue/RED/maxthresh_ was changed on 12/29/01, for automatic configuration.
Queue/RED set thresh_queue_ [Queue set limit_]
Queue/RED set minthresh_queue_ [Queue set limit_]
Queue/RED set mean_pktsize_ 500
Queue/RED set idle_pktsize_ 100
# Queue/RED set q_weight_ 0.002
Queue/RED set q_weight_ -1
# Queue/RED/q_weight_ was changed on 12/29/01, for automatic configuration.
Queue/RED set wait_ true
Queue/RED set linterm_ 10
Queue/RED set mark_p_ 0.1
Queue/RED set setbit_ false
Queue/RED set gentle_ true
### Queue/RED/gentle_ was changed from false to true on Apr 23, 2001.
Queue/RED set drop_tail_ true
Queue/RED set drop_front_ false
Queue/RED set drop_rand_ false
Queue/RED set doubleq_ false
Queue/RED set ns1_compat_ false
Queue/RED set dqthresh_ 50
Queue/RED set ave_ 0.0
Queue/RED set prob1_ 0.0
Queue/RED set curq_ 0
Queue/RED set cur_max_p_ 0
Queue/RED set summarystats_ false
### Adaptive RED.
Queue/RED set alpha_ 0.01
Queue/RED set beta_ 0.9 
Queue/RED set adaptive_ 0
Queue/RED set interval_ 0.5
Queue/RED set targetdelay_ 0.005
Queue/RED set top_ 0.5
Queue/RED set bottom_ 0
### Queue/RED/bottom_ was changed from 0.01 to 0 on June 23, 2004,
###   for automatic configuration.
Queue/RED set cautious_ 0
Queue/RED set feng_adaptive_ 0

Queue/RED/RIO set bytes_ false
Queue/RED/RIO set queue_in_bytes_ false
Queue/RED/RIO set thresh_ 5
Queue/RED/RIO set maxthresh_ 15
Queue/RED/RIO set in_thresh_ 15
Queue/RED/RIO set in_maxthresh_ 30
Queue/RED/RIO set out_thresh_ 5
Queue/RED/RIO set out_maxthresh_ 15
Queue/RED/RIO set mean_pktsize_ 500
Queue/RED/RIO set q_weight_ 0.002
Queue/RED/RIO set wait_ true
Queue/RED/RIO set linterm_ 10
Queue/RED/RIO set in_linterm_ 50
Queue/RED/RIO set out_linterm_ 5
Queue/RED/RIO set setbit_ false
Queue/RED/RIO set gentle_ false
Queue/RED/RIO set in_gentle_ false
Queue/RED/RIO set out_gentle_ false
Queue/RED/RIO set drop_tail_ true
Queue/RED/RIO set drop_front_ false
Queue/RED/RIO set drop_rand_ false
Queue/RED/RIO set doubleq_ false
Queue/RED/RIO set ns1_compat_ false
Queue/RED/RIO set dqthresh_ 50
Queue/RED/RIO set ave_ 0.0
Queue/RED/RIO set in_ave_ 0.0
Queue/RED/RIO set out_ave_ 0.0
Queue/RED/RIO set prob1_ 0.0
Queue/RED/RIO set in_prob1_ 0.0
Queue/RED/RIO set out_prob1_ 0.0
Queue/RED/RIO set curq_ 0
Queue/RED/RIO set priority_method_ 0

#for RedPDQueue - ratul
Queue/RED/PD set auto_ false
Queue/RED/PD set global_target_ false
Queue/RED/PD set noMonitored_ 0
Queue/RED/PD set targetBW_ 0
Queue/RED/PD set unresponsive_penalty_ 1
Queue/RED/PD set P_testFRp_ -1
Queue/RED/PD set noidle_ false

Queue/PI set bytes_ false
Queue/PI set queue_in_bytes_ false
Queue/PI set a_ 0.00001822
Queue/PI set b_ 0.00001816
Queue/PI set w_ 170
Queue/PI set qref_ 50
Queue/PI set mean_pktsize_ 500
Queue/PI set setbit_ false
Queue/PI set prob_ 0
Queue/PI set curq_ 0

# Queue/Vq set queue_in_bytes_ false
Queue/Vq set queue_in_bytes_ true
# Default for queue_in_bytes_ changed to true on 4/28/2002.
Queue/Vq set markpkts_ false 
Queue/Vq set ecnlim_ 0.8
Queue/Vq set buflim_ 1.0 
# Queue/Vq set gamma_ 0.895
Queue/Vq set gamma_ 0.98
# Default for gamma_ changed to 0.98 on 4/28/2002.
Queue/Vq set mean_pktsize_ 1000
Queue/Vq set curq_ 0
Queue/Vq set drop_front_ 0
Queue/Vq set markfront_ 0

Queue/REM set gamma_ 0.001
Queue/REM set phi_ 1.001
Queue/REM set inw_ 1
Queue/REM set mean_pktsize_ 1000
Queue/REM set pupdtime_ 0.002
Queue/REM set pbo_ 20.0
Queue/REM set prob_ 0.0
Queue/REM set curq_ 0.0
Queue/REM set pmark_ 0.0
Queue/REM set markpkts_ false
Queue/REM set qib_ false

Queue/GK set ecnlim_ 0.95
Queue/GK set mean_pktsize_ 1000
Queue/GK set curq_ 0
Queue/GK set drop_front_ 0

Queue/DRR set buckets_ 10
Queue/DRR set blimit_ 25000
Queue/DRR set quantum_ 250
Queue/DRR set mask_ 0

# Integrated SRR (1/20/2002, xuanc)
Queue/SRR set maxqueuenumber_ 16
Queue/SRR set mtu_ 1000
Queue/SRR set granularity_ 1000
Queue/SRR set blimit_ 25000

Queue/CBQ set algorithm_ 0 ;# used by compat only, not bound
Queue/CBQ set maxpkt_ 1024
CBQClass set priority_ 0
CBQClass set level_ 1
CBQClass set extradelay_ 0.0
CBQClass set def_qtype_ DropTail
CBQClass set okborrow_ true
CBQClass set automaxidle_gain_ 0.9375
CBQClass set debug_ false

SnoopQueue/In set debug_ false
SnoopQueue/Out set debug_ false
SnoopQueue/Drop set debug_ false
SnoopQueue/EDrop set debug_ false
SnoopQueue/Tagger set debug_ false

PacketQueue/Semantic set acksfirst_ false
PacketQueue/Semantic set filteracks_ false
PacketQueue/Semantic set replace_head_ false
PacketQueue/Semantic set priority_drop_ false
PacketQueue/Semantic set random_drop_ false
PacketQueue/Semantic set reconsAcks_ false
PacketQueue/Semantic set random_ecn_ false

QueueMonitor set size_ 0
QueueMonitor set pkts_ 0
QueueMonitor set parrivals_ 0
QueueMonitor set barrivals_ 0
QueueMonitor set pdepartures_ 0
QueueMonitor set bdepartures_ 0
QueueMonitor set pdrops_ 0
QueueMonitor set pmarks_ 0
QueueMonitor set bdrops_ 0

QueueMonitor set qs_pkts_ 0
QueueMonitor set qs_bytes_ 0
QueueMonitor set qs_drops_ 0

QueueMonitor set first_pkt_ 0
QueueMonitor set last_pkt_ 0

#added for keeping RTT stats
QueueMonitor set keepRTTstats_ 0
QueueMonitor set maxRTT_ 5
QueueMonitor set binsPerSec_ 100

#added for keeping Seqno stats
QueueMonitor set keepSeqnoStats_ 0
QueueMonitor set maxSeqno_ 1000
QueueMonitor set SeqnoBinSize_ 10

#added for online rate monitoring - ratul
QueueMonitor set k_ 0.1
QueueMonitor set prevTime_ 0
QueueMonitor set startTime_ 0
QueueMonitor set estRate_ 0
QueueMonitor set estimate_rate_ 0

QueueMonitor/ED set epdrops_ 0
QueueMonitor/ED set ebdrops_ 0

#mon stuff added for RedPD and Pushback - ratul
QueueMonitor/ED set mon_epdrops_ 0                     
QueueMonitor/ED set mon_ebdrops_ 0

QueueMonitor/ED/Flowmon set enable_in_ true
QueueMonitor/ED/Flowmon set enable_out_ true
QueueMonitor/ED/Flowmon set enable_drop_ true
QueueMonitor/ED/Flowmon set enable_edrop_ true
QueueMonitor/ED/Flowmon set enable_mon_edrop_ true

QueueMonitor/ED/Flow set src_ -1
QueueMonitor/ED/Flow set dst_ -1
QueueMonitor/ED/Flow set flowid_ -1

QueueMonitor/ED/Flow/TB set target_rate_ 128000 
QueueMonitor/ED/Flow/TB set bucket_depth_ 10000
QueueMonitor/ED/Flow/TB set tbucket_ 10000
QueueMonitor/ED/Flow/TSW set target_rate_ 0
QueueMonitor/ED/Flow/TSW set win_len_ 10
QueueMonitor/ED/Flow/TSW set wait_ true

#RedPDFlow  - ratul
QueueMonitor/ED/Flow/RedPD set targetBW_ 0
QueueMonitor/ED/Flow/RedPD set currentBW_ 0
QueueMonitor/ED/Flow/RedPD set monitored_ 0
QueueMonitor/ED/Flow/RedPD set unresponsive_ 0
QueueMonitor/ED/Flow/RedPD set monitorStartTime_ 0
QueueMonitor/ED/Flow/RedPD set unresponsiveStartTime_ 0
QueueMonitor/ED/Flow/RedPD set lastDropTime_ 0 
QueueMonitor/ED/Flow/RedPD set auto_ 0 

DelayLink set bandwidth_ 1.5Mb
DelayLink set delay_ 100ms
DelayLink set debug_ false
DelayLink set avoidReordering_ false ;	# Added 3/27/2003.
					# Set to true to avoid reordering when
					#   changing link bandwidth or delay.
DynamicLink set status_ 1
DynamicLink set debug_ false

Filter set debug_ false
Filter/Field set offset_ 0
Filter/Field set match_  -1



# these are assigned when created
Classifier set offset_ 0
Classifier set shift_ 0
Classifier set mask_ 0xffffffff
Classifier set debug_ false

Classifier/Hash set default_ -1; # none
Classifier/Replicator set ignore_ 0

# MPLS Classifier
Classifier/Addr/MPLS set ttl_   32
Classifier/Addr/MPLS set trace_mpls_ 0
Classifier/Addr/MPLS set label_ -1
Classifier/Addr/MPLS set enable_reroute_    0
Classifier/Addr/MPLS set reroute_option_ 0
Classifier/Addr/MPLS set control_driven_ 0
Classifier/Addr/MPLS set data_driven_ 0

#
# FEC models
#

FECModel set debug_ false

#
# Error models
#

ErrorModule set debug_ false

ErrorModel set enable_ 1
ErrorModel set markecn_ false
ErrorModel set delay_pkt_ false
ErrorModel set delay_ 0
ErrorModel set rate_ 0
ErrorModel set bandwidth_ 2Mb
ErrorModel set debug_ false

ErrorModel/Trace set good_ 123456789
ErrorModel/Trace set loss_ 0
ErrorModel/Periodic set period_ 1.0
ErrorModel/Periodic set offset_ 0.0
ErrorModel/Periodic set burstlen_ 0.0
ErrorModel/Periodic set default_drop_ 0 ;	# set to 1 for default-drop,
						# to drop all but last pkt
						# in period_
ErrorModel/MultiState set curperiod_ 0.0
ErrorModel/MultiState set sttype_ pkt
ErrorModel/MultiState set texpired_ 0

SelectErrorModel set enable_ 1
SelectErrorModel set markecn_ false
SelectErrorModel set rate_ 0
SelectErrorModel set bandwidth_ 2Mb
SelectErrorModel set pkt_type_ 2
SelectErrorModel set drop_cycle_ 10
SelectErrorModel set drop_offset_ 1
SelectErrorModel set debug_ false
SelectErrorModel set delay_pkt_ false
SelectErrorModel set delay_ 0
SRMErrorModel set enable_ 1
SRMErrorModel set markecn_ false
SRMErrorModel set rate_ 0
SRMErrorModel set bandwidth_ 2Mb
SRMErrorModel set pkt_type_ 2
SRMErrorModel set drop_cycle_ 10
SRMErrorModel set drop_offset_ 1
SRMErrorModel set debug_ false
SRMErrorModel set delay_pkt_ false
SRMErrorModel set delay_ 0
#MrouteErrorModel set enable_ 1
#MrouteErrorModel set rate_ 0
#MrouteErrorModel set bandwidth_ 2Mb
#MrouteErrorModel set pkt_type_ 2
#MrouteErrorModel set drop_cycle_ 10
#MrouteErrorModel set drop_offset_ 1
#MrouteErrorModel set good_ 99999999
#MrouteErrorModel set loss_ 0

rtModel set startTime_ 0.5
rtModel set finishTime_ "-"
rtModel/Exponential set upInterval_   10.0
rtModel/Exponential set downInterval_  1.0
rtModel/Deterministic set upInterval_   2.0
rtModel/Deterministic set downInterval_ 1.0

#
# Application
#

Application/Traffic/CBR_PP set rate_ 448Kb ;# corresponds to interval of 3.75ms
Application/Traffic/CBR_PP set packetSize_ 210
Application/Traffic/CBR_PP set random_ 0
Application/Traffic/CBR_PP set maxpkts_ 268435456; # 0x10000000
Application/Traffic/CBR_PP set PBM_ 2

Application/Traffic/Exponential set burst_time_ .5
Application/Traffic/Exponential set idle_time_ .5
Application/Traffic/Exponential set rate_ 64Kb
Application/Traffic/Exponential set packetSize_ 210

Application/Traffic/Pareto set burst_time_ 500ms
Application/Traffic/Pareto set idle_time_ 500ms
Application/Traffic/Pareto set rate_ 64Kb
Application/Traffic/Pareto set packetSize_ 210
Application/Traffic/Pareto set shape_ 1.5

Application/Traffic/Coot set burst_time_ 500ms
Application/Traffic/Coot set idle_time_ 500ms
Application/Traffic/Coot set rate_ 64Kb
Application/Traffic/Coot set packetSize_ 210
Application/Traffic/Coot set shape_ 1.5

Application/Traffic/RealAudio set burst_time_ 0.05ms
Application/Traffic/RealAudio set idle_time_ 1800ms
Application/Traffic/RealAudio set rate_ 2Kb
Application/Traffic/RealAudio set packetSize_ 240
Application/Traffic/RealAudio set minCDF_ 0
Application/Traffic/RealAudio set maxCDF_ 1
Application/Traffic/RealAudio set interpolation_ 0
Application/Traffic/RealAudio set maxEntry_ 32

Application/Traffic/CBR set rate_ 448Kb	;# corresponds to interval of 3.75ms
Application/Traffic/CBR set packetSize_ 210
Application/Traffic/CBR set random_ 0
Application/Traffic/CBR set maxpkts_ 268435456; # 0x10000000

Application/Telnet set interval_ 1.0

# Default config based on data for slammer worm
Application/Worm set ScanRate 4000
Application/Worm set ScanPort 1434
Application/Worm set ScanPacketSize 404
Application/Worm/An set TimeStep 1

Application/SctpApp1 set interval_ 1.0
Application/SctpApp1 set numStreams_ 1
Application/SctpApp1 set numUnreliable_ 0
Application/SctpApp1 set reliability_ 0

RandomVariable/Uniform set min_ 0.0
RandomVariable/Uniform set max_ 1.0
RandomVariable/Exponential set avg_ 1.0
RandomVariable/Pareto set avg_ 1.0
RandomVariable/Pareto set shape_ 1.5
RandomVariable/ParetoII set avg_ 10.0
RandomVariable/ParetoII set shape_ 1.2
RandomVariable/Constant set val_ 1.0
RandomVariable/HyperExponential set avg_ 1.0
RandomVariable/HyperExponential set cov_ 4.0
RandomVariable/Empirical set minCDF_ 0
RandomVariable/Empirical set maxCDF_ 1
RandomVariable/Empirical set interpolation_ 0
RandomVariable/Empirical set maxEntry_ 32
RandomVariable/Normal set avg_ 0.0
RandomVariable/Normal set std_ 1.0
RandomVariable/LogNormal set avg_ 1.0
RandomVariable/LogNormal set std_ 1.0

ADC/MS set debug_ false
ADC/HB set debug_ false
ADC/Param set debug_ false
ADC/ACTP set debug_ false
ADC/ACTO set debug_ false

Est/Null set debug_ false
Est/TimeWindow set debug_ false
Est/ExpAvg set debug_ false
Est/PointSample set debug_ false

MeasureMod set debug_ false
SALink set debug_ false

#
# Node
#

Node set multiPath_ 0
Node set rtagent_port_ 255

# setting port for diffusion application agent
Node set DIFFUSION_APP_PORT 254

Node/MobileNode set X_				0
Node/MobileNode set Y_				0
Node/MobileNode set Z_				0
Node/MobileNode set speed_				0
Node/MobileNode set position_update_interval_	0
Node/MobileNode set bandwidth_			0	;# not used
Node/MobileNode set delay_				0	;# not used
Node/MobileNode set REGAGENT_PORT 0
Node/MobileNode set DECAP_PORT 1


# Default settings for Hierarchical topology
#
# Bits are allocated for different fields like port, nodeid, mcast, 
# hierarchical-levels. 
# All Mask and Shift values are stored in Class AddrParams.
AddrParams set ALL_BITS_SET 0xffffffff
AddrParams PortShift 0
AddrParams PortMask [AddrParams set ALL_BITS_SET]
AddrParams set domain_num_ 1
AddrParams set def_clusters 4
AddrParams set def_nodes 5

####  Default and Maximum Address space - leaving the MSB as signed bit
AllocAddrBits set DEFADDRSIZE_ 32
AllocAddrBits set MAXADDRSIZE_ 32                ;# leaving the signed bit

Simulator set node_factory_ Node
Simulator set nsv1flag 0
Simulator set mobile_ip_ 0			 ;# flag for mobileIP

#this was commented out - ratul
#Simulator set EnableHierRt_ 0   ;# is hierarchical routing on?  (to turn it on, call set-hieraddress)

Simulator set routingAgent_ ""
Simulator set addressType_   ""
Simulator set MovementTrace_ OFF

# change wrt Mike's code
Simulator set EotTrace_ OFF


# This flag should be initially empty. It will be set to either ON or OFF
# by Simulator::create-wireless-node{}. 
Simulator set IMEPFlag_ ""
Simulator set WirelessNewTrace_ 0
Simulator set propInstCreated_ 0

# Enable packet reference count
SessionSim set rc_ 0

# Defaults for multicast addresses
Simulator set McastBaseAddr_ 0x80000000
Simulator set McastAddr_ 0x80000000

# Default values used for wireless simulations
Simulator set AgentTrace_ ON
Simulator set RouterTrace_ OFF
Simulator set MacTrace_   OFF

# use tagged traces or positional traces?
Simulator set TaggedTrace_ OFF

SessionHelper set rc_ 0                      ;# just to eliminate warnings
SessionHelper set debug_ false

NetworkInterface set debug_ false

# SRM Agent defaults are in ../tcl/mcast/srm.tcl and ../mcast/srm-adaptive.tcl

# IntServ Object specific defaults are in ../tcl/lib/ns-intserv.tcl

# defaults for tbf
TBF set rate_ 64k
TBF set bucket_ 1024
TBF set qlen_ 0

#
# mobile Ip
#
MIPEncapsulator set addr_ 0
MIPEncapsulator set port_ 0
MIPEncapsulator set shift_ 0
MIPEncapsulator set mask_ [AddrParams set ALL_BITS_SET]
MIPEncapsulator set ttl_ 32
MIPEncapsulator set debug_ false

# GAF
 
GAFPartner set addr_ 0
GAFPartner set port_ 254
GAFPartner set shift_ 0
GAFPartner set mask_ [AddrParams set ALL_BITS_SET]
GAFPartner set debug_ false                  
 
# HTTP-related defaults are in ../tcl/webcache/http-agent.tcl

#
# Wireless simulation support 
#

Mac set debug_ false
ARPTable set debug_ false
ARPTable set avoidReordering_ false ; #not used
God set debug_ false

Mac/Tdma set slot_packet_len_	1500
Mac/Tdma set max_node_num_	64

LL set mindelay_                50us
LL set delay_                   25us
LL set bandwidth_               0       ;# not used
LL set debug_ false
LL set avoidReordering_ false ;	#not used 

# UMTS starts
UMTS/RLC/UM set avoidReordering_                      false
UMTS/RLC/UM set payload_                              40
UMTS/RLC/UM set bandwidth_                            0
UMTS/RLC/UM set debug_                                false
UMTS/RLC/UM set macDA_                                -1
UMTS/RLC/UM set win_                                  1024
UMTS/RLC/UM set temp_pdu_timeout_time_                10ms
UMTS/RLC/UM set buffer_level_max_                     500
UMTS/RLC/UM set TTI_                                  10ms
UMTS/RLC/UM set length_indicator_                     7
UMTS/RLC/UM set min_concat_data_                      3
UMTS/RLC/UM set delay_                                50us

UMTS/RLC/UMHS set avoidReordering_                      false
UMTS/RLC/UMHS set debug_                              false
UMTS/RLC/UMHS set macDA_                              -1
UMTS/RLC/UMHS set win_                                4095
UMTS/RLC/UMHS set temp_pdu_timeout_time_              2ms
UMTS/RLC/UMHS set credit_allocation_interval_         15
UMTS/RLC/UMHS set flow_max_                           20
UMTS/RLC/UMHS set priority_max_                       5
UMTS/RLC/UMHS set buffer_level_max_                   500
UMTS/RLC/UMHS set payload_                            40
UMTS/RLC/UMHS set TTI_                                2ms
UMTS/RLC/UMHS set length_indicator_                   7
UMTS/RLC/UMHS set min_concat_data_                    3
UMTS/RLC/UMHS set bandwidth_                          0
UMTS/RLC/UMHS set delay_                              50us

UMTS/RLC/AM set avoidReordering_                      false
UMTS/RLC/AM set ack_mode_                             2
UMTS/RLC/AM set win_                                  1024
UMTS/RLC/AM set maxRBSize_                            100kbytes
UMTS/RLC/AM set overhead_                             20us
UMTS/RLC/AM set payload_                              40
UMTS/RLC/AM set rtx_timeout_                          140ms
UMTS/RLC/AM set noFastRetrans_                        0
UMTS/RLC/AM set numdupacks_                           2
UMTS/RLC/AM set poll_PDU_                             256
UMTS/RLC/AM set poll_timeout_                         170ms
UMTS/RLC/AM set stprob_timeout_                       150ms
UMTS/RLC/AM set macDA_                                -1
UMTS/RLC/AM set debug_                                false
UMTS/RLC/AM set bandwidth_                            0
UMTS/RLC/AM set TTI_                                  10ms
UMTS/RLC/AM set length_indicator_                     7
UMTS/RLC/AM set ack_pdu_header_                       1
UMTS/RLC/AM set status_pdu_header_                    20
UMTS/RLC/AM set min_concat_data_                      3
UMTS/RLC/AM set max_status_delay_                     10ms
UMTS/RLC/AM set max_ack_delay_                        10ms
UMTS/RLC/AM set delay_                                50us

UMTS/RLC/AMHS set avoidReordering_                    false
UMTS/RLC/AMHS set debug_                              false
UMTS/RLC/AMHS set win_                                4095
UMTS/RLC/AMHS set temp_pdu_timeout_time_              2ms
UMTS/RLC/AMHS set credit_allocation_interval_         15
UMTS/RLC/AMHS set flow_max_                           20
UMTS/RLC/AMHS set priority_max_                       5
UMTS/RLC/AMHS set buffer_level_max_                   500
UMTS/RLC/AMHS set TTI_                                2ms
UMTS/RLC/AMHS set payload_                            40
UMTS/RLC/AMHS set poll_PDU_                           256
UMTS/RLC/AMHS set poll_timeout_                       170ms
UMTS/RLC/AMHS set stprob_timeout_                     150ms
UMTS/RLC/AMHS set length_indicator_                   7
UMTS/RLC/AMHS set status_pdu_header_                  4
UMTS/RLC/AMHS set min_concat_data_                    3
UMTS/RLC/AMHS set macDA_                              -1
UMTS/RLC/AMHS set status_timeout_                     1ms
UMTS/RLC/AMHS set bandwidth_                          0
UMTS/RLC/AMHS set delay_                              50us

Phy/Umts set debug_                                   false

Mac/Umts set delay_                                   10us
Mac/Umts set TTI_                                     10ms
Mac/Umts set shared_delay_                            3ms
Mac/Umts set debug_                                   false

Phy/Hsdpa set debug_                                  false

Mac/Hsdpa set delay_                                  10us
Mac/Hsdpa set TTI_                                    2ms
Mac/Hsdpa set credit_allocation_interval_             15
Mac/Hsdpa set debug_                                  false
Mac/Hsdpa set credit_interval_                        15
Mac/Hsdpa set flow_control_rtt_                       30ms
Mac/Hsdpa set flow_max_                               20
Mac/Hsdpa set priority_max_                           5
Mac/Hsdpa set ack_process_delay_                      4ms
Mac/Hsdpa set stall_timer_delay_                      25ms
Mac/Hsdpa set scheduler_type_                         2
Mac/Hsdpa set max_mac_hs_buffer_level_                250
Mac/Hsdpa set mac_hs_headersize_                      21
Mac/Hsdpa set flow_control_mode_                      1
Mac/Hsdpa set nr_harq_rtx_                            3
Mac/Hsdpa set nr_harq_processes_                      6
Mac/Hsdpa set reord_buf_size_                         64
Mac/Hsdpa set alpha_                                  0.999

UmtsNetworkInterface set debug_                       false

Demuxer set debug_                                    false

Channel set delay_                                    5us

TrChMeasurer set THP_REPORT_INTERVAL_                 500ms
TrChMeasurer set DOWNSWITCH_THRESHOLD_                8kbps
TrChMeasurer set DOWNSWITCH_TIMER_THRESHOLD_          16kbps
TrChMeasurer set DL_RLC_BUF_UPSWITCH_THRESH_sRAB_     500bytes
TrChMeasurer set UL_RLC_BUF_UPSWITCH_THRESH_sRAB_     265bytes
TrChMeasurer set PENDING_TIME_AFTER_TRIGGER_          0.5s
TrChMeasurer set BUFF_CHECK_INTERVAL_                 10ms
TrChMeasurer set debug_                               false

ChannelSwitcher set DOWNSWITCH_TIMER_sRAB_            1s
ChannelSwitcher set noSwitching_                      true
ChannelSwitcher set debug_                            false

Queue/DummyDropTail set drop_front_                   0
Queue/DummyDropTail set summarystats_                 0
Queue/DummyDropTail set queue_in_bytes_               0
Queue/DummyDropTail set mean_pktsize_                 0
Queue/DummyDropTail set drop_front_                   0

# UMTS ends


Snoop set debug_ false

#change wrt Mike's code
 # 802.11 MIB parameters
 #

 Mac/802_11 set CWMin_         31
 Mac/802_11 set CWMax_         1023
 Mac/802_11 set SlotTime_      0.000020        ;# 20us
 Mac/802_11 set SIFS_          0.000010        ;# 10us
 Mac/802_11 set PreambleLength_        144             ;# 144 bit
 Mac/802_11 set PLCPHeaderLength_      48              ;# 48 bits
 Mac/802_11 set PLCPDataRate_  1.0e6           ;# 1Mbps
 Mac/802_11 set RTSThreshold_  0               ;# bytes
 Mac/802_11 set ShortRetryLimit_       7               ;# retransmittions
 Mac/802_11 set LongRetryLimit_        4               ;# retransmissions



# 
# Support for Abstract LAN
#

Classifier/Replicator set direction_ false
Mac set abstract_ false

#
# Support for MAC Level trace
#
Mac/802_3 set trace_ false

# Turning on/off sleep-wakeup cycles for SMAC
Mac/SMAC set syncFlag_ 1
                                                                                                                
# Nodes synchronize their schedules in SMAC
Mac/SMAC set selfConfigFlag_ 1

# Default duty cycle in SMAC
Mac/SMAC set dutyCycle_ 10                                                                                                                
#
# Unity gain, omni-directional antennas
# Set up the antennas to be centered in the node and 1.5 meters above it
Antenna/OmniAntenna set X_ 0
Antenna/OmniAntenna set Y_ 0
Antenna/OmniAntenna set Z_ 1.5 
Antenna/OmniAntenna set Gt_ 1.0
Antenna/OmniAntenna set Gr_ 1.0

Phy set debug_ false

# Initialize the SharedMedia interface with parameters to make
# it work like the 914MHz Lucent WaveLAN DSSS radio interface
Phy/WirelessPhy set CPThresh_ 10.0
Phy/WirelessPhy set CSThresh_ 1.559e-11
Phy/WirelessPhy set RXThresh_ 3.652e-10
Phy/WirelessPhy set bandwidth_ 2e6
Phy/WirelessPhy set Pt_ 0.28183815
Phy/WirelessPhy set freq_ 914e+6
Phy/WirelessPhy set L_ 1.0  

Phy/WiredPhy set bandwidth_ 10e6

# Shadowing propagation model
Propagation/Shadowing set pathlossExp_ 2.0
Propagation/Shadowing set std_db_ 4.0
Propagation/Shadowing set dist0_ 1.0
Propagation/Shadowing set seed_ 0

# Turning on/off sleep-wakeup cycles for SMAC
Mac/SMAC set syncFlag_ 0



# variables of the link state module is moved to ns-rtProtoLS.tcl

#
# Agents
#
Agent set fid_ 0
Agent set prio_ 0
Agent set agent_addr_ -1
Agent set agent_port_ -1
Agent set dst_addr_ -1
Agent set dst_port_ -1
Agent set flags_ 0
Agent set ttl_ 32 ; # arbitrary choice here
Agent set debug_ false
Agent set class_ 0

##Agent set seqno_ 0 now is gone
##Agent set class_ 0 now is gone

Agent/Ping set packetSize_ 64

Agent/UDP set packetSize_ 1000
Agent/UDP instproc done {} { }
Agent/UDP instproc process_data {from data} { }

Agent/SCTP set debugMask_ 0             ;# all debugging off by default
Agent/SCTP set debugFileIndex_ -1       ;# default outputs to stderr
Agent/SCTP set associationMaxRetrans_ 10;# 10 attempts
Agent/SCTP set pathMaxRetrans_ 5        ;# 5 attempts (per destination)
Agent/SCTP set changePrimaryThresh_ -1  ;# infinite (ie, never change primary
Agent/SCTP set maxInitRetransmits_ 8    ;# 8 attempts
Agent/SCTP set oneHeartbeatTimer_ 1     ;# single heartbeat timer for all dests
Agent/SCTP set heartbeatInterval_ 30    ;# 30 secs
Agent/SCTP set mtu_ 1500                ;# MTU of ethernet (most common)
Agent/SCTP set initialRwnd_ 65536       ;# default inital receiver window
Agent/SCTP set initialSsthresh_ 65536   ;# default inital ssthresh value
Agent/SCTP set initialCwnd_ 2           ;# default cwnd = 2 * MTU
Agent/SCTP set initialRto_ 3.0          ;# default initial RTO = 3 secs       
Agent/SCTP set minRto_ 1.0              ;# default min RTO = 1 sec            
Agent/SCTP set maxRto_ 60.0             ;# default max RTO = 60 secs          
Agent/SCTP set fastRtxTrigger_ 4        ;# 4 missing reports trigger fast rtx
Agent/SCTP set numOutStreams_ 1         ;# single stream default
Agent/SCTP set numUnrelStreams_ 0       ;# by default all streams are reliable
Agent/SCTP set reliability_ 0           ;# by default unrel streams have 0 rtx's
Agent/SCTP set unordered_ 0             ;# by default all chunks are ordered
Agent/SCTP set ipHeaderSize_ 20         ;# default is IPv4
Agent/SCTP set dataChunkSize_ 1468      ;# restricted to 4 byte boundaries
Agent/SCTP set useDelayedSacks_ 1       ;# rfc2960 says SHOULD use delayed sacks
Agent/SCTP set sackDelay_ 0.200         ;# rfc2960 recommends 200 ms
Agent/SCTP set useMaxBurst_ 1           ;# sctp implementors guide adds this var
Agent/SCTP set rtxToAlt_ 1              ;# by default rtxs go to alternate dest
Agent/SCTP set dormantAction_ 0		;# 0 = change dest, 1 = use primary, 2 = use last dest before dormant;
                                                                             
## These variables are for simulating reactive routing overheads (for         
## MANETs, etc). This feature is turned off is delay is 0. The cache lifetime 
## by default is just slightly larger than the default min RTO to avoid a "cache                                                                             
## miss" after a single timeout event.
Agent/SCTP set routeCalcDelay_ 0        ;# time to calculate a route          
Agent/SCTP set routeCacheLifetime_ 1.2  ;# how long a route remains cached  

Agent/SCTP set trace_all_ 0             ;# trace all vars ?

## These variables are set because they have to be bound to be traceable.
## This default does not matter to us at all.
Agent/SCTP set cwnd_ 0                 ; 
Agent/SCTP set rto_ 0                  ;
Agent/SCTP set errorCount_ 0           ;
Agent/SCTP set frCount_ 0              ;                                      
Agent/SCTP set timeoutCount_ 0         ;                                      
Agent/SCTP set rcdCount_ 0             ;# total count of route calc delays    

Agent/SCTP/MultipleFastRtx set mfrCount_ 0                                    
Agent/SCTP/MfrTimestamp set mfrCount_ 0    


Agent/TCP set seqno_ 0
Agent/TCP set t_seqno_ 0
Agent/TCP set maxburst_ 0
Agent/TCP set aggressive_maxburst_ 1 ;  # Added 2003/6/2.
					# No change to default behavior.
Agent/TCP set maxcwnd_ 0
Agent/TCP set numdupacks_ 3
Agent/TCP set numdupacksFrac_ 100 ;	# Added 2002/10/18.
					# Set to 100000 for this to have
					# no effect even for large windows.
Agent/TCP set exitFastRetrans_ true ;	# Added 2003/7/28.
					# For clean exits of Fast Retransmit.
					# False for old buggy behavior.
Agent/TCP set window_ 20
# Agent/TCP set windowInit_ 1
Agent/TCP set windowInit_ 2 ;		# default changed on 2001/5/26.
Agent/TCP set windowInitOption_ 1
# Agent/TCP set syn_ false
Agent/TCP set syn_ true ;		# default changed on 2001/5/17.
Agent/TCP set windowOption_ 1
Agent/TCP set windowConstant_ 4
Agent/TCP set windowThresh_ 0.002
Agent/TCP set decrease_num_ 0.5
Agent/TCP set increase_num_ 1.0
Agent/TCP set k_parameter_ 0.0 ;	# for binomial congestion control
Agent/TCP set l_parameter_ 1.0 ;  	# for binomial congestion control
Agent/TCP set overhead_ 0
Agent/TCP set ecn_ 0
Agent/TCP set old_ecn_ 0
Agent/TCP set packetSize_ 1000
Agent/TCP set tcpip_base_hdr_size_ 40
Agent/TCP set ts_option_size_ 10; 	# in bytes
Agent/TCP set bugFix_ true
Agent/TCP set bugFix_ack_ false ;       # Variable added on 2003/08/13
					# To allow some multiple Fast Retransmits
Agent/TCP set bugFix_ts_ false ;	# Variable added on 2003/08/13
					# To allow some multiple Fast Retransmits
Agent/TCP set lessCareful_ false ;	# for the Less Careful variant of
					# bugFix_, just for illustration.
Agent/TCP set timestamps_ false
Agent/TCP set ts_resetRTO_ false ;	# Added 2003/07/24.
					# Set to true to un-back-off RTO
					#   after any valid RTT measurement.
Agent/TCP set slow_start_restart_ true
Agent/TCP set restart_bugfix_ true
# Agent/TCP set tcpTick_ 0.1
Agent/TCP set tcpTick_ 0.01 ;		# default changed on 2002/03/07
					# to reflect a changing reality.
Agent/TCP set maxrto_ 100000
#Agent/TCP set minrto_ 0 ;		# Variable added on 2001/05/10
#Agent/TCP set minrto_ 1 ;              # Default set to 1 on 2001/05/14.
Agent/TCP set minrto_ 0.2 ;		# Default changed to 200ms on 
					#  2004/10/14, to match values
					#  used by many implementations.
					# Default set to 1 on 2001/05/14.
					# Set to "0" to give old behavior.
Agent/TCP set srtt_init_ 0
Agent/TCP set rttvar_init_ 12
Agent/TCP set rtxcur_init_ 6.0
Agent/TCP set T_SRTT_BITS 3
Agent/TCP set T_RTTVAR_BITS 2
Agent/TCP set rttvar_exp_ 2
Agent/TCP set timerfix_ true ; 		# Variable added on 2001/05/11
 					# Set to "false" to give the old 
					#  behavior. 
# Agent/TCP set rfc2988_ false ;	# Variable added on 2002/03/07.
Agent/TCP set rfc2988_ true ;		# Default set to "true" on 2002/03/07.
					# Set rfc2988_ "true" to give RFC2988-
					#  compliant behavior for timers.
Agent/TCP instproc done {} { }
Agent/TCP set noFastRetrans_ false
Agent/TCP set partial_ack_ false ;	# Variable added on 2002/12/28.
					# Set to "true" to ensure sending
					#  a packet on a partial ACK.
Agent/TCP set dupacks_ 0
Agent/TCP set ack_ 0
Agent/TCP set cwnd_ 0
Agent/TCP set awnd_ 0
Agent/TCP set ssthresh_ 0
Agent/TCP set rtt_ 0
Agent/TCP set srtt_ 0
Agent/TCP set rttvar_ 0
Agent/TCP set backoff_ 0
Agent/TCP set maxseq_ 0
# Agent/TCP set singledup_ 0
Agent/TCP set singledup_ 1 ;		# default changed on 2001/11/28.
Agent/TCP set LimTransmitFix_ false ;	# added on 2003/03/31.
#Agent/TCP set LimTransmitFix_ true 
Agent/TCP set precisionReduce_ false
Agent/TCP set oldCode_ false
Agent/TCP set useHeaders_ true ;	# default changed on 2001/11/28. 

# These are all variables for experimental high-speed TCP.
# Agent/TCP set low_window_ 31
Agent/TCP set low_window_ 38
# low_window_ was changed on 2002/8/12 from 31 to 38, for low_p_ of 0.001.
# This should be an undetectable change in performance.
Agent/TCP set high_window_ 83000
Agent/TCP set high_p_ 0.0000001
Agent/TCP set high_decrease_ 0.1
Agent/TCP set max_ssthresh_ 0
Agent/TCP set cwnd_range_ 0 ;		# cwnd_frac_ deleted on 6/6/04,
					# replaced by cwnd_range_

# For Quick-Start:
Agent/TCP set rate_request_ 0
Agent/TCP set qs_enabled_ false
Agent/TCP set tcp_qs_recovery_ true ;	# Added on 2004/09/21, by Pasi.
Agent/TCP set qs_request_mode_ 1
Agent/TCP set qs_rtt_ 50
Agent/TCP set qs_thresh_ 4

# These are all variables for tracing information.
Agent/TCP set ndatapack_ 0
Agent/TCP set ndatabytes_ 0
Agent/TCP set nackpack_ 0
Agent/TCP set nrexmit_ 0
Agent/TCP set nrexmitpack_ 0
Agent/TCP set nrexmitbytes_ 0
Agent/TCP set necnresponses_ 0
Agent/TCP set ncwndcuts_ 0 
Agent/TCP set ncwndcuts1_ 0

Agent/TCP set trace_all_oneline_ false

Agent/TCP set QOption_ 0 
Agent/TCP set EnblRTTCtr_ 0
Agent/TCP set control_increase_ 0

Agent/TCP set SetCWRonRetransmit_ false ; # added on 2005/06/19.

# XXX Generate nam trace or plain old text trace for variables. 
# When it's true, generate nam trace.
Agent/TCP set nam_tracevar_ false

Agent/TCP/Fack set ss-div4_ false
Agent/TCP/Fack set rampdown_ false

Agent/TCP/Reno/XCP set timestamps_ true
Agent/TCP/Reno/XCP set xcp_sparse_ false
Agent/TCP/Reno/XCP set tcpTick_	0.01

Agent/TCP set eln_ 0
Agent/TCP set eln_rxmit_thresh_ 1
# Agent/TCP set delay_growth_ false
Agent/TCP set delay_growth_ true ;	# default changed on 2001/5/17.

Agent/TCP set CoarseTimer_      0

Agent/TCP set frto_enabled_	0 ;	# Added on 2004/10/26 for F-RTO
Agent/TCP set sfrto_enabled_	0 ;	# Added on 2004/10/26 for F-RTO
Agent/TCP set spurious_response_ 1 ;	# Added on 2004/10/26 for F-RTO

Agent/TCPSink set sport_        0
Agent/TCPSink set dport_        0         

#XXX other kinds of sinks -> should reparent
Agent/TCPSink set packetSize_ 40
Agent/TCPSink set maxSackBlocks_ 3
Agent/TCPSink set ts_echo_bugfix_ true ;	# default changed, 2003/8/13
Agent/TCPSink set ts_echo_rfc1323_ false ;	# default added, 2003/8/13
Agent/TCPSink set generateDSacks_ false
Agent/TCPSink set qs_enabled_ false
Agent/TCPSink set RFC2581_immediate_ack_ true
Agent/TCPSink set bytes_ 0

Agent/XCPSink set packetSize_ 40
Agent/XCPSink set ts_echo_bugfix_ true
Agent/XCPSink set bytes_ 0
Agent/XCPSink set RFC2581_immediate_ack_ true
Agent/XCPSink set ts_echo_rfc1323_ false

Agent/TCPSink/DelAck set interval_ 100ms
catch {
	Agent/TCPSink/Asym set interval_ 100ms
	Agent/TCPSink/Asym set maxdelack_ 5
}
Agent/TCPSink/Sack1/DelAck set interval_ 100ms

 # setting newreno_changes_ to 1 implements some changes to reno 
 # proposed by Janey Hoe (other than fixing reno's
 # unnecessary retransmit timeouts)
Agent/TCP/Newreno set newreno_changes_ 0
 # setting newreno_changes1_ to 1 allows the retransmit timer to expire for
 # a window with many packet drops
 # Default changed to 1 on 5/5/03, to reflect RFC 2582.
Agent/TCP/Newreno set newreno_changes1_ 1
Agent/TCP/Newreno set partial_window_deflation_ 1 ; # Default changed to 1
						    # on 5/5/03, to reflect
						    # RFC 2582.
Agent/TCP/Newreno set exit_recovery_fix_ 0

Agent/TCP/Vegas set v_alpha_ 1
Agent/TCP/Vegas set v_beta_ 3
Agent/TCP/Vegas set v_gamma_ 1
Agent/TCP/Vegas set v_rtt_ 0

Agent/TCP/Vegas/RBP set rbp_scale_ 0.75
# rbp_rate_algorithm_'s are defined in tcp-rbp.cc.
# 1=RBP_VEGAS_RATE_ALGORITHM (default),
# 2=RBP_CWND_ALGORITHM
Agent/TCP/Vegas/RBP set rbp_rate_algorithm_ 1
Agent/TCP/Vegas/RBP set rbp_segs_actually_paced_ 0
Agent/TCP/Vegas/RBP set rbp_inter_pace_delay_ 0

Agent/TCP/Reno/RBP set rbp_scale_ 0.75
Agent/TCP/Reno/RBP set rbp_segs_actually_paced_ 0
Agent/TCP/Reno/RBP set rbp_inter_pace_delay_ 0
# Reno/RBP supports only RBP_CWND_ALGORITHM 
# Agent/TCP/Reno/RBP set rbp_rate_algorithm_ 2

Agent/TCP/Asym set g_ 0.125
Agent/TCP/Reno/Asym set g_ 0.125
Agent/TCP/Newreno/Asym set g_ 0.125

# RFC793eduTcp -- 19990820, fcela@acm.org
Agent/TCP/RFC793edu set add793expbackoff_  true 
Agent/TCP/RFC793edu set add793jacobsonrtt_ false
Agent/TCP/RFC793edu set add793fastrtx_     false
Agent/TCP/RFC793edu set add793slowstart_   false
Agent/TCP/RFC793edu set add793additiveinc_ false
Agent/TCP/RFC793edu set add793karnrtt_     true 
Agent/TCP/RFC793edu set rto_               60
Agent/TCP/RFC793edu set syn_               true
Agent/TCP/RFC793edu set add793exponinc_    false

Agent/TCP/FullTcp instproc done_data {} { }

Agent/TFRC set packetSize_ 1000 
Agent/TFRC set rate_ 0 
Agent/TFRC set df_ 0.95 ;	# decay factor for accurate RTT estimate
Agent/TFRC set tcp_tick_ 0.1 ;	
Agent/TFRC set ndatapack_ 0 ;	# Number of packets sent
Agent/TFRC set ndatabytes_ 0 ;	# Number of bytes sent
Agent/TFRC set srtt_init_ 0 ;	# Variables for tracking RTT	
Agent/TFRC set rttvar_init_ 12  
Agent/TFRC set rtxcur_init_ 6.0	
Agent/TFRC set rttvar_exp_ 2	
Agent/TFRC set T_SRTT_BITS 3	
Agent/TFRC set T_RTTVAR_BITS 2	
Agent/TFRC set InitRate_ 300 ;	# Initial send rate	
Agent/TFRC set overhead_ 0 ;	# If > 0, dither outgoing packets
Agent/TFRC set ssmult_ 2 ; 	# Rate of increase during slow-start:
Agent/TFRC set bval_ 1 ;	# Value of B for TCP formula
Agent/TFRC set ca_ 1 ; 	 	# Enable Sqrt(RTT) congestion avoidance
Agent/TFRC set printStatus_ 0 
Agent/TFRC set maxHeavyRounds_ 1; # Number of rounds for sending rate allowed
				  #  to be greater than twice receiving rate.
Agent/TFRC set conservative_ 0 ;  # Set to true for a conservative 
				  # response to heavy congestion.
Agent/TFRC set scmult_ 1.5 ;	# self clocking parameter for conservative_
Agent/TFRC set ecn_ 0 ;		# Set to 1 for ECN-capable connection.
Agent/TFRC set minrto_ 0.0 ;	# Minimum RTO, for use in TCP equation.
				# The default is not to use minrto_.
Agent/TFRC set SndrType_ 0 ;    # Set to 1 to use data-producing applications
                                #   such as FTP.
Agent/TFRC set oldCode_ false ; # Set to 1 to use old code for datalimited
				#   applications.
				# Parameter added on 12/18/02.
Agent/TFRC set maxqueue_ MAXSEQ ;  # queue from application.
Agent/TFRC set rate_init_ 2 ;		# Added on 10/20/2004
				# Set to 1 for backward compatibility. 
				# Default changed on 10/21/2004.
Agent/TFRC set rate_init_option_ 2 ;	# Added on 10/20/2004
				# Set to 1 for backward compatibility. 
				# Set to 2 for RFC 3390 initial rates
				# Default changed on 10/21/2004.
Agent/TFRC set slow_increase_ 1 ;	# Added on 10/20//2004
				# Set to 1 for gradual rate changes.  
				# This also gives backward compatibility.
Agent/TFRC set ss_changes_ 1 ;	# Added on 10/21//2004. 
				# Set to 0 for backward compatibility. 
				# Set to 1 for slow-start changes to 
				#  accomodate higher initial rates.
				# Default changed on 10/22/2004.
Agent/TFRC set voip_ 0 ;        # Added on 10/23/2004      
				# 1 for voip mode.
Agent/TFRC set voip_max_pkt_rate_ 100 ;  # Max rate in pps, for voip mode.
Agent/TFRC set fsize_ 1460 ;	# Default size for large TCP packets. 
				# Used for VoIP mode.
Agent/TFRC set headersize_ 32 ; # Size for packet headers.
Agent/TFRC set useHeaders_ true ;	# Added on 2005/06/24. 
Agent/TFRC set true_loss_rate_ 0.0 ; # For statistics only.

Agent/TFRCSink set packetSize_ 40
Agent/TFRCSink set InitHistorySize_ 100000
Agent/TFRCSink set NumFeedback_ 1 
Agent/TFRCSink set AdjustHistoryAfterSS_ 1
Agent/TFRCSink set NumSamples_ -1
Agent/TFRCSink set discount_ 1;	# History Discounting
Agent/TFRCSink set printLoss_ 0
Agent/TFRCSink set smooth_ 1 ;	# smoother Average Loss Interval
Agent/TFRCSink set ShortIntervals_ 0 ; #  For calculating loss event rates 
                        	# for short loss intervals differently
Agent/TFRCSink set minlc_ 4
Agent/TFRCSink set algo_ 1 ;  	# 1: algo from sigcomm paper 2: ewma 
				# 3: fixed window
Agent/TFRCSink set maxint_ 1000 ;     # max loss interval history 
Agent/TFRCSink set history_ 0.75 ;    # loss history for EWMA
Agent/TFRCSink set PreciseLoss_ 1 ;   # 1 for more precise loss events
				      # Introduced on 12/11/02, default 1.
				      # No change in performance.
Agent/TFRCSink set numPkts_ 1;	# Num non-sequential packets before loss
				# Introduced on 12/12/02, with default 1.
				# Default changed to 3 on 12/16/02.
				# Default changed to 1 on 10/28/03 due
				#    to a major bug.
Agent/TFRCSink set bytes_ 0 ;	# For counting bytes received.

if [TclObject is-class Agent/TCP/FullTcp] {
	Agent/TCP/FullTcp set segsperack_ 1; # ACK frequency
	Agent/TCP/FullTcp set spa_thresh_ 0; # below do 1 seg per ack [0:disable]
	Agent/TCP/FullTcp set segsize_ 536; # segment size
	Agent/TCP/FullTcp set tcprexmtthresh_ 3; # num dupacks to enter recov
	Agent/TCP/FullTcp set iss_ 0; # Initial send seq#
	Agent/TCP/FullTcp set nodelay_ false; # Nagle disable?
	Agent/TCP/FullTcp set data_on_syn_ false; # allow data on 1st SYN?
	Agent/TCP/FullTcp set dupseg_fix_ true ; # no rexmt w/dup segs from peer
	Agent/TCP/FullTcp set dupack_reset_ false; # exit recov on ack < highest
	Agent/TCP/FullTcp set interval_ 0.1 ; # delayed ACK interval 100ms 
	Agent/TCP/FullTcp set close_on_empty_ false; # close conn if sent all
	Agent/TCP/FullTcp set signal_on_empty_ false; # signal if sent all
	Agent/TCP/FullTcp set ts_option_size_ 10; # in bytes
	Agent/TCP/FullTcp set reno_fastrecov_ true; # fast recov true by default
	Agent/TCP/FullTcp set pipectrl_ false; # use "pipe" ctrl
	Agent/TCP/FullTcp set open_cwnd_on_pack_ true; # ^ win on partial acks?
	Agent/TCP/FullTcp set halfclose_ false; # do simplex closes (shutdown)?
	Agent/TCP/FullTcp set nopredict_ false; # disable header prediction code?

	Agent/TCP/FullTcp/Newreno set recov_maxburst_ 2; # max burst dur recov

	Agent/TCP/FullTcp/Sack set sack_block_size_ 8; # bytes in a SACK block
	Agent/TCP/FullTcp/Sack set sack_option_size_ 2; # bytes in opt hdr
	Agent/TCP/FullTcp/Sack set max_sack_blocks_ 3; # max # of sack blks
	Agent/TCP/FullTcp/Sack set clear_on_timeout_ true; # clear sq at sender on timeout?
	Agent/TCP/FullTcp/Sack set sack_rtx_cthresh_ 1; # dup cnt to trigger rtx
	Agent/TCP/FullTcp/Sack set sack_rtx_bthresh_ 1; # dup bcnt to trigger rtx
	Agent/TCP/FullTcp/Sack set sack_rtx_threshmode_ 1; # 1 = cnt only

	Agent/TCP/FullTcp/Tahoe instproc init {} {
		$self next
		$self instvar reno_fastrecov_
		set reno_fastrecov_ false
	}

	Agent/TCP/FullTcp/Sack instproc init {} {
		$self next
		$self instvar reno_fastrecov_ open_cwnd_on_pack_
		set reno_fastrecov_ false
		set open_cwnd_on_pack_ false
	}

	Agent/TCP/FullTcp/Newreno instproc init {} {
		$self next
		$self instvar open_cwnd_on_pack_
		set open_cwnd_on_pack_ false
	}

}

if [TclObject is-class Agent/TCP/BayFullTcp] {
	Agent/TCP/BayFullTcp set segsperack_ 1; # ACK frequency
	Agent/TCP/BayFullTcp set segsize_ 536; # segment size
	Agent/TCP/BayFullTcp set tcprexmtthresh_ 3; # num dupacks to enter recov
	Agent/TCP/BayFullTcp set iss_ 0; # Initial send seq#
	Agent/TCP/BayFullTcp set nodelay_ false; # Nagle disable?
	Agent/TCP/BayFullTcp set data_on_syn_ false; # allow data on 1st SYN?
	Agent/TCP/BayFullTcp set dupseg_fix_ true ; # no rexmt w/dup segs from peer
	Agent/TCP/BayFullTcp set dupack_reset_ false; # exit recov on ack < highest
	Agent/TCP/BayFullTcp set interval_ 0.1 ; # delayed ACK interval 100ms 
	Agent/TCP/BayFullTcp set close_on_empty_ false; # close conn if sent all
	Agent/TCP/BayFullTcp set ts_option_size_ 10; # in bytes
	Agent/TCP/BayFullTcp set reno_fastrecov_ true; # fast recov true by default
	Agent/TCP/BayFullTcp set pipectrl_ false; # use "pipe" ctrl
	Agent/TCP/BayFullTcp set open_cwnd_on_pack_ true; # ^ win on partial acks?
	Agent/TCP/BayFullTcp set halfclose_ false; # do simplex closes (shutdown)?
	Agent/TCP/BayFullTcp/Newreno set recov_maxburst_ 2; # max burst dur recov

	Agent/TCP/BayFullTcp/Sack set sack_block_size_ 8; # bytes in a SACK block
	Agent/TCP/BayFullTcp/Sack set sack_option_size_ 2; # bytes in opt hdr
	Agent/TCP/BayFullTcp/Sack set max_sack_blocks_ 3; # max # of sack blks
}

# Default values used by wireless simulations
Agent/Null set sport_           0
Agent/Null set dport_           0

Agent/CBR set sport_            0
Agent/CBR set dport_            0

# Http invalidation agent
Agent/HttpInval set inval_hdr_size_ 40

Agent/RTP set seqno_ 0
Agent/RTP set interval_ 3.75ms
Agent/RTP set random_ 0
Agent/RTP set packetSize_ 210
Agent/RTP set maxpkts_ 0x10000000
Agent/RTP instproc done {} { }

Agent/RTCP set seqno_ 0

Agent/Message set packetSize_ 180

Agent/MessagePassing set packetSize_ 1500

Agent/LossMonitor set nlost_ 0
Agent/LossMonitor set npkts_ 0
Agent/LossMonitor set bytes_ 0
Agent/LossMonitor set lastPktTime_ 0
Agent/LossMonitor set expected_ 0

# RAP
Agent/RAP set packetSize_ 512
Agent/RAP set seqno_ 0
Agent/RAP set sessionLossCount_ 0
Agent/RAP set ipg_ 2.0
Agent/RAP set alpha_ 1.0
Agent/RAP set beta_ 0.5
Agent/RAP set srtt_ 2.0
Agent/RAP set variance_ 0.0
Agent/RAP set delta_ 0.5
Agent/RAP set mu_ 1.2
Agent/RAP set phi_ 4.0
Agent/RAP set timeout_ 2.0
Agent/RAP set overhead_ 0
Agent/RAP set useFineGrain_ 0
Agent/RAP set kfrtt_ 0.9
Agent/RAP set kxrtt_ 0.01
Agent/RAP set debugEnable_ 0
Agent/RAP set rap_base_hdr_size_ 44
Agent/RAP set dpthresh_ 50
Agent/RAP instproc done {} { }

# Routing protocol agents
Agent/Mcast/Control set packetSize_ 80

# Dynamic routing defaults
Agent/rtProto set preference_ 200		;# global default preference
Agent/rtProto/Direct set preference_ 100
Agent/rtProto/DV set preference_	120
Agent/rtProto/DV set INFINITY		 [Agent set ttl_]
Agent/rtProto/DV set advertInterval	  2

Agent/Encapsulator set status_ 1
Agent/Encapsulator set overhead_ 20

Agent/DSRAgent set sport_ 255
Agent/DSRAgent set dport_ 255

Agent/MIPBS set adSize_ 48
Agent/MIPBS set shift_ 0
Agent/MIPBS set mask_ [AddrParams set ALL_BITS_SET]
Agent/MIPBS set ad_lifetime_ 2
 
Agent/MIPMH set home_agent_ 0
Agent/MIPMH set rreqSize_ 52
Agent/MIPMH set reg_rtx_ 0.5
Agent/MIPMH set shift_ 0
Agent/MIPMH set mask_ [AddrParams set ALL_BITS_SET]
Agent/MIPMH set reg_lifetime_ 2
 
# Intitialization for directed diffusion : Chalermek
Agent/Diff_Sink set packetSize_ 512
Agent/Diff_Sink set interval_   0.5
Agent/Diff_Sink set random_     1
Agent/Diff_Sink set maxpkts_    10000
Agent/Diff_Sink set data_type_  0

# PLM contributed by Arnaud Legout at EURECOM
Agent/LossMonitor/PLM set flag_PP_ 0
Agent/LossMonitor/PLM set packet_time_PP_ 0
Agent/LossMonitor/PLM set fid_PP_ 0
Agent/LossMonitor/PLM set seqno_ 0

# MPLS Label Distribution Protocol agent
Agent/LDP set trace_ldp_ 0

# Default to NOT nix-vector routing
Simulator set nix-routing 0
#Node/NixNode set id_ 0

#Routing Module variable setting
RtModule set classifier_ ""
RtModule/Base set classifier_ ""
#RtModule/Hier set classifier_ [new Classifier/Hier]
#RtModule/Manual set classifier_ [new Classifier/Hash/Dest 2]
#RtModule/VC set classifier_ [new Classifier/Virtual]

#
# LMS initializations
#
LMSErrorModel set rate_		0.0	;# just to eliminate warnings
LMSErrorModel set errPkt_	0
LMSErrorModel set errByte_	0
LMSErrorModel set errTime_	0.0
LMSErrorModel set onlink_	0
LMSErrorModel set enable_	0
LMSErrorModel set ndrops_	0
LMSErrorModel set bandwidth_	2Mb
LMSErrorModel set markecn_	false
LMSErrorModel set debug_	false
LMSErrorModel set delay_pkt_ false
LMSErrorModel set delay_ 0

set lmsPacketSize 1024
set lsize [Application/Traffic/CBR set packetSize_]

RtModule/LMS set node_	""

Agent/LMS set lms_enabled_	1
Agent/LMS set packetSize_	$lmsPacketSize

Agent/LMS/Sender set interval_ 4.0ms
Agent/LMS/Sender set packetSize_ $lsize
Agent/LMS/Sender set lmsPacketSize_ $lmsPacketSize
Agent/LMS/Sender set random_ 0
Agent/LMS/Sender set maxpkts_ 0x10000000
Agent/LMS/Sender set odat_ 0
Agent/LMS/Sender instproc done {} { }

Agent/LMS/Receiver set lmsPacketSize_ $lmsPacketSize
Agent/LMS/Receiver set bytes_ 0
Agent/LMS/Receiver set nlost_ 0
Agent/LMS/Receiver set npkts_ 0
Agent/LMS/Receiver set expected_ 0
Agent/LMS/Receiver set lastPktTime_ 0.0
Agent/LMS/Receiver instproc done {} { }
Agent/LMS/Receiver set packetSize_ $lsize

# Following defaults defined for TCP Quick Start
# http://www.icir.org/floyd/quickstart.html

Agent/TCP/Newreno/QS set rbp_scale_ 0.75
Agent/TCP/Newreno/QS set rbp_segs_actually_paced_ 0
Agent/TCP/Newreno/QS set rbp_inter_pace_delay_ 0
Agent/TCP/Newreno/QS set rate_request_ 128

Agent/QSAgent set qs_enabled_ 1
Agent/QSAgent set old_classifier_ 0
Agent/QSAgent set state_delay_ 0.2 ;	# Changed from 0.25 to 0.2, 2/25/05.
Agent/QSAgent set alloc_rate_ 0.85 ; 	# Changed from 0.6 to 0.85, 2/25/05.
Agent/QSAgent set threshold_ 0.85 ; 	# Changed from 0.4 to 0.85, 2/25/05.
Agent/QSAgent set max_rate_ 256
Agent/QSAgent set mss_ [Agent/TCP set packetSize_]
Agent/QSAgent set rate_function_ 2
Agent/QSAgent set algorithm_ 3	; 	# Changed from 2 to 3, 2/25/05.

Agent/TCPSink/QS set sport_        0
Agent/TCPSink/QS set dport_        0         

Agent/TCPSink/QS set packetSize_ 40
Agent/TCPSink/QS set maxSackBlocks_ 3
Agent/TCPSink/QS set ts_echo_bugfix_ false
Agent/TCPSink/QS set generateDSacks_ false
Agent/TCPSink/QS set RFC2581_immediate_ack_ true

Queue set util_weight_ 0.8
Queue set util_check_intv_ 0.2 ;	# Changed from 1 to 0.2, 2/25/05.
Queue set util_records_ 5 ; 		# Changed from 0 to 5, 2/25/05.

# Quick Start definitions end here

Delayer set debug_ false

#NIST: add
Agent/myUDP set packetSize_ 1000
Tracefile set debug_ 0
#end NIST
 
