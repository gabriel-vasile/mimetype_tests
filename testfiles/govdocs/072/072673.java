/*
 * This file is part of jPlot
 *
 * jPlot is a Java version of Tim Shepard's xplot which is distributed
 * under the M.I.T. license (as below).
 *
 * Tim Shepard's original xplot is an amazing piece of software. It was
 * designed to be extraordinarily fast and efficient and as such, it has
 * only a very thin user interface. Those design goals, however, make
 * xplot extremely difficult to port to new architectures and also make it
 * difficult to use for the casual user. jPlot was designed to address
 * these limitations while keeping as much of the original efficiency as
 * possible. We thank Tim Shepard for his hard work on xplot and hope that
 * jPlot can live up to his high standards.
 *
 * jPlot was developed by Avinash Lakhiani at the Internetworking Research
 * Lab (IRG), Ohio University, as part of Dr. Shawn Ostermann's tcptrace
 * project. The main goal behind the development of jPlot was to make the
 * plotting tool used with tcptrace more portable. As a result, jPlot
 * retains many of the original algorithms implemented in xplot, and as per
 * the terms and conditions of the M.I.T. license, continue to remain under
 * that license. The M.I.T license is as follows:
 *
 * --- M.I.T License Begin ---
 *
 * Copyright 1992,1993 by the Massachusetts Institute of Technology.
 *                   All rights reserved.
 *
 * THIS SOFTWARE IS PROVIDED "AS IS", AND M.I.T. MAKES NO REPRESENTATIONS
 * OR WARRANTIES, EXPRESS OR IMPLIED.  By way of example, but not
 * limitation, M.I.T. MAKES NO REPRESENTATIONS OR WARRANTIES OF
 * MERCHANTABILITY OR FITNESS FOR ANY PARTICULAR PURPOSE OR THAT THE USE
 * OF THE LICENSED SOFTWARE OR DOCUMENTATION WILL NOT INFRINGE ANY THIRD
 * PARTY PATENTS, COPYRIGHTS, TRADEMARKS OR OTHER RIGHTS.
 *
 * The name of the Massachusetts Institute of Technology or M.I.T. may
 * NOT be used in advertising or publicity pertaining to distribution of
 * the software.  Title to copyright in this software and any associated
 * documentation shall at all times remain with M.I.T., and USER agrees
 * to preserve same.
 *
 * --- M.I.T. License End ---
 *
 * jPlot also has a lot of added features that are not part of the original
 * xplot code. Those sections of code are distributed under the following
 * BSD License:
 *
 * --- BSD License Begin ---
 *
 * Copyright (c) 2002, Avinash Lakhiani
 * All rights reserved.
 *
 * Redistribution and use in source and binary forms, with or without
 * modification, are permitted provided that the following conditions
 * are met:
 *
 *   - Redistributions of source code must retain the above copyright
 *     notice, this list of conditions and the following disclaimer.
 *   - Redistributions in binary form must reproduce the above copyright
 *     notice, this list of conditions and the following disclaimer in
 *     the documentation and/or other materials provided with the
 *     distribution.
 *   - Neither the name of Ohio University nor the names of its contributors
 *     may be used to endorse or promote products derived from this software
 *     without specific prior written permission.
 *
 * THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS
 * "AS IS" AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT
 * LIMITED TO, THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A
 * PARTICULAR PURPOSE ARE DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT
 * OWNER OR CONTRIBUTORS BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL,
 * SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT
 * LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE,
 * DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY
 * THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT
 * (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE
 * OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
 *
 * --- BSD License End ---
 *
 * You should have received a file named "DISTINCTION" along with this
 * distribution, that clearly identifies all the algorithms that were
 * retained from the original xplot code, and remain under the M.I.T.
 * license. The rest of the code was written for jPlot, and falls under
 * the BSD license.
 *
 * jPlot is free software; you can redistribute it and/or modify it under the
 * terms and conditions of both the above licenses.
 *
 * jPlot is distributed in the hope that it will be useful, but WITHOUT ANY
 * WARRANTY; without even the implied warranty of MERCHANTABILITY or FITNESS
 * FOR A PARTICULAR PURPOSE.  See the above licenses for more details.
 *
 * Author:  Avinash Lakhiani
 *          Internetworking Research Group
 *          Ohio University
 *          Athens, OH
 *          avinash.lakhiani@ohiou.edu
 *          http://www.tcptrace.org/jPlot
 *
 */

