<?if(!defined("B_PROLOG_INCLUDED") || B_PROLOG_INCLUDED!==true)die();

if ($arResult['CANONICAL_VALUE']) {
    $APPLICATION->SetPageProperty('canonical', $arResult['CANONICAL_VALUE']);
}