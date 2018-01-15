<?if(!defined("B_PROLOG_INCLUDED") || B_PROLOG_INCLUDED!==true)die();

if($arParams['USE_SPECIAL_DATE']){
    $arResult['SPECIAL_DATE_VALUE'] = $arResult['ITEMS'][0]['ACTIVE_FROM'];
    $this->__component->SetResultCacheKeys(array("SPECIAL_DATE_VALUE"));
}
