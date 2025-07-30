--   SMT_OnlineDB_Production.sql
--   ***********************************************************************************
--
--   D0 SMT Online Database Production Script
--
--   The Latest Version of SMT Online Database Design Can Be Found At:
--
--          http://svxjava.phys.nwu.edu/d0_calib.html
--
--   This Script generates Following Databases:
--   
--          1) SMT Online Calibration Database
--          2) SMT Online Monitor Database
--          3) SMT Detector Configuration Database
--
--   The First Part (Part 1) Removes Previous SMT Online Databases. If This Is Your Frist 
--   Time To Run This Script, Error Messages Will Show Up Because The PreVious SMT Online 
--   Databases Do Not Exist Yet. Just Ignore Those Error Messages.
--
--   The Second Part (Part 2) Regenerates New SMT Online Databases. 
-- 
--   WHENEVER YOU WANT TO MODIFY SMT ONLINE DATABASE, SIMPLY MODIFY THIS SCRIPT, RERUN THIS 
--   SCRIPT TO REGENERATE THE NEW SMT ONLINE DATABASE. REMEMBER ORACLE IS RELATIONAL DATABASE, 
--   THE ORDER OF DROPPING AND GENERATING TABLES IS VERY IMPORTANT.
--
--   All EPICS Link Fields Should Follow D0 EPICS Naming Convention. For example:
-- 
--     INT_EPICS_LINK in table SMT_DAQ_INTERFACE should be in form of: SMT_INTXXYY/INT
--     SEQ_EPICS_LINK in table SMT_DAQ_SEQ should be in form of: SMT_SEQXXYY/SEQ
--     VRB_EPICS_LINK in table SMT_DAQ_VRB should be in form of: SMT_VRBXXYY/VRB
--     SEQC_EPICS_LINK in table SMT_DAQ_SEQC should be in form of: SMT_SEQCXXYY/SEQC
--     VRBC_EPICS_LINK in table SMT_DAQ_VRBC should be in form of: SMT_VRBCXXYY/VRBC
--     VBD_EPICS_LINK in table SMT_DAQ_VBD should be in form of: SMT_VBDXXYY/VBD
--
--     (XX, YY are the numbers to specify the specific device) 
--
--   To Run This Script, Login Your Oracle Account. Assume This Script 
--   (SMT_OnlineDB_Production.sql) Is Located Under D:\fanxl\oracle\, Type:
--
--          @D:\fanxl\oracle\SMT_OnlineDB_Production.sql
--
--   Author:      Xiaoling Fan
--   Institution: Northwestern University
--
--   Creation Date: Dec. 26, 1999
--
--   ***********************************************************************************

--   -----------------------------------------------------------------------------------
--
--   Part 1: Delete Previous SMT Online Databases
--
--   -----------------------------------------------------------------------------------

drop table SMT_DAQ_CHIP;
drop table SMT_DAQ_HDI;
drop table SMT_DAQ_VRB;
drop table SMT_DAQ_SEQ;
drop table SMT_DAQ_INTERFACE;
drop table SMT_DAQ_VBD;
drop table SMT_DAQ_SEQC;
drop table SMT_DAQ_VRBC;
drop table SMT_INT_CRATE;
drop table SMT_SEQ_CRATE;
drop table SMT_VRB_CRATE;
drop table MON_SMT_RESPONSE;
drop table MONITOR_RUN;
drop table MON_COMPARISON_SET;

drop table CAL_SVX_GAIN;
drop table CAL_SVX_PEDESTAL;
drop table SMT_SVX_CHANNEL;
drop table CALIBRATION_RUN;
drop table SMT_SVX_CHIP;
drop table DETECTOR;
drop table CAL_COMPARISON_SET;
drop table CALIBRATION_TYPE;

--   -----------------------------------------------------------------------------------
--
--   Part 2.1, SMT Online Calibration Database Production
--
--   -----------------------------------------------------------------------------------

-- table CALIBRATION_TYPE

create table CALIBRATION_TYPE (
CALIBRATION_ID          NUMBER(4),
DESCRIPTION             VARCHAR2(500) default NULL,
constraint PK_CALIBRATION_TYPE primary key (CALIBRATION_ID));

