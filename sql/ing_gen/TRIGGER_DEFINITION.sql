/*
Copyright (c) 2000-2013 "independIT Integrative Technologies GmbH",
Authors: Ronald Jeninga, Dieter Stubler

schedulix Enterprise Job Scheduling System

independIT Integrative Technologies GmbH [http://www.independit.de]
mailto:contact@independit.de

This file is part of schedulix

schedulix is free software: 
you can redistribute it and/or modify it under the terms of the 
GNU Affero General Public License as published by the 
Free Software Foundation, either version 3 of the License, 
or (at your option) any later version.

This program is distributed in the hope that it will be useful,
but WITHOUT ANY WARRANTY; without even the implied warranty of
MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
GNU Affero General Public License for more details.

You should have received a copy of the GNU Affero General Public License
along with this program. If not, see <http://www.gnu.org/licenses/>.
*/
-- Copyright (C) 2001,2002 topIT Informationstechnologie GmbH
-- Copyright (C) 2003-2014 independIT Integrative Technologies GmbH

CREATE TABLE TRIGGER_DEFINITION (
    ID                             DECIMAL(20) NOT NULL
    , NAME                           varchar(64)     NOT NULL
    , FIRE_ID                        decimal(20)     NOT NULL
    , OBJECT_TYPE                    integer         NOT NULL
    , SE_ID                          decimal(20)     NOT NULL
    , MAIN_SE_ID                     decimal(20)     WITH NULL
    , PARENT_SE_ID                   decimal(20)     WITH NULL
    , IS_ACTIVE                      integer         NOT NULL
    , ACTION                         integer         NOT NULL
    , TYPE                           integer         NOT NULL
    , IS_MASTER                      integer         NOT NULL
    , IS_SUSPEND                     integer         NOT NULL
    , IS_CREATE                      integer         WITH NULL
    , IS_CHANGE                      integer         WITH NULL
    , IS_DELETE                      integer         WITH NULL
    , IS_GROUP                       integer         WITH NULL
    , RESUME_AT                      varchar(20)     WITH NULL
    , RESUME_IN                      integer         WITH NULL
    , RESUME_BASE                    integer         WITH NULL
    , IS_WARN_ON_LIMIT               integer         NOT NULL
    , MAX_RETRY                      integer         NOT NULL
    , SUBMIT_OWNER_ID                decimal(20)     WITH NULL
    , CONDITION                      varchar(1024)   WITH NULL
    , CHECK_AMOUNT                   integer         WITH NULL
    , CHECK_BASE                     integer         WITH NULL
    , CREATOR_U_ID                   decimal(20)     NOT NULL
    , CREATE_TS                      decimal(20)     NOT NULL
    , CHANGER_U_ID                   decimal(20)     NOT NULL
    , CHANGE_TS                      decimal(20)     NOT NULL
    , VALID_FROM                   DECIMAL(20) NOT NULL
    , VALID_TO                     DECIMAL(20) NOT NULL
);\g
CREATE INDEX PK_TRIGGER_DEFINITION
ON TRIGGER_DEFINITION(ID) WITH STRUCTURE = BTREE;\g
CREATE VIEW SCI_C_TRIGGER_DEFINITION AS
SELECT
    ID
    , NAME                           AS NAME
    , FIRE_ID                        AS FIRE_ID
    , CASE OBJECT_TYPE WHEN 0 THEN 'JOB_DEFINITION' WHEN 1 THEN 'RESOURCE' WHEN 2 THEN 'NAMED_RESOURCE' WHEN 3 THEN 'OBJECT_MONITOR' END AS OBJECT_TYPE
    , SE_ID                          AS SE_ID
    , MAIN_SE_ID                     AS MAIN_SE_ID
    , PARENT_SE_ID                   AS PARENT_SE_ID
    , CASE IS_ACTIVE WHEN 1 THEN 'TRUE' WHEN 0 THEN 'FALSE' END AS IS_ACTIVE
    , CASE ACTION WHEN 0 THEN 'SUBMIT' WHEN 1 THEN 'RERUN' END AS ACTION
    , CASE TYPE WHEN 0 THEN 'IMMEDIATE_LOCAL' WHEN 2 THEN 'BEFORE_FINAL' WHEN 3 THEN 'AFTER_FINAL' WHEN 1 THEN 'IMMEDIATE_MERGE' WHEN 4 THEN 'FINISH_CHILD' WHEN 5 THEN 'UNTIL_FINISHED' WHEN 6 THEN 'UNTIL_FINAL' WHEN 7 THEN 'WARNING' END AS TYPE
    , CASE IS_MASTER WHEN 1 THEN 'MASTER' WHEN 0 THEN 'NOMASTER' END AS IS_MASTER
    , CASE IS_SUSPEND WHEN 1 THEN 'SUSPEND' WHEN 0 THEN 'NOSUSPEND' END AS IS_SUSPEND
    , CASE IS_CREATE WHEN 1 THEN 'TRUE' WHEN 0 THEN 'FALSE' END AS IS_CREATE
    , CASE IS_CHANGE WHEN 1 THEN 'TRUE' WHEN 0 THEN 'FALSE' END AS IS_CHANGE
    , CASE IS_DELETE WHEN 1 THEN 'TRUE' WHEN 0 THEN 'FALSE' END AS IS_DELETE
    , CASE IS_GROUP WHEN 1 THEN 'TRUE' WHEN 0 THEN 'FALSE' END AS IS_GROUP
    , RESUME_AT                      AS RESUME_AT
    , RESUME_IN                      AS RESUME_IN
    , CASE RESUME_BASE WHEN 0 THEN 'MINUTE' WHEN 1 THEN 'HOUR' WHEN 2 THEN 'DAY' WHEN 3 THEN 'WEEK' WHEN 4 THEN 'MONTH' WHEN 5 THEN 'YEAR' END AS RESUME_BASE
    , CASE IS_WARN_ON_LIMIT WHEN 1 THEN 'TRUE' WHEN 0 THEN 'FALSE' END AS IS_WARN_ON_LIMIT
    , MAX_RETRY                      AS MAX_RETRY
    , SUBMIT_OWNER_ID                AS SUBMIT_OWNER_ID
    , CONDITION                      AS CONDITION
    , CHECK_AMOUNT                   AS CHECK_AMOUNT
    , CASE CHECK_BASE WHEN 0 THEN 'MINUTE' WHEN 1 THEN 'HOUR' WHEN 2 THEN 'DAY' WHEN 3 THEN 'WEEK' WHEN 4 THEN 'MONTH' WHEN 5 THEN 'YEAR' END AS CHECK_BASE
    , CREATOR_U_ID                   AS CREATOR_U_ID
    , '01-JAN-1970 00:00:00 GMT' + date(char(decimal((CREATE_TS- decimal(CREATE_TS/1125899906842624, 18, 0)*1125899906842624)/1000, 18, 0)) + ' secs') AS CREATE_TS
    , CHANGER_U_ID                   AS CHANGER_U_ID
    , '01-JAN-1970 00:00:00 GMT' + date(char(decimal((CHANGE_TS- decimal(CHANGE_TS/1125899906842624, 18, 0)*1125899906842624)/1000, 18, 0)) + ' secs') AS CHANGE_TS
  FROM TRIGGER_DEFINITION
 WHERE VALID_TO = 9223372036854775807;\g
