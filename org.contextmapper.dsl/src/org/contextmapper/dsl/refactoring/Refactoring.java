/*
 * Copyright 2018 The Context Mapper Project Team
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *    http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */
package org.contextmapper.dsl.refactoring;

import org.contextmapper.dsl.cml.CMLResourceContainer;
import org.eclipse.emf.ecore.resource.ResourceSet;

public interface Refactoring {

	/**
	 * Applies the refactoring to the CML model in the given resource.
	 * 
	 * @param resource the resource with the CML model that shall be refactored
	 */
	void doRefactor(CMLResourceContainer resource);

	/**
	 * 
	 * Applies the refactoring to the CML model in the given resource. Additionally
	 * ensures consistency in Context Maps in all resources of the additional
	 * ResourceSet.
	 * 
	 * @param resource                  the resource with the CML model that shall
	 *                                  be refactored.
	 * @param consistencyCheckResources the resources that contain Context Maps
	 *                                  which potentially have to be corrected after
	 *                                  refactoring
	 */
	void doRefactor(CMLResourceContainer resource, ResourceSet consistencyCheckResources);

}
