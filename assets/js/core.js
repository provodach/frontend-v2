var localStorageAvailable = false;

function init()
{
	localStorageAvailable = isLSAvailable();
	
	radioInit();
	// enmarquee();
}

function error (tx)
{
	alert (tx);
	// TODO: Normal error message show
}


function mkactive(name)
{
	$('.menu-item').removeClass('active');
	$('#menu-item-'+name).addClass('active');
}

function resetEvents()
{
	$(document).off();
	$(window).off();
}

function loadContent(name)
{
	resetEvents();
	$.ajax({url: '/'+name+'?ajax',}).done(function (c) {showContent(name, c);}).fail(function(jq, jx) {error ('ERR: '+jx);});
	return false;
}

function showContent (name, content)
{
	history.pushState(null, null, name);
	
	if (typeof saria_disconnect == 'function')
		saria_disconnect();

	mkactive(name);
	
	$('#content').html(content);
}

$(document).ready(init);