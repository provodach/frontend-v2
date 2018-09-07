<style>
#content
{
	padding-bottom: 70px;
}
</style>


<div id="chat-waiting">
	<div id="chat-waiting-centered">
		<div id="ballsWaveG">
			<div id="ballsWaveG_1" class="ballsWaveG"></div>
			<div id="ballsWaveG_2" class="ballsWaveG"></div>
			<div id="ballsWaveG_3" class="ballsWaveG"></div>
			<div id="ballsWaveG_4" class="ballsWaveG"></div>
			<div id="ballsWaveG_5" class="ballsWaveG"></div>
			<div id="ballsWaveG_6" class="ballsWaveG"></div>
			<div id="ballsWaveG_7" class="ballsWaveG"></div>
			<div id="ballsWaveG_8" class="ballsWaveG"></div>
		</div>
		<div id="chat-service-message">Соединяюсь с сервером...</div>
	</div>
</div>

<div id="chat-container">
<div id="chat-messages"></div>
<table id="chat-panel">
	<tr>
	<td id="chat-settings-button" onclick="toggleSettings()" title="Нажми меня чтобы поменять ник :3">
		<!-- <img src="/assets/sprites/gear_night.png" id="chat-gear"> -->
	</td>
	<td id="chat-authorized">
		<textarea id="chat-text" placeholder="[messaging intensifies] нажми Enter чтобы отправить." autocomplete="off"></textarea>
	</td>
	
	<td id="chat-readonly">
		Чтобы писать в чат нужно пройти авторизацию <a href="https://oauth.vk.com/authorize?client_id=5216648&display=page&redirect_uri=https://api.https.cat/airin/auth&response_type=code">через ВК</a> или <a href="https://t.me/provodach_bot" target="_blank">через Telegram</a>.
	</td>
	</tr>
</table>

<div id="chat-settings-overlay" onclick="toggleSettings()"></div>
<div id="chat-settings">
	<div id="settings-close">
		[<a href="javascript:void(0)" onclick="toggleSettings()">закрыть</a>]
	</div>
	<div class="settings-control">
		<input type="text" placeholder="Ник (латиница и цифры, Enter чтобы сохранить)" id="username" name="username" autocomplete="off">
	</div>
	<div class="settings-control">
		<label><input type="checkbox" id="play-sound" onchange="setSoundState(this)">Звук, если мне написали</label>
	</div>
	<div class="settings-control">
		Менять заголовок:
		<select id="title-change-level" onchange="setTitleLevel(this)">
			<option value="0">никогда</option>
			<option value="1">если мне написали</option>
			<option value="2">при любом сообщении</option>
		</select>
	</div>
</div>
</div>

<!-- Mrr :3 -->
<audio id="message-sound" preload="auto">
		<source src="assets/snd/mrr.ogg" type="audio/ogg">
		<source src="assets/snd/mrr.mp3" type="audio/mpeg">
</audio>

<script type="text/javascript">
	$(document).ready(function() {saria_init('<?php echo ((preg_match('/^[a-zA-Z0-9]+$/', $_GET['auth']) == 1) ? $_GET['auth'] : null);?>'); });
</script>