<? if (!defined("B_PROLOG_INCLUDED") || B_PROLOG_INCLUDED!==true) die();
use Bitrix\Main\Loader;

global $APPLICATION;

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

if (!isset($arParams['PROPERTY_CODE'])) {
    $arResult['ERRORS'][] = 'Укажите код свойства';
}

if (count($arResult['ERRORS']) > 0) {
    foreach ($arResult['ERRORS'] as $error) {
        echo $error . '<br>';
    }
    return;
}

if ($this->StartResultCache(false)) {
    $rsCompany = CIBlockElement::GetList(
        array(),
        array('IBLOCK_ID' => $arParams['ALT_IBLOCK_ID']),
        false,
        false,
        array('ID', 'NAME')
    );

    $arResult['COUNT'] = $rsCompany -> SelectedRowsCount();

    while ($arr = $rsCompany->GetNext()) {
        $arResult['COMPANIES'][$arr['ID']] = $arr;
    }

    $rsElement = CIBlockElement::GetList(
        array('by1' => 'name', 'by2' => 'sort'),
        array("IBLOCK_ID" => $arParams['CATALOG_IBLOCK_ID'], 'PROPERTY_' . $arParams['PROPERTY_CODE'] => array_keys($arResult['COMPANIES'])),
        false,
        false,
        array(
            'ID',
            'NAME',
            'CODE',
            'IBLOCK_SECTION_ID',
            'PROPERTY_PRICE',
            'PROPERTY_MATERIAL',
            'PROPERTY_ARTNUMBER',
            'PROPERTY_' . $arParams['PROPERTY_CODE'])
    );

    while ($arr = $rsElement->GetNext()) {
        foreach ($arr['PROPERTY_' . $arParams['PROPERTY_CODE'] . '_VALUE'] as $companyID) {
            $arResult['COMPANIES'][$companyID]['ITEMS'][$arr['ID']] = $arr;

            $detailPageURL = str_replace(
                array('#SECTION_ID#', '#ELEMENT_CODE#'),
                array($arr['IBLOCK_SECTION_ID'], $arr['CODE']),
                $arParams['DETAIL_PAGE_TEMPLATE']
            ) . '.php';

            $arResult['COMPANIES'][$companyID]['ITEMS'][$arr['ID']]['DETAIL_PAGE_URL'] =  $detailPageURL;
        }
    }

    $this->setResultCacheKeys(array(
        'COMPANIES',
        'COUNT'
    ));
    $this->IncludeComponentTemplate();
}

$title = 'Разделов: ' . $arResult['COUNT'];

$APPLICATION->SetTitle($title);


