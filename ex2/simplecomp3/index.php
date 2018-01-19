<?
require($_SERVER["DOCUMENT_ROOT"]."/bitrix/header.php");
$APPLICATION->SetTitle("Простой компонент 3");
?><?$APPLICATION->IncludeComponent(
	"intaro:simplecomp3", 
	".default", 
	array(
		"ALT_IBLOCK_ID" => "7",
		"CACHE_TIME" => "36000000",
		"CACHE_TYPE" => "A",
		"CATALOG_IBLOCK_ID" => "2",
		"DETAIL_PAGE_TEMPLATE" => "catalog_exam/#SECTION_ID#/#ELEMENT_CODE#",
		"PROPERTY_CODE" => "BRAND",
		"COMPONENT_TEMPLATE" => ".default",
		"NEWS_IBLOCK_ID" => "1",
		"AUTHOR_PROPERTY_CODE" => "AUTHOR",
		"USER_PROPERTY_CODE" => "UF_AUTHOR_TYPE"
	),
	false
);?><?require($_SERVER["DOCUMENT_ROOT"]."/bitrix/footer.php");?>