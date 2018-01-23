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
		"DETAIL_URL" => "catalog_exam/#SECTION_ID#/#ELEMENT_CODE#",
		"PROPERTY_CODE" => "BRAND",
		"COMPONENT_TEMPLATE" => ".default",
		"DETAIL_PAGE_TEMPLATE" => "catalog_exam/#SECTION_ID#/#ELEMENT_CODE#"
	),
	false
);?><?require($_SERVER["DOCUMENT_ROOT"]."/bitrix/footer.php");?>