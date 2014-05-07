goog.provide('owgis.utils');

/**
 * This function receives a 'map' of key values 
 * that represent url parameters and returns
 * the corresponding string "par1=val1&par2=val2&..."
 * @param params - parameter list to add to url
 * @return urlstr - returns the url containing key and value pair. 
 */
owgis.utils.paramsToUrl = function(params){
	urlstr = '';
	for (var key in params) {
		urlstr += key+"="+ params[key] +"&";
	}
	return urlstr;
};

/**
 * This function is used to replace parameters on a link. 
 * For example on link  http://server?param1=val&parm2=val2 we use this
 * function to replace any parameter
 * @param name - link
 * @param param - parameter to replace
 * @param newval - new value to replace with
 */
owgis.utils.replaceGetParamInLink = function(name, param, newval){
	// Updates the kml link to download the main data 
	link = $(name).attr("href");

	paramPos = link.lastIndexOf(param);

	//In this case the parameter doesn't exist previously so we just add the parameter
	if(paramPos === -1){
		newLink =  link+"&"+param+"="+newval;
		$(name).attr("href",newLink) ;
	}
	else{//In this case we replace the value of the parameter
		firstPart = link.slice(0,paramPos);
		secondPart = link.slice(paramPos, link.length);

		//Remove the old parameter argument
		paramEndPos = secondPart.indexOf("&");

		if(paramEndPos === -1){//In this case there are not more parameters
			secondPart = "";
		}else{
			secondPart = secondPart.slice(paramEndPos, secondPart.length);
		}

		newLink = firstPart+param+"="+newval+secondPart;
		$(name).attr("href",newLink) ;
	}
};

/**
 *open new window
 *@param url - page to display in new window
 *@param width - width of new window
 *@param height - height of new window
 *@return false - it returns false to exit the function. 
 */
owgis.utils.popItUp = function(url, width, height ) {
	newwindow=window.open(url,'','height='+height+',width='+width);
	if (window.focus) {
		newwindow.focus();
	}
	return false;
};

/**
 *Get minimum value
 *@param value1 - first value
 *@param value2 - second value
 *@return value - returns smaller value
 */
owgis.utils.minimo = function(value1,value2){
	if(value1<value2)
		return value1;
	else
		return value2;
};

/**
 *Check to see if value passed in is numeric type
 *@param val - value of string to check
 *@return true or false depending if value is numeric or not
 */
owgis.utils.IsNumeric = function(val) {

	if (isNaN(parseFloat(val))) {
		return false;
	}

	return true;
};

/**
 * Assigns to the object 'img' the img_src text as an image
@param img - image name to attach source to
@param img_src - image source link

 * */

owgis.utils.rollImageBtn = function(img, img_src){
	img.style.backgroundImage = img_src;
};

/**
 * Assigns to the object 'img' the img_src text as an image
 * @param img - imaged to attach src
 * @param img_src - src link
 */
owgis.utils.rollImage = function(img, img_src){
	img.src = img_src;
};

/**This function changes the styel of the current id with the specified mode
 *@param id - id to change of css
 *@param mode - case of switch statment. case 1 is black, 2 is white. 
 */
owgis.utils.changeShadow = function(id, mode){
	switch(mode){
		case 1:
			id.style.color = 'black';
			id.style.textShadow= "0px -1px 5px #eeeeee,\n\
								  0px  1px 5px #eeeeee,\n\
								 -1px  0px 5px #eeeeee,\n\
								 1px  0px 5px #eeeeee,\n\
								 -1px -1px 5px #eeeeee,\n\
								 -1px  1px 5px #eeeeee,\n\
								 1px -1px 5px #eeeeee,\n\
								 1px  1px 5px #eeeeee";
			id.style.cursor = 'pointer';
			break;
		case 2:
			id.style.color = 'white';
			id.style.textShadow= "0px -1px 5px #000000,\n\
								  0px  1px 5px #000000,\n\
								 -1px  0px 5px #000000,\n\
								 1px  0px 5px #000000,\n\
								 -1px -1px 5px #000000,\n\
								 -1px  1px 5px #000000,\n\
								 1px -1px 5px #000000,\n\
								 1px  1px 5px #000000";
			id.style.cursor = 'pointer';
			break;
	}
};

/**this functions opens up the url passed in
 *@param url - link to new page
 *@param width - width of new window
 *@param height - height of new window
 */
owgis.utils.popUp = function(url, width, height)
{
	var day = new Date();
	var id = day.getTime();
    
	//pass in the url to open, the rest of the parameters are just options on the new window that will open.
	window.open(url, id, 'toolbar=0,scrollbars=0,location=0,statusbar=0,menubar=0,resizable=1,width='
		+ width + ',height=' + height + ',left = 300,top = 300');
};

/**pass a number and if padding is needed then add 0. 
 *Example: pass 1 return 01
 *Example: pass 15 return 15. 
 *@param number - number to pad
 */
owgis.utils.pad = function(number) {  
	if(number < 10 && String(number).substr(0,1) === '0')
	{
		return number;
	}
    
	return (number < 10 ? '0' : '') + number;
};

/*
 * Gets the day on a specified format like:
 * format = %Y-m-d
 * @param formato - format of date. %Y for just year. 
 * @return date string depeinding on format passed in. 
 */ 
owgis.utils.getDate = function(formato)
{   
	var hoy = new Date();
	var numDia = hoy.getDate();
	var numMes = hoy.getMonth() + 1;
	var anio = hoy.getFullYear();       
	var meses = new Array (
		'',
		'Enero', 
		'Febrero', 
		'Marzo', 
		'Abril', 
		'Mayo',
		'Junio',
		'Julio',
		'Agosto',
		'Septiembre',
		'Octubre',
		'Noviembre',
		'Diciembre'
		);
	if (numDia < 10) {
		numDiaS = '0' + numDia;
	} else {
		numDiaS = numDia;
	}
	if (numMes < 10) {
		numMesS = '0' + numMes;
	} else {
		numMesS = numMes;
	}   
	formato = formato.replace(/%Y/, anio);
	formato = formato.replace(/%d/, numDiaS);
	formato = formato.replace(/%m/, numMesS);
	formato = formato.replace(/%M/, meses[numMes]);
	return formato;
};

/**
 * This method is simple used to check for undefined variables
 * @param {type} variable the variable used to check if it is undefined
 * @param {type} name Name of the variable
 */
owgis.utils.isNotUndefined = function(variable, name){
    if(variable === undefined){
        throw "Variable: "+ name +" is undefined";
    }
    return variable;
};
