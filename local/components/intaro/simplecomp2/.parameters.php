<? if (!defined("B_PROLOG_INCLUDED") || B_PROLOG_INCLUDED!==true) die();
use Bitrix\Main\Loader;

if (!Loader::includeModule('iblock')){
    return;
}

$arComponentParameters = array(
    "PARAMETERS" => array(
        "CATALOG_IBLOCK_ID" => array(
            "PARENT" => "BASE",
            "NAME" => "ID инфоблока с товарами",
            "TYPE" => "STRING",
            "REFRESH" => "Y",
        ),
        "ALT_IBLOCK_ID" => array(
            "PARENT" => "BASE",
            "NAME" => "ID инфоблока - альтернативного классификатора",
            "TYPE" => "STRING",
            "REFRESH" => "Y",
        ),
        "PROPERTY_CODE" => array(
            "PARENT" => "BASE",
            "NAME" => "Код пользовательского свойства раздела каталога",
            "TYPE" => "STRING",
            "REFRESH" => "Y",
        ),
        "DETAIL_URL" => array(
            "PARENT" => "BASE",
            "NAME" => "Ссылка на детальную страницу товара",
            "TYPE" => "STRING",
            "REFRESH" => "Y",
        ),
        "CACHE_TIME"  =>  array("DEFAULT"=>36000000),
    )
);
