<?if (!defined("B_PROLOG_INCLUDED") || B_PROLOG_INCLUDED!==true) die();

if(isset($arParams['CANONICAL_ID']) && intval($arParams['CANONICAL_ID'])){
    $rsCanon = CIBlockElement::GetList(
        array(),
        array("IBLOCK_ID" => intval($arParams['CANONICAL_ID']), "PROPERTY_NEWS" => $arResult['ID']),
        false,
        false,
        array("NAME")
    )->GetNext();

    $arResult['CANONICAL_VALUE'] = $rsCanon['NAME'];
    $this->__component->SetResultCacheKeys(array("CANONICAL_VALUE"));
}