-- table CAL_COMPARISON_SET

create table CAL_COMPARISON_SET (
COM_SET_ID              NUMBER(6),
GAIN_RUN_NUMBER         NUMBER(6) default 0
                        constraint CHK_GAIN_RUN_NUMBER 
                        check (GAIN_RUN_NUMBER >= 0),
PEDESTAL_RUN_NUMBER     NUMBER(6) default 0
                        constraint CHK_PEDESTAL_RUN_NUMBER
                        check (PEDESTAL_RUN_NUMBER >= 0),
constraint PK_CAL_COMPARISON_SET primary key (COM_SET_ID));

-- table DETECTOR

create table DETECTOR (
DETECTOR_ID             VARCHAR2(10),           
NAME                    VARCHAR2(10)
constraint DET_NAME NOT NULL,
constraint PK_DETECTOR primary key (DETECTOR_ID) );

-- table SMT_SVX_CHIP

create table SMT_SVX_CHIP (
SVX_SERIAL_NO           VARCHAR2(10),
constraint PK_SMT_SVX_CHIP primary key (SVX_SERIAL_NO));

-- table CALIBRATION_RUN
 
create table CALIBRATION_RUN (
RUN_NUMBER              NUMBER(6),
TIME                    DATE default SYSDATE,
COMMENTS                VARCHAR2(500),
constraint PK_CALIBRATION_RUN primary key (RUN_NUMBER));

-- table SVX_CHANNEL 

create table SMT_SVX_CHANNEL (
SVX_SERIAL_NO           VARCHAR2(10),
CHANNEL_NUMBER          NUMBER(3) 
                        constraint CHK_CHANNEL_NUMBER 
                        check (CHANNEL_NUMBER between 0 and 127),
STATUS                  NUMBER(3) default 0,
constraint PK_SMT_SVX_CHANNEL primary key (SVX_SERIAL_NO, CHANNEL_NUMBER),
constraint FK_SMT_SVX_CHANNEL
           foreign key (SVX_SERIAL_NO) references SMT_SVX_CHIP (SVX_SERIAL_NO) );

-- table CAL_SVX_GAIN

create table CAL_SVX_GAIN (
SVX_SERIAL_NO           VARCHAR2(10),
CHANNEL_NUMBER          NUMBER(3),
RUN_NUMBER              NUMBER(6),
GAIN                    NUMBER(4,2) default -1.5
                        constraint CHK_GAIN 
                        check (GAIN <= 0.00),
GAIN_ERROR              NUMBER(4,2) default 0.00
                        constraint CHK_GAIN_ERROR
                        check (GAIN_ERROR >= 0.00),
ERROR_FLAG              NUMBER(1) default 0,
constraint PK_CAL_SVX_GAIN primary key (SVX_SERIAL_NO, CHANNEL_NUMBER, RUN_NUMBER),
constraint FK1_CAL_SVX_GAIN 
           foreign key (SVX_SERIAL_NO, CHANNEL_NUMBER) references SMT_SVX_CHANNEL 
           (SVX_SERIAL_NO, CHANNEL_NUMBER),
constraint FK2_CAL_SVX_GAIN 
           foreign key (RUN_NUMBER) references CALIBRATION_RUN 
           (RUN_NUMBER) );

-- table CAL_SVX_PEDESTAL 

create table CAL_SVX_PEDESTAL (
SVX_SERIAL_NO           VARCHAR2(10),
CHANNEL_NUMBER          NUMBER(3),
RUN_NUMBER              NUMBER(6),
PEDESTAL                NUMBER(5,2) default 0.00
                        constraint CHK_PEDESTAL
                        check (PEDESTAL >= 0.00),
PEDESTAL_ERROR          NUMBER(5,2) default 0.00
                        constraint CHK_PEDESTAL_ERROR
                        check (PEDESTAL_ERROR >= 0.00),
ERROR_FLAG              NUMBER(1) default 0,
constraint PK_CAL_SVX_PEDESTAL primary key (SVX_SERIAL_NO, CHANNEL_NUMBER, RUN_NUMBER),
constraint FK1_CAL_SVX_PEDESTAL 
           foreign key (SVX_SERIAL_NO, CHANNEL_NUMBER) references SMT_SVX_CHANNEL 
           (SVX_SERIAL_NO, CHANNEL_NUMBER),
constraint FK2_CAL_SVX_PEDESTAL 
           foreign key (RUN_NUMBER) references CALIBRATION_RUN 
           (RUN_NUMBER) );

