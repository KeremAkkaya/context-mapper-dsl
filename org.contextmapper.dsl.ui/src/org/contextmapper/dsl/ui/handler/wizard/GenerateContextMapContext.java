/*
 * Copyright 2019 The Context Mapper Project Team
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
package org.contextmapper.dsl.ui.handler.wizard;

import java.util.Set;

import org.contextmapper.dsl.generator.contextmap.ContextMapFormat;

public class GenerateContextMapContext {

	private Set<ContextMapFormat> formats;
	private int labelSpacingFactor;
	private boolean fixWidth;
	private boolean fixHeight;
	private int width;
	private int height;
	private boolean generateAdditionalLabels;

	public void setFormats(Set<ContextMapFormat> formats) {
		this.formats = formats;
	}

	public Set<ContextMapFormat> getFormats() {
		return formats;
	}

	public void setLabelSpacingFactor(int labelSpacingFactor) {
		this.labelSpacingFactor = labelSpacingFactor;
	}

	public int getLabelSpacingFactor() {
		return labelSpacingFactor;
	}

	public boolean isFixWidth() {
		return fixWidth;
	}

	public boolean isFixHeight() {
		return fixHeight;
	}

	public void setFixWidth(boolean fixWidth) {
		this.fixWidth = fixWidth;
	}

	public void setFixHeight(boolean fixHeight) {
		this.fixHeight = fixHeight;
	}

	public int getWidth() {
		return width;
	}

	public void setWidth(int width) {
		this.width = width;
	}

	public int getHeight() {
		return height;
	}

	public void setHeight(int height) {
		this.height = height;
	}

	public void setGenerateAdditionalLabels(boolean generateAdditionalLabels) {
		this.generateAdditionalLabels = generateAdditionalLabels;
	}

	public boolean generateAdditionalLabels() {
		return generateAdditionalLabels;
	}

}
