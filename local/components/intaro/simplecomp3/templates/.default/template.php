<?
if (!defined("B_PROLOG_INCLUDED") || B_PROLOG_INCLUDED!==true) die();?>

<b>Авторы и новости:</b>
<ul>
<? foreach ($arResult['USERS'] as $user): ?>
    <li><?= '[' . $user['ID'] . ']' . ' - ' . $user['LOGIN'] ?></li>

    <ul>
    <? foreach ($user['ITEMS'] as $item): ?>
        <li><?= ' - ' . $item['NAME'] ?></li>
    <? endforeach ?>
    </ul>
<? endforeach ?>
</ul>