--   -----------------------------------------------------------------------------------
--
--   Part 2.2, SMT Online Monitor Database Production
--
--   -----------------------------------------------------------------------------------

-- table MON_COMPARISON_SET

create table MON_COMPARISON_SET (
COM_SET_ID              NUMBER(6),
MON_RUN_NUMBER          NUMBER(6) default 0
                        constraint CHK_MON_RUN_NUMBER
                        check (MON_RUN_NUMBER >= 0),
constraint PK_MON_COMPARISON_SET primary key (COM_SET_ID) );

-- table MONITOR_RUN

create table MONITOR_RUN (
RUN_NUMBER              NUMBER(6),
TIME                    DATE default SYSDATE,
COMMENTS                VARCHAR2(500) default NULL,
constraint              PK_MONITOR_RUN primary key (RUN_NUMBER) );

-- table MON_SMT_RESPONSE

create table MON_SMT_RESPONSE (
SVX_SERIAL_NO           VARCHAR2(13),
CHANNEL_NUMBER          NUMBER(3),
RUN_NUMBER              NUMBER(6),
RESPONSE                NUMBER(5,2) default 0.0
                        constraint CHK_RESPONSE
                        check (RESPONSE >= 0.00),
RESPONSE_ERROR          NUMBER(5,2) default 0.0
                        constraint CHECK_RESPONSE_ERROR
                        check (RESPONSE_ERROR >= 0.00),
NUMBER_OF_EVENTS        NUMBER(6) default 0
                        constraint CHK_NUMBER_OF_EVENTS
                        check (NUMBER_OF_EVENTS > 0),
ERROR_LOG               NUMBER(1) default 0,
constraint PK_SMT_RESPONSE primary key (SVX_SERIAL_NO, CHANNEL_NUMBER, RUN_NUMBER),
constraint FK1_SMT_RESPONSE foreign key (SVX_SERIAL_NO, CHANNEL_NUMBER) references 
           SMT_SVX_CHANNEL (SVX_SERIAL_NO, CHANNEL_NUMBER),
constraint FK2_SMT_RESPONSE foreign key (RUN_NUMBER) references MONITOR_RUN
           (RUN_NUMBER) );

--   -----------------------------------------------------------------------------------
--
--   Part 2.3, SMT Detector Configuration Database Production
--
--   -----------------------------------------------------------------------------------

-- table SMT_VRB_CRATE

create table SMT_VRB_CRATE (
CRATE_ID                VARCHAR2(12),
CRATE_NAME              VARCHAR2(12) NOT NULL,
NUMBER_OF_VRBS          NUMBER(2) default 0
                        constraint CHK_NUMBER_OF_VBRS 
                        check (NUMBER_OF_VRBS >= 0),
STATUS                  VARCHAR2(100) default NULL, 
constraint PK_SMT_VRB_CRATE primary key (CRATE_ID) );

-- table SMT_SEQ_CRATE

create table SMT_SEQ_CRATE (
CRATE_ID                VARCHAR2(12),
CRATE_NAME              VARCHAR2(12) NOT NULL,
NUMBER_OF_SEQS          NUMBER(2) default 0
                        constraint CHK_NUMBER_OF_SEQS
                        check (NUMBER_OF_SEQS >= 0),
STATUS                  VARCHAR2(100) default NULL,
constraint PK_SMT_SEQ_CRATE primary key (CRATE_ID) );

-- table SMT_INT_CRATE

create table SMT_INT_CRATE (
CRATE_ID                VARCHAR2(12),
CRATE_NAME              VARCHAR2(12) NOT NULL,
NUMBER_OF_INTS          NUMBER(2) default 0
                        constraint CHK_NUMBER_OF_INTS
                        check (NUMBER_OF_INTS >= 0),
STATUS                  VARCHAR2(100) default NULL,
constraint PK_SMT_INT_CRATE primary key (CRATE_ID) );

