function checkPayAmount()
{
	/*
	var amount = +$('#donate-amount').val();

	if (!isNaN(amount) && amount >= 100)
		$('#wp-container').show();
	else
		$('#wp-container').hide();
	*/
}

function setPresentRequest()
{
	var elementsState = ($('#want-present').prop('checked') ? "true" : "false");
	$('#need-address').val(elementsState);
	$('#need-fio').val(elementsState);
}

function setPTHint()
{
	var hint = 'nus sus';
	switch ($('#donate-payment-type').val())
	{
		case 'PC' : hint = 'Оплата &laquo;Яндекс.Деньгами&raquo;'; break;
		case 'AC' : hint = 'Оплата с помощью банковской карты'; break;
		case 'MC' : hint = 'Оплата со счёта мобильного телефона (макс. 500 руб)'; break;
	}

	$('#payment-type-hint').html(hint);
}

function donate_init()
{
	checkPayAmount();
	setPresentRequest();
	setPTHint();
}

$(document).ready(donate_init); // if user presses F5 or smth like this