<section class="container-fluid topMenu">
	<div class="row">
		<!--Logo OWGIS-->
		<span class="col-lg-1 visible-lg " >
			<a href="http://owgis.org" target="_blank">
				<img border="0" src="./common/images/Logos/owgis.png" alt="OWGIS" height="20"  />
			</a>
		</span>
		<!--This are always available-->
		<ul class="horizontal col-lg-4 col-md-6 col-sm-7 text-right " style="margin-bottom: 0px">
			<li class="buttonStyle toolTip" title="<fmt:message key='help.tooltip.googleE'/>"> 
				<%@include file="../../../Options/KmlLink.jsp" %>
			</li>
			<!-- Transparency -->
			<li class="buttonLook toolTip" id="transParent" title="<fmt:message key='help.tooltip.transparency'/>">
				<%@include file="../../../Options/Transparency.jsp" %>
			</li>
			<!-- Depth or elevation-->
			<li class="buttonContainer menuHidden toolTip" id="elevationParent" title="<fmt:message key='help.tooltip.depthElevation'/>" >
				<%@include file="../../../Options/Elevation.jsp" %>
			</li>
		</ul>
			
		<!--This whole ul is used for the 'large' size-->
		<ul class="horizontal col-lg-6 text-left visible-lg " style="margin-bottom: 0px">
			<!--Options to manipulate the style of currents-->
			<c:if test='${currents}'>
				<li class="buttonStyle menuHidden toolTip currentsParent" 
					title="<fmt:message key='ncwms.streamlines.help.streamlines'/>"
					onclick="owgis.ncwms.currents.style.togglestyling();owgis.layouts.draggable.topmenu.toogleUse('.currentsParent');">
					<fmt:message key='ncwms.streamlines.streamlines'/>
				</li>
			</c:if>
			<c:if test='${ncwms}'>
				<!-- Palettes -->
				<li class="buttonStyle menuHidden toolTip palettesMenuParent" 
					title="<fmt:message key='help.tooltip.palettes'/>"
					onclick="showPalettes();owgis.layouts.draggable.topmenu.toogleUse('.palettesMenuParent');">
				<fmt:message key="ncwms.pal" />
				</li>
				<!-- Transect tool-->
				<li class="buttonStyle menuHidden toolTip lineToggle" 
					title="<fmt:message key='help.tooltip.transect'/>"
					onclick="toggleControl(this,'below');owgis.layouts.draggable.topmenu.toogleUse('.lineToggle');" >
				<fmt:message key="ncwms.transect" />
				</li>
			</c:if>
			<c:if test='${!ncwms}'>
				<!-- Download data-->
				<li class="buttonStyle menuHidden toolTip downloadDataParent" 
					title="<fmt:message key='help.tooltip.download'/>"
					onclick="downloadData();"  >
				<fmt:message key="main.download" />
				</li>
			</c:if>
			<!-- Reset view -->
			<li class="buttonStyle toolTip resetParent" 
				title="<fmt:message key='help.tooltip.resetview'/>" >
				<span id="resetText" onclick="resetView();" />
			<fmt:message key="main.resetView" />
			</span>
			</li>
			<!-- Map Instructions-->
			<li class="buttonStyle toolTip helpParent" 
				title="<fmt:message key='help.tooltip.help'/>" id="helpText"
				onclick="owgis.help.main.displayHelp();owgis.layouts.draggable.topmenu.toogleUse('.helpParent');" >
				<fmt:message key="main.help" />
			</li>
			<!-- Toogle tooltip -->
			<li class="buttonStyle menuHidden toolTip helpHoverSpan" 
				title="<fmt:message key='help.helpicon'/>"	
				onclick="owgis.help.tooltips.toggleTooltips();owgis.layouts.draggable.topmenu.toogleUse('.helpHoverSpan');" >
				<span class="glyphicon glyphicon-question-sign"> </span>
			</li>
			<!-- Toogle Cesium -->
			<li class="buttonStyle menuHidden toolTip cesiumSpan" 
				title="Cesium"	
				onclick="owgis.cesium.toogleCesium();owgis.layouts.draggable.topmenu.toogleUse('.cesiumSpan');" >
				<span class="glyphicon glyphicon-globe"> </span>
			</li>
		</ul>
		
		<!--This whole ul is used for the 'smaller ' sizes-->
		<ul class="horizontal col-md-4 col-sm-5 text-left hidden-lg " style="margin-bottom: 0px">
			<!--Options to manipulate the style of currents-->
			<c:if test='${currents}'>
				<li class="buttonStyle menuHidden toolTip currentsParent" 
					title="<fmt:message key='ncwms.streamlines.streamlines'/>"
					onclick="owgis.ncwms.currents.style.togglestyling();owgis.layouts.draggable.topmenu.toogleUse('.currentsParent');">
					<span class="glyphicon glyphicon-random"> </span>
				</li>
			</c:if>
			<c:if test='${ncwms}'>
				<!-- Palettes Minimized-->
				<li class="buttonStyle menuHidden toolTip palettesMenuParent" 
					title="<fmt:message key='help.tooltip.palettes'/>"
					onclick="showPalettes();owgis.layouts.draggable.topmenu.toogleUse('.palettesMenuParent');">
					<span class="glyphicon glyphicon-picture"> </span>
				</li>
				<!-- Transect tool minimized-->
				<li class="buttonStyle menuHidden toolTip lineToggle" 
					title="<fmt:message key='help.tooltip.transect'/>"
					onclick="toggleControl(this,'below'); owgis.layouts.draggable.topmenu.toogleUse('.lineToggle');" >
					<span class="glyphicon glyphicon-signal"> </span>
				</li>
			</c:if>
			<c:if test='${!ncwms}'>
				<!-- Download minimized -->
				<li class="buttonStyle menuHidden toolTip downloadDataParent" 
					title="<fmt:message key='help.tooltip.download'/>"
					onclick="downloadData();"  >
					<span class="glyphicon glyphicon-download-alt"> </span>
				</li>
			</c:if>
			<!-- Reset view minimized -->
			<li class="buttonStyle toolTip resetParent" 
				title="<fmt:message key='help.tooltip.resetview'/>" 
				onclick="resetView();" >
				<span id="resetText" class="glyphicon glyphicon-refresh"> </span>
			</li>
			<!-- Map Instructions minimized-->
			<li class="buttonStyle toolTip helpParent" 
				title="<fmt:message key='help.tooltip.help'/>" id="helpText"
				onclick="owgis.help.main.displayHelp();owgis.layouts.draggable.topmenu.toogleUse('.helpParent');" >
				<span id="helpText" class="glyphicon glyphicon-info-sign"> </span>
			</li>

			<!-- Toogle tooltip Minimized-->
			<li class="buttonStyle menuHidden toolTip helpHoverSpan" 
				title="<fmt:message key='help.helpicon'/>"	
				onclick="owgis.help.tooltips.toggleTooltips();owgis.layouts.draggable.topmenu.toogleUse('.helpHoverSpan');" >
				<span class="glyphicon glyphicon-question-sign "> </span>
			</li>

			<!-- Toogle Cesium Minimized-->
			<li class="buttonStyle menuHidden toolTip cesiumSpan" 
				title="Cesium"	
				onclick="owgis.cesium.toogleCesium();owgis.layouts.draggable.topmenu.toogleUse('.cesiumSpan');" >
				<span class="glyphicon glyphicon-globe"> </span>
			</li>
		</ul>
			
		<!--Languages and tooltip help button-->
		<div class="col-lg-1 col-md-2 text-left visible-lg visible-md " >
			<div class="btn-group col-lg-10 col-md-7 col-md-offset-1 hidden-sm hidden-xs ">
				<button id="selectedLanguage" type="button" 
						class="btn btn-default dropdown-toggle" data-toggle="dropdown">
					<!--It gets initialized by languages.js-->
				</button>
				<ul id="langDropDown" class="dropdown-menu" role="menu">
					<!--It gets initialized by languages.js-->
				</ul>
			</div>
			<!--<a class="btn btn-default btn-xs " href="./admin/index.jsp" id="adminConsole"> Admin </a>-->
		</div>
	</div> <!--row-->
	
</section>