-- table SMT_DAQ_VRBC

create table SMT_DAQ_VRBC (
VRBC_ID                 VARCHAR2(10),
CRATE_ID                VARCHAR2(12),
LOCATOR                 NUMBER(2) default 3
                        constraint CHK_VRBC_LOCATOR
                        check (LOCATOR >= 0),
VRBC_EPICS_LINK         VARCHAR2(17),
MODIFICATION_DATE       DATE default SYSDATE,
STATUS                  VARCHAR2(100) default NULL,
constraint PK_SMT_DAQ_VRBC primary key (VRBC_ID),
constraint FK_SMT_DAQ_VRBC 
           foreign key (CRATE_ID) references SMT_VRB_CRATE (CRATE_ID) );

-- table SMT_DAQ_SEQC

create table SMT_DAQ_SEQC (
SEQC_ID                 VARCHAR2(10),
CRATE_ID                VARCHAR2(12),
LOCATOR                 NUMBER(2) default 0
                        constraint CHK_SEQC_LOCATOR
                        check (LOCATOR >= 0),
SEQC_EPICS_LINK         VARCHAR2(17),
MODIFICATION_DATE       DATE default SYSDATE,
STATUS                  VARCHAR2(100) default NULL,
constraint PK_SMT_DAQ_SEQC primary key (SEQC_ID),
constraint FK_SMT_DAQ_SEQC 
           foreign key (CRATE_ID) references SMT_SEQ_CRATE (CRATE_ID) );

-- table SMT_DAQ_VBD

create table SMT_DAQ_VBD (
VBD_ID                  VARCHAR2(10),
CRATE_ID                VARCHAR2(12),
LOCATOR                 NUMBER(2) default 15
                        constraint CHK_VBD_LOCATOR 
                        check (LOCATOR >= 0),
VBD_EPICS_LINK          VARCHAR2(17),
MODIFICATION_DATE       DATE default SYSDATE,
STATUS                  VARCHAR2(100) default NULL,
constraint PK_SMT_DAQ_VBD primary key (VBD_ID),
constraint FK_SMT_DAQ_VBD 
           foreign key (CRATE_ID) references SMT_VRB_CRATE (CRATE_ID) );

-- table SMT_DAQ_INTERFACE

create table SMT_DAQ_INTERFACE (
INT_SERIAL_NO           VARCHAR2(12),
VERSION                 NUMBER(2),
INTERFACE_ID            VARCHAR2(6) default NULL,
CRATE_ID                VARCHAR2(12),
LOCATOR                 NUMBER(2) default 0
                        constraint CHK_INT_LOCATOR 
                        check (LOCATOR >= 0),
INT_EPICS_LINK          VARCHAR2(17) default NULL,
CABLE_FROM_SEQ1         VARCHAR2(10) default NULL,
CABLE_FROM_SEQ2         VARCHAR2(10) default NULL,
CABLE_FROM_SEQ3         VARCHAR2(10) default NULL,
CABLE_FROM_SEQ4         VARCHAR2(10) default NULL,
MODIFICATION_DATE       DATE default SYSDATE,
STATUS                  VARCHAR2(100) default NULL,
constraint PK_SMT_DAQ_INTERFACE primary key (INT_SERIAL_NO, VERSION),
constraint FK_SMT_DAQ_INTERFACE 
           foreign key (CRATE_ID) references SMT_INT_CRATE (CRATE_ID) );

-- table SMT_DAQ_SEQ

