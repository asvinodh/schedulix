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


package de.independit.scheduler.server.repository;

import de.independit.scheduler.server.*;
import de.independit.scheduler.server.util.*;
import de.independit.scheduler.server.exception.*;
import de.independit.scheduler.server.output.*;
import de.independit.scheduler.server.parser.*;

public interface SDMSSysResource
{

	public void setAmount(SystemEnvironment sysEnv, Integer amount)
		throws SDMSException;

	public void setFreeAmount(SystemEnvironment sysEnv, Integer amount)
		throws SDMSException;

	public void setManagerId(SystemEnvironment sysEnv, Long managerId)
		throws SDMSException;

	public void releaseAmount(SystemEnvironment sysEnv, int raAmount)
		throws SDMSException;

	public Integer getAmount(SystemEnvironment sysEnv)
		throws SDMSException;

	public Integer getFreeAmount(SystemEnvironment sysEnv)
		throws SDMSException;

	public Integer getTotalFreeAmount(SystemEnvironment sysEnv)
		throws SDMSException;

	public Long getManagerId(SystemEnvironment sysEnv)
		throws SDMSException;

	public String getURL(SystemEnvironment sysEnv)
		throws SDMSException;

	public Long getNrId(SystemEnvironment sysEnv)
		throws SDMSException;

	public Long getScopeId(SystemEnvironment sysEnv)
		throws SDMSException;
}
