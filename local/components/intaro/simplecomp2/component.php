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

if ( isset($_GET["F"]) ) {
    $arParams['CACHE_TIME'] = 0;
}

$nav = new \Bitrix\Main\UI\PageNavigation("nav-more-companies");
$nav->allowAllRecords(true)
    ->setPageSize(2)
    ->initFromUri();

$arNavParams = array(
    'nTopCount' => false,
    'nPageSize' => $nav->getPageSize(),
    'iNumPage' => $nav->getCurrentPage(),
    'checkOutOfRange' => true
);

if (count($arResult['ERRORS']) > 0) {
    foreach ($arResult['ERRORS'] as $error) {
        echo $error . '<br>';
    }
    return;
}

if ($this->StartResultCache(false, array($arNavParams))) {
    $rsCompany = CIBlockElement::GetList(
        array(),
        array('IBLOCK_ID' => $arParams['ALT_IBLOCK_ID']),
        false,
        $arNavParams,
        array('ID', 'NAME')
    );

    $nav->setRecordCount($rsCompany->SelectedRowsCount());

    $arResult['COUNT'] = $rsCompany -> SelectedRowsCount();

    while ($arr = $rsCompany->GetNext()) {
        $arResult['COMPANIES'][$arr['ID']] = $arr;
    }

    if (count($arResult['COMPANIES']) > 0) {
        $arElementFilter = array(
            "IBLOCK_ID" => $arParams['CATALOG_IBLOCK_ID'],
            'PROPERTY_' . $arParams['PROPERTY_CODE'] => array_keys($arResult['COMPANIES'])
        );

        if (isset($_GET['F'])) {
        $arElementFilter[] = array(
                'LOGIC' => 'OR',
                [
                    '<= PROPERTY_PRICE' => 1700,
                    'PROPERTY_MATERIAL' => 'Дерево, ткань',
                ],

                [
                    '< PROPERTY_PRICE' => 1500,
                    'PROPERTY_MATERIAL' => 'Металл, пластик'
                ]
            );
        }

        $arElementSelect = array(
            'ID',
            'NAME',
            'CODE',
            'IBLOCK_SECTION_ID',
            'PROPERTY_PRICE',
            'PROPERTY_MATERIAL',
            'PROPERTY_ARTNUMBER',
            'PROPERTY_' . $arParams['PROPERTY_CODE']
        );

        $rsElement = CIBlockElement::GetList(
            array('name' => 'asc', 'sort' => 'asc'),
            $arElementFilter,
            false,
            false,
            $arElementSelect
        );

        $minPrice = 0;
        $maxPrice = 0;

        while ($arr = $rsElement->GetNext()) {
            $price = intval($arr['PROPERTY_PRICE_VALUE']);

            if ($price > $maxPrice) {
                $maxPrice = $price;
            }
            if (($price < $minPrice) || $minPrice == 0) {
                $minPrice = $price;
            }

            foreach ($arr['PROPERTY_' . $arParams['PROPERTY_CODE'] . '_VALUE'] as $companyID) {
                $arResult['COMPANIES'][$companyID]['ITEMS'][$arr['ID']] = $arr;

                $detailPageURL = str_replace(
                    array('#SECTION_ID#', '#ELEMENT_CODE#'),
                    array($arr['IBLOCK_SECTION_ID'], $arr['CODE']),
                    $arParams['DETAIL_PAGE_TEMPLATE']
                ) . '.php';

                $arResult['COMPANIES'][$companyID]['ITEMS'][$arr['ID']]['DETAIL_PAGE_URL'] =  $detailPageURL;

                $arButtons = CIBlock::GetPanelButtons(
                    $arr["IBLOCK_ID"],
                    $arr["ID"],
                    0,
                    array("SECTION_BUTTONS"=>false, "SESSID"=>false)
                );
                $arResult['COMPANIES'][$companyID]['ITEMS'][$arr['ID']]["EDIT_LINK"] = $arButtons["edit"]["edit_element"]["ACTION_URL"];
                $arResult['COMPANIES'][$companyID]['ITEMS'][$arr['ID']]["DELETE_LINK"] = $arButtons["edit"]["delete_element"]["ACTION_URL"];
            }
        }
    }

    $arResult['NAV_STRING'] = $nav;

    $arResult['MAX_PRICE'] = $maxPrice;
    $arResult['MIN_PRICE'] = $minPrice;

    $iblockURL = '/bitrix/admin/iblock_element_admin.php?IBLOCK_ID=' . $arParams['CATALOG_IBLOCK_ID'] . '&type=products&lang=ru&find_el_y=Y';

    if ($APPLICATION->GetShowIncludeAreas())
    {
        $this->AddIncludeAreaIcons(
            Array(
                Array(
                    "ID" => "ADMIN_IBLOCK_BTN",
                    "TITLE" => "ИБ в админке",
                    "URL" => $iblockURL, //или javascript:MyJSFunction ()
                    "ICON" => "menu-delete", //CSS-класс с иконкой
                    "IN_PARAMS_MENU" => true, //показать в контекстном меню
                    "IN_MENU" => false //показать в подменю компонента
                )
            )
        );

        $arButtons = CIBlock::GetPanelButtons(
            $arParams['CATALOG_IBLOCK_ID'],
            0
        );
        $this->addIncludeAreaIcons(CIBlock::GetComponentMenu($APPLICATION->GetPublicShowMode(), $arButtons));
    }

    $this->setResultCacheKeys(array(
        'COMPANIES',
        'COUNT',
        'MAX_PRICE',
        'MIN_PRICE',
        'NAV_STRING'
    ));
    $this->IncludeComponentTemplate();
}

$title = 'Разделов: ' . $arResult['COUNT'];

$APPLICATION->SetTitle($title);


