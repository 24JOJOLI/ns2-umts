
/*
 * hdr_qs.cc
 * Copyright (C) 2001 by the University of Southern California
 * $Id: hdr_qs.cc,v 1.1.1.1 2006/03/08 13:53:01 rouil Exp $
 *
 * This program is free software; you can redistribute it and/or
 * modify it under the terms of the GNU General Public License,
 * version 2, as published by the Free Software Foundation.
 *
 * This program is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 * GNU General Public License for more details.
 *
 * You should have received a copy of the GNU General Public License along
 * with this program; if not, write to the Free Software Foundation, Inc.,
 * 59 Temple Place, Suite 330, Boston, MA 02111-1307, USA.
 *
 *
 * The copyright of this module includes the following
 * linking-with-specific-other-licenses addition:
 *
 * In addition, as a special exception, the copyright holders of
 * this module give you permission to combine (via static or
 * dynamic linking) this module with free software programs or
 * libraries that are released under the GNU LGPL and with code
 * included in the standard release of ns-2 under the Apache 2.0
 * license or under otherwise-compatible licenses with advertising
 * requirements (or modified versions of such code, with unchanged
 * license).  You may copy and distribute such a system following the
 * terms of the GNU GPL for this module and the licenses of the
 * other code concerned, provided that you include the source code of
 * that other code when and as the GNU GPL requires distribution of
 * source code.
 *
 * Note that people who make modified versions of this module
 * are not obligated to grant this special exception for their
 * modified versions; it is their choice whether to do so.  The GNU
 * General Public License gives permission to release a modified
 * version without this exception; this exception also makes it
 * possible to release a modified version which carries forward this
 * exception.
 *
 */

/*
 * Quick Start for TCP and IP.
 * A scheme for transport protocols to dynamically determine initial 
 * congestion window size.
 *
 * http://www.ietf.org/internet-drafts/draft-amit-quick-start-02.ps
 *
 * Packet header definition for Quick Start implementation
 * hdr_qs.h
 *
 * Srikanth Sundarrajan, 2002
 * sundarra@usc.edu
 */

#include <stdio.h>
#include "hdr_qs.h"
#include "qsagent.h"
#include <math.h>

int hdr_qs::offset_;

static class QSHeaderClass : public PacketHeaderClass {
public:
	QSHeaderClass() : PacketHeaderClass("PacketHeader/QS", sizeof(hdr_qs)) {
		bind_offset(&hdr_qs::offset_);
	}

} class_qshdr;


/*
 * These two functions convert rate in QS packet to KBps and vice versa.
 */
double hdr_qs::rate_to_Bps(int rate)
{
       if (rate == 0)
               return 0;
       switch(QSAgent::rate_function_) {
       case 1:
       default:
               return rate * 10240; // rate unit: 10 kilobytes per sec
       case 2:
               return pow(2, rate) * 5000; // exponential, base 2
       }
}

int hdr_qs::Bps_to_rate(double Bps)
{
       if (Bps == 0)
               return 0;
       switch(QSAgent::rate_function_) {
       case 1:
       default:
               return (int) Bps / 10240; // rate unit: 10 kilobytes per sec
       case 2:
               return (int) (log(Bps / 5000) / log(2));
       }
}

// Local Variables:
// mode:c++
// c-basic-offset: 8
// End:

