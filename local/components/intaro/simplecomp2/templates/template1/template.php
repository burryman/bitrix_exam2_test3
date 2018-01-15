<?
if (!defined("B_PROLOG_INCLUDED") || B_PROLOG_INCLUDED!==true) die();?>

<ul>
<? foreach ($arResult['NEWS'] as $news): ?>
    <li><?= $news['NAME'] ?></li>
<? endforeach ?>
</ul>