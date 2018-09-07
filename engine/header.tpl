<!DOCTYPE html>
<html>
	<head>
		<meta charset="utf-8">
		<meta name="description" content="Проводач. Самая атмосферная радиостанция в Сети.">
		<meta name="keywords" content="проводач, провода, панельки, панельные дома, урбанистика, онлайн радио, радио, радио онлайн, спокойная музыка, музыка для отдыха, пост рок, эмбиент, provodach, provoda.ch, panel house, panel buildings, plattenbau, plattenbauten, urban, urbanistic, wires, wire pole, ambient, post-rock, relax music, relaxation music, relax radio">
		<meta property="og:image" content="https://api.https.cat/graphics/provodach/web/night/">
		<meta name="author" content="IDENT Software">
		<meta name="google-play-app" content="app-id=org.identsoft.provodach">
		<meta name="apple-itunes-app" content="app-id=1080566427">
		<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no">
		<meta name="theme-color" content="#020202">

		<link href='//fonts.googleapis.com/css?family=Open+Sans:400,300,300italic,700,700italic,400italic&amp;subset=latin,cyrillic-ext,cyrillic,latin-ext' rel='stylesheet' type='text/css'>
		<link rel="stylesheet" href="/assets/provodach.css?v<?php echo(CLIENT_VERSION); ?>" type="text/css">
		<link rel="stylesheet" href="/assets/fonts.css?v<?php echo(CLIENT_VERSION); ?>" type="text/css">

		<link rel="apple-touch-icon" href="/assets/sprites/apple-touch-icon.png" />
		<link rel="apple-touch-icon" sizes="57x57" href="/assets/sprites/apple-touch-icon-57x57.png" />
		<link rel="apple-touch-icon" sizes="72x72" href="/assets/sprites/apple-touch-icon-72x72.png" />
		<link rel="apple-touch-icon" sizes="76x76" href="/assets/sprites/apple-touch-icon-76x76.png" />
		<link rel="apple-touch-icon" sizes="114x114" href="/assets/sprites/apple-touch-icon-114x114.png" />
		<link rel="apple-touch-icon" sizes="120x120" href="/assets/sprites/apple-touch-icon-120x120.png" />
		<link rel="apple-touch-icon" sizes="144x144" href="/assets/sprites/apple-touch-icon-144x144.png" />
		<link rel="apple-touch-icon" sizes="152x152" href="/assets/sprites/apple-touch-icon-152x152.png" />
		<link rel="apple-touch-icon" sizes="180x180" href="/assets/sprites/apple-touch-icon-180x180.png" />

		<link rel="shortcut icon" sizes="128x128" href="/assets/sprites/provodach.png">

		<title><?php echo($content['title']); ?></title>


		<script src="//static.https.cat/js/jquery.js" type="text/javascript"></script>
		<script src="//static.https.cat/js/jquery.mousewheel.js" type="text/javascript"></script>
		<script src="//static.https.cat/js/util.js" type="text/javascript"></script>
		<script src="/assets/js/radio.js?v<?php echo(CLIENT_VERSION); ?>" type="text/javascript"></script>
		<script src="/assets/js/trackvote.js?v<?php echo(CLIENT_VERSION); ?>" type="text/javascript"></script>
		<script src="/assets/js/core.js?v<?php echo(CLIENT_VERSION); ?>" type="text/javascript"></script>
		<script src="/assets/js/saria.js?v<?php echo(CLIENT_VERSION); ?>" type="text/javascript"></script>
	</head>
	<body>
		<header>
			<table id="table-header">
				<tr>
					<td id="logo">provoda.ch</td>

					<td>
						<nav>
							<?php foreach ($content['menu'] as $item => $properties) : ?> 
							<a
								class="menu-item<?php if($properties['active']) echo(' active');?>"
								href="/<?php echo($item); ?>" 
								id="menu-item-<?php echo($item); ?>"
								onclick="loadContent('<?php echo($item); ?>'); return false;"><?php echo($properties['title']); ?>
							</a>
							<?php endforeach; ?>
						</nav>
					</td>
				</tr>
			</table>

			<table id="table-player">
				<tr>
					<td class="trackvote" id="vote-class" title="Класс" onclick="trackVote(true)"></td>
					<td class="trackvote" id="vote-disclass" title="Дискласс" onclick="trackVote(false)">
					</td>

					<td id="player-handle" onclick="radioToggle();" title="Включить/выключить проигрыватель">
						<div id="player-control" class="player-control-stalled"></div>
					</td>

					<td id="player-track-handle">
						<a id="player-trackinfo" target="_blank">- WAITING FOR SERVER -</a>
					</td>

					<td id="volume-dots" title="Используй колёсико мыши для регулировки громкости">
						<div class="volume-dot" id="bullet-10" onclick="radioSetVolume(100, true);">&bull;</div><div class="volume-dot" id="bullet-9" onclick="radioSetVolume(90, true);">&bull;</div><div class="volume-dot" id="bullet-8" onclick="radioSetVolume(80, true);">&bull;</div><div class="volume-dot" id="bullet-7" onclick="radioSetVolume(70, true);">&bull;</div><div class="volume-dot" id="bullet-6" onclick="radioSetVolume(60, true);">&bull;</div><div class="volume-dot" id="bullet-5" onclick="radioSetVolume(50, true);">&bull;</div><div class="volume-dot" id="bullet-4" onclick="radioSetVolume(40, true);">&bull;</div><div class="volume-dot" id="bullet-3" onclick="radioSetVolume(30, true);">&bull;</div><div class="volume-dot" id="bullet-2" onclick="radioSetVolume(20, true);">&bull;</div><div class="volume-dot" id="bullet-1" onclick="radioSetVolume(10, true);">&bull;</div>				
					</td>
				</tr>
			</table>
		</header>

		<main>
			<div id="content">