/* Import Packages */

import java.text.NumberFormat;

/* Class       - cDouble
 * Description - this class is for the coordinates of type double. It implements all
 * the necessary methods for manipulation of instances of this type.
 * Extends     - NULL
 * Implements  - Coord
 * NOTES       - this class is the java implementation of the coordinate-type double
 * from Tim Shepard's xplot.
 */

public class cDouble implements Coord {

    private double d;

    /* Method      - cDouble (Constructor)
     * Parameters  - NULL
     * Returns     - NULL
     * Description - this constructor is called when a coordinate of type double is
     * created with no initial value. The value is then set to 0 by default.
     */
    public cDouble() {
        this.zero();
    }

    /* Method      - cDouble (Constructor)
     * Parameters  - the string from which the double value is to be extracted.
     * Returns     - NULL
     * Description - this constructor is called when a coordinate of type double is
     * read in from the file as a string.
     */
    public cDouble(String s) {
        this.parse(s);
    }

    /* Method      - cDouble (Constructor)
     * Parameters  - the object from which the double value is to be taken.
     * Returns     - NULL
     * Description - this constructor is called when a coordinate of type double is obtained
     * from another coordinate
     */
    public cDouble(Coord c) {
        cDouble k = (cDouble) c;
        this.d = k.d;
    }

    /* Method      - set
     * Parameters  - value the coordinate is to be set to.
     * Returns     - NULL
     * Description - sets the value of the coordinate (field d) to the given value.
     */
    public void set(double val) {
        this.d = (double) val;
    }

    /* Method      - get
     * Parameters  - NULL
     * Returns     - the value of the coordinate
     * Description - fetches the value of the calling coordinate and returns it.
     */
    public double get() {
        return (this.d);
    }

    /* Method      - unparse
     * Parameters  - NULL
     * Returns     - the coordinate as a string
     * Description - used to convert the calling coordinate into a string
     */
    public String unparse() {
        NumberFormat nf = NumberFormat.getInstance();  // Returns the default number format for the current default locale
        nf.setGroupingUsed(false);                     // Turn off the grouping (placing commas' every 3 digits)
        if (Math.abs(this.d) > 1E-16) {
            nf.setMaximumFractionDigits(10);  // Set the fractional part to a max of 10 places
            return (nf.format(this.d));        // Format the number and return the string
        } else {
            return ("0");
        }
    }

    /* Method      - parse
     * Parameters  - the string from which the double value is to be extracted.
     * Returns     - NULL
     * Description - extracts the double value from the provided string, and sets
     * the member variable d.
     */
    public void parse(String s) {
        Double dObj = new Double(s);
        this.d = dObj.doubleValue();
    }

    /* Method      - zero
     * Parameters  - NULL
     * Returns     - NULL
     * Description - sets the coordinate to zero.
     */
    public void zero() {
        this.d = 0.0;
    }

    /* Method      - compareTo
     * Parameters  - the coordinate with which the calling coordinate is to be compared.
     * Returns     - result of comparison i.e. -1 for <, 0 for ==, 1 for >.
     * Description - performs the comparison of the coordinates and returns the results.
     */
    public int compareTo(Coord c) {
        cDouble k = (cDouble) c;
        if (this.d > k.d)
            return (1);
        else if (this.d < k.d)
            return (-1);
        else
            return (0);
    }

    /* Method      - add
     * Parameters  - the coordinate to add to the calling coordinate.
     * Returns     - NULL
     * Description - adds the value of the passed coordinate to the calling coordinate.
     */
    public void add(Coord c) {
        cDouble k = (cDouble) c;
        this.d += k.d;
    }

    /* Method      - subtract
     * Parameters  - the coordinate to subtract from the calling coordinate.
     * Returns     - NULL
     * Description - subtracts the value of the passed coordinate from the calling coordinate.
     */
    public void subtract(Coord c) {
        cDouble k = (cDouble) c;
        this.d -= k.d;
    }

