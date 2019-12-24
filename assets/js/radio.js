var RADIO_CURRENT_TRACK;

function rnd(min, max)
{
    return Math.floor(Math.random() * (max - min + 1)) + min;
}

function randword()
{
    var s = '';
    var ltr = 'qwertyuiopasdfghjklzxcvbnm';
    while (s.length < 20)
    {
        s += ltr[rnd(0, 20)];
    }
    return s;
}

var radioPlayer = null;
var playerReady = false,
	currentChannel = '',
	nowPlaying = false,
	playerRestartTimer = null;

function radioInit()
{
	try
	{

		var a = document.createElement('audio');
		if (a.canPlayType('audio/aac') != 'no' &&

			// Opera has broken AAC decoder
			(navigator.userAgent.indexOf("Opera") == -1 &&
			navigator.userAgent.indexOf("OPR") == -1 &&

			// Some androids can't play AAC too.
			navigator.userAgent.indexOf("Android") == -1))

			currentChannel = 'provodach';
		else
			currentChannel = 'provodach.mp3';


		a.remove();
		delete a;

		setupVolumeControl(); 	
		
		// Restore volume settings
		radioSetVolume(radioGetVolume(), false);
		
		// Initialize track info.
		requestTrackInfo();

		playerReady = true;
	}
	catch (e)
	{
		error ("Error: " + e.message);
		playerReady = false;
	}
}

function wheelVolControl(objEvent, intDelta)
{
	objEvent.preventDefault();
	var chg = (intDelta > 0) ? 5 : -5;
	radioSetVolume(radioGetVolume() + chg, true);
}

function setupVolumeControl()
{
	$('#table-player').mousewheel(wheelVolControl);
}

function radioPlay(channel)
{

    channel = channel || currentChannel;

	if (playerReady)
	{
		// Create a player object
		radioPlayer = document.createElement('audio');
		radioPlayer.src = '//station.waveradio.org/'+channel+'?'+randword();
		radioPlayer.title = RADIO_CURRENT_TRACK;
		radioPlayer.volume = radioGetVolume() / 100;

		radioPlayer.onerror = function()
		{
			if (nowPlaying)
			{
				setTempTitle('Сбой, рестарт через секунду...');
				radioStop();

				clearTimeout(playerRestartTimer);
				playerRestartTimer = setTimeout(function() {
						radioPlay();
					}, 1000);
			}
		}

		radioPlayer.oncanplay = function()
		{
			setTrackInfo(RADIO_CURRENT_TRACK);
			clearTimeout(playerRestartTimer);
		}

		radioPlayer.onstalled = function()
		{
			setTempTitle('Низкая скорость, жду буфер...');
		}

		radioPlayer.onloadstart = function()
		{
			if (nowPlaying)
				setTempTitle('Буферизация...');
		}
		
		radioPlayer.play();
		
		$('#player-control').attr('class', 'player-control-playing');
		
		setVal('player_on', 1);
	}
		else
	error ('ERR: Still loading');
}

function radioStop()
{
	if (playerReady && radioPlayer)
	{
		radioPlayer.pause();
		radioPlayer.src = '';
		radioPlayer.remove();
		delete radioPlayer;

		// Make an object to be NULL to get radioToggle() correct work
		radioPlayer = null;
		
		$('#player-control').attr('class', 'player-control-stalled');
		setVal('player_on', 0);
	}
}


function radioGetVolume()
{
	var savedVol = getVal('volume');

    if (savedVol == null)
        return 100;
    else
        return parseInt(savedVol);
}

function radioSetVolume(value, userAct)
{
	userAct = userAct || false;
	if (value > 100)
		value = 100;
	else if (value < 0)
		value = 0;
			
    if (radioPlayer != null)
    {
        radioPlayer.volume = (value / 100);
    }
		
	if (userAct)
	{
		radioSaveVolume(value);
	}
	
	setVolValue(value);
}

function radioSaveVolume(value)
{
    setVal('volume', value);
}

function radioToggle(channel)
{
	channel = channel || currentChannel;
	if (!playerReady)
	{
		error ('Cannot start player, did not initialize yet');
		return false;
	}
    if (radioPlayer == null)
    {
        try
        {
        	nowPlaying = true;
            radioPlay(channel);
        }
        catch (e)
        {
            error('Error: ' + e.message);
        }
    }
    else
    {
        try
        {
        	nowPlaying = false;
            radioStop();
        }
        catch (e)
        {
            error('Error: ' + e.message);
        }
    }
}

function setVolValue(value)
{
    var max = 10;
	
	value = Math.floor(value / 10);
	
    if (value > max)
        return;
	
	$('.volume-dot').css({color:'#909090'});
	
    for (i = 1; i <= value; i++)
	{
		$('#bullet-'+i).css({color:'#f5f5f5'});
	}
}


function requestTrackInfo()
{
	setTimeout(requestTrackInfo, 15000);

    $.ajax(
    {
        url: '//core.waveradio.org/public/current?station=provodach&brief=1',
        dataType: 'json',
        crossDomain: true
    }).done(
        function (data)
        {
            processResult(data);
        }
    ).fail(function(jq, jx) { setTrackInfo('- нет связи -'); });
}


function processResult(csRes)
{
	
	if (tempShowing)
		return;
	
	try
	{
		var a = csRes["payload"];
	}
	catch (e)
	{
		$("#player-trackinfo").text('- отказ сервера -');
		return;
	}

    if (a == null || typeof a == 'undefined')
    {
        $("#player-trackinfo").text('- нет данных -');
        return;
    }

    if (a == "" || a == '-')
	{
        a = "- нет данных -";
	}
	
	if (a != RADIO_CURRENT_TRACK)
	{

		RADIO_CURRENT_TRACK = a;
		setTrackInfo (a);
	}
}

function setTrackInfo (track)
{
	if (!track)
		return;

	var trackParts = track.split(/\s\-\s/);

	// iOS
	if (radioPlayer != null)
		radioPlayer.title = trackParts[0] + ' – ' + trackParts[1];

	// Android/Chrome
	if ('mediaSession' in navigator && radioPlayer != null)
	{
		navigator.mediaSession.metadata = new MediaMetadata({
		    title: trackParts[1],
		    artist: trackParts[0]
		  });
	}

	$("#player-trackinfo").attr('title', track);
	$("#player-trackinfo").attr('href', 'https://vk.com/audio?q='+encodeURIComponent(track));

	$("#player-trackinfo").text(track);
}