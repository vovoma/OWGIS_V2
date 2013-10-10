<script type="text/javascript"  >
	var width;
	var height;
	var currPopupText;//Text of the the popup

	// TODO verify how this variable works for other layers and see
	// from where we can obtain the current elevation.
	var elevation = 0;

	//Should contain the selected start date and is used to obtain punctual
	// data from the temporal data.
	var startDate;

	//Creates 100 layer objects
	for (var i = 0; i < 100; i++) {
		eval("var layer" + i);
	}

	function initOl3() {
		
		<jsp:include page="../common/JS/mapDisplay/Popup.js" />
			
		var bounds = mapConfig.mapBounds;
		var extent = mapConfig.restrictedExtent;
		var maxRes = mapConfig.maxResolution;
		var minRes = mapConfig.minResolution;
		//extent
		var zoomLevels = mapConfig.numZoomLevels;
		
		//This openLayerConfig is generated by the java file OpenLayersManager.java 
		//it loads all the layers that are needed for the map. 
		
		//var gulfMexLatLon = ol.proj.transform([-89, 25], 'EPSG:4326', 'EPSG:3857');
		var gulfMexLatLon = [-89, 25];
		ol3view = new ol.View2D({
                projection: 'EPSG:4326',
                center: gulfMexLatLon,
                zoom: 4
                });
		
		/**
		 * Create the map.
		 */
		map = new ol.Map({
			overlays: [ol_popup], //Overlay used for popup
			target: 'map', // Define 'div' that contains the map
			view: ol3view
		});
		
		
	${openLayerConfig}
		}
</script>