CREATE VIEW SCI_V_TRIGGER_DEFINITION AS
SELECT
    ID
    , NAME                           AS NAME
    , FIRE_ID                        AS FIRE_ID
    , CASE OBJECT_TYPE WHEN 0 THEN 'JOB_DEFINITION' WHEN 1 THEN 'RESOURCE' WHEN 2 THEN 'NAMED_RESOURCE' WHEN 3 THEN 'OBJECT_MONITOR' END AS OBJECT_TYPE
    , SE_ID                          AS SE_ID
    , MAIN_SE_ID                     AS MAIN_SE_ID
    , PARENT_SE_ID                   AS PARENT_SE_ID
    , CASE IS_ACTIVE WHEN 1 THEN 'TRUE' WHEN 0 THEN 'FALSE' END AS IS_ACTIVE
    , CASE ACTION WHEN 0 THEN 'SUBMIT' WHEN 1 THEN 'RERUN' END AS ACTION
    , CASE TYPE WHEN 0 THEN 'IMMEDIATE_LOCAL' WHEN 2 THEN 'BEFORE_FINAL' WHEN 3 THEN 'AFTER_FINAL' WHEN 1 THEN 'IMMEDIATE_MERGE' WHEN 4 THEN 'FINISH_CHILD' WHEN 5 THEN 'UNTIL_FINISHED' WHEN 6 THEN 'UNTIL_FINAL' WHEN 7 THEN 'WARNING' END AS TYPE
    , CASE IS_MASTER WHEN 1 THEN 'MASTER' WHEN 0 THEN 'NOMASTER' END AS IS_MASTER
    , CASE IS_SUSPEND WHEN 1 THEN 'SUSPEND' WHEN 0 THEN 'NOSUSPEND' END AS IS_SUSPEND
    , CASE IS_CREATE WHEN 1 THEN 'TRUE' WHEN 0 THEN 'FALSE' END AS IS_CREATE
    , CASE IS_CHANGE WHEN 1 THEN 'TRUE' WHEN 0 THEN 'FALSE' END AS IS_CHANGE
    , CASE IS_DELETE WHEN 1 THEN 'TRUE' WHEN 0 THEN 'FALSE' END AS IS_DELETE
    , CASE IS_GROUP WHEN 1 THEN 'TRUE' WHEN 0 THEN 'FALSE' END AS IS_GROUP
    , RESUME_AT                      AS RESUME_AT
    , RESUME_IN                      AS RESUME_IN
    , CASE RESUME_BASE WHEN 0 THEN 'MINUTE' WHEN 1 THEN 'HOUR' WHEN 2 THEN 'DAY' WHEN 3 THEN 'WEEK' WHEN 4 THEN 'MONTH' WHEN 5 THEN 'YEAR' END AS RESUME_BASE
    , CASE IS_WARN_ON_LIMIT WHEN 1 THEN 'TRUE' WHEN 0 THEN 'FALSE' END AS IS_WARN_ON_LIMIT
    , MAX_RETRY                      AS MAX_RETRY
    , SUBMIT_OWNER_ID                AS SUBMIT_OWNER_ID
    , CONDITION                      AS CONDITION
    , CHECK_AMOUNT                   AS CHECK_AMOUNT
    , CASE CHECK_BASE WHEN 0 THEN 'MINUTE' WHEN 1 THEN 'HOUR' WHEN 2 THEN 'DAY' WHEN 3 THEN 'WEEK' WHEN 4 THEN 'MONTH' WHEN 5 THEN 'YEAR' END AS CHECK_BASE
    , CREATOR_U_ID                   AS CREATOR_U_ID
    , '01-JAN-1970 00:00:00 GMT' + date(char(decimal((CREATE_TS- decimal(CREATE_TS/1125899906842624, 18, 0)*1125899906842624)/1000, 18, 0)) + ' secs') AS CREATE_TS
    , CHANGER_U_ID                   AS CHANGER_U_ID
    , '01-JAN-1970 00:00:00 GMT' + date(char(decimal((CHANGE_TS- decimal(CHANGE_TS/1125899906842624, 18, 0)*1125899906842624)/1000, 18, 0)) + ' secs') AS CHANGE_TS
    , VALID_FROM
    , VALID_TO
  FROM TRIGGER_DEFINITION;\g
