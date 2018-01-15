<?
require($_SERVER["DOCUMENT_ROOT"]."/bitrix/header.php");
$APPLICATION->SetTitle("Простой компонент 2");
?><?$APPLICATION->IncludeComponent(
	"intaro:simplecomp2", 
	".default", 
	array(
		"ALT_IBLOCK_ID" => "7",
		"CACHE_TIME" => "36000000",
		"CACHE_TYPE" => "A",
		"CATALOG_IBLOCK_ID" => "2",
		"DETAIL_URL" => "",
		"PROPERTY_CODE" => "BRAND",
		"COMPONENT_TEMPLATE" => ".default"
	),
	false
);?><?require($_SERVER["DOCUMENT_ROOT"]."/bitrix/footer.php");?>