    /* Method      - roundUp
     * Parameters  - the rounding range
     * Returns     - NULL
     * Description - rounds-up the calling coordinate.
     */
    public void roundUp(Coord c1, Coord c2) {
        cDouble k1 = (cDouble) c1;
        cDouble k2 = (cDouble) c2;
        double rem = Math.IEEEremainder(k1.d, k2.d);
        if (rem > 0.0)
            this.d = k1.d + (k2.d - rem);
        else
            this.d = k1.d - rem;
    }

    /* Method      - roundDown
     * Parameters  - the rounding range
     * Returns     - NULL
     * Description - rounds-down the calling coordinate.
     */
    public void roundDown(Coord c1, Coord c2) {
        cDouble k1 = (cDouble) c1;
        cDouble k2 = (cDouble) c2;
        double rem = Math.IEEEremainder(k1.d, k2.d);
        if (rem > 0.0)
            this.d = k1.d - rem;
        else
            this.d = k1.d + (k2.d - rem);
    }

    /* Method      - tick
     * Parameters  - the level
     * Returns     - NULL
     * Description - sets the appropriate tick value. Basically sets the tick marks for
     * the axis.
     * NOTES       - this algorithm is taken (as-it-is) from Tim Shepard's xplot.
     */
    public void tick(int level) {
        this.d = 1.0;
        while (level < Constant.MIDLEVEL - 3) {
            this.d /= 10.0;
            level += 3;
        }
        while (level < Constant.MIDLEVEL) {
            this.d /= 2.0;			/* to 5 */
            level++;
            if (level < Constant.MIDLEVEL) {
                this.d /= 2.5;		/* to 2 */
                level++;
            }
            if (level < Constant.MIDLEVEL) {
                this.d /= 2.0;		/* to 1 */
                level++;
            }
        }
        while (level > Constant.MIDLEVEL + 3) {
            this.d *= 10.0;
            level -= 3;
        }
        while (level > Constant.MIDLEVEL) {
            this.d *= 2.0;			/* to 2 */
            level--;
            if (level > Constant.MIDLEVEL) {
                this.d *= 2.5;		/* to 5 */
                level--;
            }
            if (level > Constant.MIDLEVEL) {
                this.d *= 2.0;		/* to 1 */
                level--;
            }
        }
    }

    /* Method      - subTick
     * Parameters  - the level
     * Returns     - NULL
     * Description - sets the appropriate subtick value. Basically sets the subtick marks for
     * the axis.
     * NOTES       - this algorithm is taken (as-it-is) from Tim Shepard's xplot.
     */
    public int subTick(int level) {
        int r = level;
        if (level < 2)
            r = 0;
        else
            switch (level % 3) {
            case 2:
                r = level - 2;
                break;
            case 1:
                r = level - 1;
                break;
            case 0:
                r = level - 1;
                break;
            }
        return (r);
    }

    /* Method      - map
     * Parameters  - the boundary coordinates, and the drawing area size.
     * Returns     - the mapped double value of the calling coordinate.
     * Description - maps the calling coordinate to the cooresponding coordinate on the
     * viewport.
     */
    public double map(Coord c1, Coord c2, double n) {
        double r;
        cDouble k1 = (cDouble) c1;
        cDouble k2 = (cDouble) c2;
        r = ((this.d - k1.d) / (k2.d - k1.d)) * n;
        return (r);
    }

    /* Method      - unmap
     * Parameters  - the boundary coordinates, the size of the drawing area, and the
     * coordinate to be unmapped.
     * Returns     - NULL
     * Description - computes the window coordinates, and sets the calling coordinate to the
     * resultant value.
     */
    public void unmap(Coord c1, Coord c2, double n, double x) {
        cDouble k1 = (cDouble) c1;
        cDouble k2 = (cDouble) c2;
        this.d = ((double) x / (double) n) * (k2.d - k1.d) + k1.d;
    }

    /* Method      - toString
     * Parameters  - NULL
     * Returns     - the string representation of the double value
     * Description - gets the string representing the double value, and returns it.
     */
    public String toString() {
        Double dObj = new Double(this.d);
        return (dObj.toString());
    }
} // End of class cDouble
