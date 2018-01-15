<?
if (!defined("B_PROLOG_INCLUDED") || B_PROLOG_INCLUDED!==true) die();?>

<ul>
<? foreach ($arResult['NEWS'] as $news): ?>
    <? $dataSource = array();
    $dataItems = array();
    foreach ($news['SECTIONS'] as $section) {
        $dataSource[] = $section['NAME'];

        foreach ($section['ITEMS'] as $item) {
            $dataItems[$item['ID']] = $item;
        }
    }
    $dataSourceName = " (" . implode(", ", $dataSource) . ")" ?>

    <li><?= '<b>' . $news['NAME'] . '</b>' . ' - ' . $news['ACTIVE_FROM'] . $dataSourceName ?></li>

    <ul>
    <? foreach ($dataItems as $item): ?>
        <? $itemProps = implode(' - ', array(
            $item['PROPERTY_PRICE_VALUE'],
            $item['PROPERTY_MATERIAL_VALUE'],
            $item['PROPERTY_ARTNUMBER_VALUE'],
            )
        ) ?>
        <li><?= $item['NAME'] . ' - ' . $itemProps ?></li>
    <? endforeach ?>
    </ul>
<? endforeach ?>
</ul>