
	$.root_ = $('body');	
/*
 * APP CONFIGURATION (HTML/AJAX/PHP Versions ONLY)
 * Description: Enable / disable certain theme features here
 * GLOBAL: Your left nav in your app will no longer fire ajax calls, set 
 * it to false for HTML version
 */	
	$.navAsAjax = false; 
/*
 * SAVE INSTANCE REFERENCE (DO NOT CHANGE)
 * Save a reference to the global object (window in the browser)
 */
	var root = this,	
/*
 * DEBUGGING MODE
 * debugState = true; will spit all debuging message inside browser console.
 * The colors are best displayed in chrome browser.
 */
	debugState = false,	
	debugStyle = 'font-weight: bold; color: #00f;',
	debugStyle_green = 'font-weight: bold; font-style:italic; color: #46C246;',
	debugStyle_red = 'font-weight: bold; color: #ed1c24;',
	debugStyle_warning = 'background-color:yellow',
	debugStyle_success = 'background-color:green; font-weight:bold; color:#fff;',
	debugStyle_error = 'background-color:#ed1c24; font-weight:bold; color:#fff;',
/*
 * Impacts the responce rate of some of the responsive elements (lower 
 * value affects CPU but improves speed)
 */
	throttle_delay = 350,
/*
 * The rate at which the menu expands revealing child elements on click
 */
	menu_speed = 235,	
/*
 * Collapse current menu item as other menu items are expanded
 * Careful when using this option, if you have a long menu it will
 * keep expanding and may distrupt the user experience This is best 
 * used with fixed-menu class
 */
	menu_accordion = true,	
/*
 * Turn on JarvisWidget functionality
 * Global JarvisWidget Settings
 * For a greater control of the widgets, please check app.js file
 * found within COMMON_ASSETS/UNMINIFIED_JS folder and see from line 1355
 * dependency: js/jarviswidget/jarvis.widget.min.js
 */
	enableJarvisWidgets = true,
/*
 * Use localstorage to save widget settings
 * turn this off if you prefer to use the onSave hook to save
 * these settings to your datatabse instead
 */	
	localStorageJarvisWidgets = true,
/*
 * Turn on/off sortable feature for JarvisWidgets 
 */	
	sortableJarvisWidgets = true,		
/*
 * Warning: Enabling mobile widgets could potentially crash your webApp 
 * if you have too many widgets running at once 
 * (must have enableJarvisWidgets = true)
 */
	enableMobileWidgets = false,	
/*
 * Turn on fast click for mobile devices
 * Enable this to activate fastclick plugin
 * dependency: js/plugin/fastclick/fastclick.js 
 */
	fastClick = false,
/*
 * SMARTCHAT PLUGIN ARRAYS & CONFIG
 * Dependency: js/plugin/moment/moment.min.js 
 *             js/plugin/cssemotions/jquery.cssemoticons.min.js 
 *             js/smart-chat-ui/smart.chat.ui.js
 * (DO NOT CHANGE) 
 */	
	boxList = [],
	showList = [],
 	nameList = [],
	idList = [],
/*
 * Width of the chat boxes, and the gap inbetween in pixel (minus padding)
 */	
	chatbox_config = {
	    width: 200,
	    gap: 35
	},

ignore_key_elms = ["#header, #left-panel, #right-panel, #main, div.page-footer, #shortcut, #divSmallBoxes, #divMiniIcons, #divbigBoxes, #voiceModal, script, .ui-chatbox"];

function loadKeys() {
	var dbSize = 2 * 1024 * 1024; 
	var db = openDatabase("sellerdb", "1.0", "AmazonSeller Database", dbSize);
	db.transaction(function (tx) {  
		tx.executeSql('SELECT * FROM AMAZONDETAIL', [], function (tx, results) {
			for (var i=0; i < results.rows.length; i++) {
				var itm = results.rows.item(i);
				$('#sellerid').val(itm.sellerid);
				$('#keys').val(itm.sellerkeys);
				$('#secret').val(itm.secret);
				$('#region').val(itm.region);
			}
		});
	});
}
 
$(document).ready(function(){
	$('#smart-form-register').on('submit',function(){
		var dbSize = 2 * 1024 * 1024; 
		var db = openDatabase("sellerdb", "1.0", "AmazonSeller Database", dbSize);
	    db.transaction(function (tx) {  
			tx.executeSql("delete from AMAZONDETAIL");
			var query = "INSERT INTO AMAZONDETAIL(sellerid, sellerkeys, secret, region) VALUES ('" + $('#sellerid').val()+ "','"  + $('#keys').val() + "','" + $('#secret').val() + "','" + $('#region').val() + "')";
		    tx.executeSql(query);
		  });		
		return false;
	});
	loadKeys();
});