create table SMT_DAQ_SEQ (
SEQ_SERIAL_NO           VARCHAR2(10),
VERSION                 NUMBER(2),
SEQUENCER_ID            VARCHAR2(8),
CRATE_ID                VARCHAR2(12), 
LOCATOR                 NUMBER(2) default 2
                        constraint CHK_SEQ_LOCATOR
                        check (LOCATOR > 0),
INT_SERIAL_NO           VARCHAR2(12),
INT_VERSION             NUMBER(2),
SEQ_EPICS_LINK          VARCHAR2(17) default NULL,
CABLE_FROM_VRB1         VARCHAR2(10) default NULL,
CABLE_FROM_VRB2         VARCHAR2(10) default NULL,
CABLE_FROM_VRB3         VARCHAR2(10) default NULL,
CABLE_FROM_VRB4         VARCHAR2(10) default NULL,
CABLE_TO_INT1           VARCHAR2(10) default NULL,
CABLE_TO_INT2           VARCHAR2(10) default NULL,
CABLE_TO_INT3           VARCHAR2(10) default NULL,
CABLE_TO_INT4           VARCHAR2(10) default NULL,
MODIFICATION_DATE       DATE default SYSDATE,
STATUS                  VARCHAR2(100) default NULL,
constraint PK_SMT_DAQ_SEQ primary key (SEQ_SERIAL_NO, VERSION),
constraint FK1_SMT_DAQ_SEQ 
           foreign key (CRATE_ID) references SMT_SEQ_CRATE (CRATE_ID),
constraint FK2_SMT_DAQ_SEQ 
           foreign key (INT_SERIAL_NO, INT_VERSION) references 
           SMT_DAQ_INTERFACE (INT_SERIAL_NO, VERSION) );

-- table SMT_DAQ_VRB

create table SMT_DAQ_VRB (
VRB_SERIAL_NO           VARCHAR2(10),
VERSION                 NUMBER(2),
VRB_ID                  VARCHAR2(6) default NULL,
CRATE_ID                VARCHAR2(12),
LOCATOR                 NUMBER(2) default 0
                        constraint CHK_VRB_LOCATOR
                        check (LOCATOR >= 0),
SEQ_SERIAL_NO           VARCHAR2(10) default NULL,
SEQ_VERSION             NUMBER(2),
VRB_EPICS_LINK          VARCHAR2(17),
CABLE_TO_SEQ1           VARCHAR2(10) default NULL,
CABLE_TO_SEQ2           VARCHAR2(10) default NULL,
CABLE_TO_SEQ3           VARCHAR2(10) default NULL,
CABLE_TO_SEQ4           VARCHAR2(10) default NULL,
MODIFICATION_DATE       DATE default SYSDATE,
STATUS                  VARCHAR2(100) default NULL,
constraint PK_SMT_DAQ_VRB primary key (VRB_SERIAL_NO, VERSION),
constraint FK1_SMT_DAQ_VRB 
           foreign key (CRATE_ID) references SMT_VRB_CRATE (CRATE_ID),
constraint FK2_SMT_DAQ_VRB 
           foreign key (SEQ_SERIAL_NO, SEQ_VERSION) references SMT_DAQ_SEQ (SEQ_SERIAL_NO, VERSION) );

-- table SMT_DAQ_HDI

create table SMT_DAQ_HDI (
HDI_SERIAL_NO           VARCHAR2(10),
VERSION                 NUMBER(2),
INT_SERIAL_NO           VARCHAR2(12),
INT_VERSION             NUMBER(2),
HDI_TYPE                VARCHAR2(3) default 'R30',
LOCATOR                 VARCHAR2(1) default 'A'
                        constraint CHK_HDI_LOCATOR
                        check (LOCATOR in ('A', 'B')),
BARREL$SECTOR           NUMBER(2) default 0,
LAYER$DISK              NUMBER(2) default 0,
LADDER$WEDGE            NUMBER(2) default 0,
NUMBER_OF_SVX_CHIP      NUMBER(2) default 3
                        constraint CHK_NUMBER_OF_SVX_CHIP
                        check (NUMBER_OF_SVX_CHIP >= 0 and NUMBER_OF_SVX_CHIP <= 9),
HDI_VIEW                VARCHAR2(5),
MODIFICATION_DATE       DATE default SYSDATE,
STATUS                  VARCHAR2(100) default NULL, 
constraint PK_SMT_DAQ_HDI primary key (HDI_SERIAL_NO, VERSION, INT_SERIAL_NO, INT_VERSION),
constraint FK_SMT_DAQ_HDI 
           foreign key (INT_SERIAL_NO, INT_VERSION) references 
           SMT_DAQ_INTERFACE (INT_SERIAL_NO, VERSION) );

