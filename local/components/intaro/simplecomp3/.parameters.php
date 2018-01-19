<? if (!defined("B_PROLOG_INCLUDED") || B_PROLOG_INCLUDED!==true) die();
use Bitrix\Main\Loader;

if (!Loader::includeModule('iblock')){
    return;
}

$arComponentParameters = array(
    "PARAMETERS" => array(
        "NEWS_IBLOCK_ID" => array(
            "PARENT" => "BASE",
            "NAME" => "ID инфоблока с новостями",
            "TYPE" => "STRING",
            "REFRESH" => "Y",
        ),
        "AUTHOR_PROPERTY_CODE" => array(
            "PARENT" => "BASE",
            "NAME" => 'Код пользовательского свойства "Автор"',
            "TYPE" => "STRING",
            "REFRESH" => "Y",
        ),
        "USER_PROPERTY_CODE" => array(
            "PARENT" => "BASE",
            "NAME" => "Код пользовательского свойства пользователей, в котором хранится тип автора",
            "TYPE" => "STRING",
            "REFRESH" => "Y",
        ),
        "CACHE_TIME"  =>  array("DEFAULT"=>36000000),
    )
);
