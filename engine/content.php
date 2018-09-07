<?php

function str_shuffle_unicode($str) {
    $tmp = preg_split("//u", $str, -1, PREG_SPLIT_NO_EMPTY);
    shuffle($tmp);
    return join("", $tmp);
}

function get_template ($mode)
{
	switch ($mode)
	{
		case 'index' :
			return 'index.tpl'; break;

		case 'about' :
			return 'about.tpl'; break;
			
		case 'chat' :
			return 'chat.tpl'; break;
			
		case 'pp' :
			return 'pp.tpl'; break;

		case 'donate' :
			return 'donate.tpl'; break;

		case 'thanks' :
			return 'donate_thanks.tpl'; break;

		case 'passme' :
			return 'passme.tpl'; break;
			
		default :
			header ('HTTP/1.1 404 Not Found');
			return '404.tpl';
			break;
	}
}

function get_title($mode)
{
		switch ($mode)
	{
		case 'index' :
			return 'Главная'; break;

		case 'about' :
			return 'О радио'; break;
		
		case 'schedule' :
			return 'Расписание'; break;
			
		case 'chat' :
			return 'Чат'; break;
			
		case 'pp' :
			return 'Политика конфиденциальности'; break;

		case 'donate' :
			return 'Помочь нам'; break;

		case 'thanks' :
			return 'Спайсибо :3'; break;

		case 'passme' :
			return 'Telegram Passme'; break;
			
		default :
			return '404';
			break;
	}
}