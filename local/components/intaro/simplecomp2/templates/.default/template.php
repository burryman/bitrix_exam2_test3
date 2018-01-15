<?
if (!defined("B_PROLOG_INCLUDED") || B_PROLOG_INCLUDED!==true) die();?>

<ul>
<? foreach ($arResult['COMPANIES'] as $company): ?>
    <li><?= '<b>' . $company['NAME'] . '</b>' ?></li>

    <ul>
    <? foreach ($company['ITEMS'] as $item): ?>
        <? $itemProps = implode(' - ', array(
            $item['PROPERTY_PRICE_VALUE'],
            $item['PROPERTY_MATERIAL_VALUE'],
            )
        ) ?>
        <li><?= $item['NAME'] . ' - ' . $itemProps ?></li>
    <? endforeach ?>
    </ul>
<? endforeach ?>
</ul>