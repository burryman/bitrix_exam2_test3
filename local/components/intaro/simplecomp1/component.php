<? if (!defined("B_PROLOG_INCLUDED") || B_PROLOG_INCLUDED!==true) die();
use Bitrix\Main\Loader;

if (!Loader::includeModule('iblock')) {
    return;
}

if (intval($arParams['CATALOG_IBLOCK_ID']) > 0) {
    $arParams['CATALOG_IBLOCK_ID'] = intval($arParams['CATALOG_IBLOCK_ID']);
} else {
    $arResult['ERRORS'][] = 'Укажите ID инфоблока каталога';
}

if (intval($arParams['ALT_IBLOCK_ID']) > 0) {
    $arParams['ALT_IBLOCK_ID'] = intval($arParams['ALT_IBLOCK_ID']);
} else {
    $arResult['ERRORS'][] = 'Укажите ID инфоблока - альтернативного классификатора';
}

if (! isset($arParams['PROPERTY_CODE'])) {
    $arResult['ERRORS'][] = 'Укажите код свойства';
}

if (count($arResult['ERRORS']) > 0) {
    foreach ($arResult['ERRORS'] as $error) {
        echo $error . '<br>';
    }
    return;
}

if ($this->StartResultCache(false)) {
    $rsSection = CIBlockSection::GetList(
        array(),
        array('IBLOCK_ID' => $arParams['CATALOG_IBLOCK_ID'], '!' . $arParams['PROPERTY_CODE'] => false),
        false,
        array('ID', 'NAME', $arParams['PROPERTY_CODE']),
        false
    );

    $arNews = array();

    while ($arr = $rsSection->GetNext()) {
        $arSection[$arr['ID']] = $arr;
        $arNews = array_merge($arNews, $arr[$arParams['PROPERTY_CODE']]);
    }

    $arNews = array_unique($arNews);

    if (count($arNews) > 0 && count($arSection) > 0) {
        $rsNews = CIBlockElement::GetList(
            array(),
            array('IBLOCK_ID' => $arParams['ALT_IBLOCK_ID'], 'ID' => $arNews),
            false,
            false,
            array('ID', 'NAME', 'ACTIVE_FROM')
        );

        while ($arr = $rsNews->GetNext()) {
            $arResult['NEWS'][$arr['ID']] = $arr;
        }

        $rsElement = CIBlockElement::GetList(
            array(),
            array("IBLOCK_ID" => $arParams['CATALOG_IBLOCK_ID'], 'IBLOCK_SECTION_ID' => array_keys($arSection)),
            false,
            false,
            array('ID', 'NAME', 'IBLOCK_SECTION_ID', 'PROPERTY_PRICE', 'PROPERTY_MATERIAL', 'PROPERTY_ARTNUMBER', $arParams['PROPERTY_CODE'])
        );

        $arResult['COUNT'] = $rsElement -> SelectedRowsCount();

        $arElement = array();
        while ($arr = $rsElement->GetNext()) {
            $arElement[$arr['ID']] = $arr;
        }

        foreach ($arSection as $arr) {
            foreach ($arr[$arParams['PROPERTY_CODE']] as $news_id) {
                $arResult['NEWS'][$news_id]['SECTIONS'][$arr['ID']] = $arr;

                foreach ($arElement as $el) {
                    if ($el['IBLOCK_SECTION_ID'] == $arr['ID']) {
                        $arResult['NEWS'][$news_id]['SECTIONS'][$arr['ID']]['ITEMS'][$el['ID']] = $el;
                    }
                }
            }
        }
    }

    $this->setResultCacheKeys(array(
        'NEWS',
        'COUNT'
    ));
    $this->IncludeComponentTemplate();
}

$title = 'В каталоге товаров представлено товаров: ' . $arResult['COUNT'];

$APPLICATION->SetTitle($title);


