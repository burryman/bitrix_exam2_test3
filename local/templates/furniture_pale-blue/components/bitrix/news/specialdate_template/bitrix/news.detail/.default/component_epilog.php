<?if(!defined("B_PROLOG_INCLUDED") || B_PROLOG_INCLUDED!==true)die();
var_dump($arResult['CANONICAL_VALUE']);

if ($arResult['CANONICAL_VALUE']) {
    $link = '<link rel="canonical" href="#VALUE#">';
    $res = str_replace('#VALUE#', $arResult['CANONICAL_VALUE'], $link);

    $APPLICATION->SetPageProperty('canonical', $res);
}