-- table SMT_DAQ_CHIP

create table SMT_DAQ_CHIP (
SVX_SERIAL_NO           VARCHAR2(13), 
VERSION                 NUMBER(2),
HDI_SERIAL_NO           VARCHAR2(10),
HDI_VERSION             NUMBER(2),
INT_SERIAL_NO           VARCHAR2(12),
INT_VERSION             NUMBER(2),
CHIP_ID                 VARCHAR2(7) default '0000000',
ADC_MAX                 VARCHAR2(8) default '10000001'
                        constraint CHK_ADC_MAX
                        check (TO_NUMBER(ADC_MAX) >= 0 and TO_NUMBER(ADC_MAX) <= 11111111),
RAMP_TRIM               VARCHAR2(11) default '01000000000'
                        constraint CHK_RAMP_TRIM
                        check (TO_NUMBER(RAMP_TRIM) >= 0 and TO_NUMBER(RAMP_TRIM) <= 11111111111),
LAST_CHIP               VARCHAR2(1) default '1'
                        constraint CHK_LAST_CHIP
                        check (TO_NUMBER(LAST_CHIP) >= 0 and TO_NUMBER(LAST_CHIP) <= 1),
READ_NEIGHBOR           VARCHAR2(1) default '1'
                        constraint CHK_READ_NEIGHBOR
                        check (TO_NUMBER(READ_NEIGHBOR) >= 0 and TO_NUMBER(READ_NEIGHBOR) <= 1),
READ_ALL                VARCHAR2(1) default '0'
                        constraint CHK_READ_ALL
                        check (TO_NUMBER(READ_ALL) >= 0 and TO_NUMBER(READ_ALL) <= 1),
POLARITY                VARCHAR2(1) default '1'
                        constraint CHK_POLARITY
                        check (TO_NUMBER(POLARITY) >= 0 and TO_NUMBER(POLARITY) <= 1),
PIPELINE                VARCHAR2(5) default '00010'
                        constraint CHK_PIPELINE
                        check (TO_NUMBER(PIPELINE) >= 0 and TO_NUMBER(PIPELINE) <= 11111),
PREAMP_BAND             VARCHAR2(6) default '010000'
                        constraint CHK_PREAMP_BAND
                        check (TO_NUMBER(PREAMP_BAND) >= 0 and TO_NUMBER(PREAMP_BAND) <= 111111),
THRESHOLD               VARCHAR2(8) default '00010100',
                        constraint CHK_THRESHOLD
                        check (TO_NUMBER(THRESHOLD) >= 0 and TO_NUMBER(THRESHOLD) <= 11111111),
AVDD                    NUMBER(4,2) default 5.00 
                        constraint CHK_AVDD
                        check (AVDD > 0.00 and AVDD <= 5.50),
AVDD2                   NUMBER(4,2) default 3.50
                        constraint CHK_AVDD2 
                        check (AVDD2 > 0.00 and AVDD2 <= 4.50),
DVDD                    NUMBER(4,2) default 4.95 
                        constraint CHK_DVDD
                        check (DVDD > 0.00 and DVDD <= 5.50),
V_DEPLETION             NUMBER(5,2) default 40.00
                        constraint V_DEPLETION
                        check (V_DEPLETION > 0.00 and V_DEPLETION <= 100.00),
MODIFICATION_DATE       DATE default SYSDATE,
STATUS                  VARCHAR2(100) default NULL,
constraint PK_SMT_DAQ_CHIP 
           primary key (SVX_SERIAL_NO, VERSION, HDI_SERIAL_NO, HDI_VERSION, INT_SERIAL_NO, INT_VERSION),
constraint FK1_SMT_DAQ_CHIP
           foreign key (SVX_SERIAL_NO) references SMT_SVX_CHIP (SVX_SERIAL_NO),
constraint FK2_SMT_DAQ_CHIP
           foreign key (HDI_SERIAL_NO, HDI_VERSION, INT_SERIAL_NO, INT_VERSION) 
           references SMT_DAQ_HDI (HDI_SERIAL_NO, VERSION, INT_SERIAL_NO, INT_VERSION) );

-- End Of The Script                              
                         