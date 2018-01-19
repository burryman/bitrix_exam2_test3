<? if (!defined("B_PROLOG_INCLUDED") || B_PROLOG_INCLUDED!==true) die();
use Bitrix\Main\Loader;
global $USER;

if (!Loader::includeModule('iblock')) {
    return;
}

if (intval($arParams['NEWS_IBLOCK_ID']) > 0) {
    $arParams['NEWS_IBLOCK_ID'] = intval($arParams['NEWS_IBLOCK_ID']);
} else {
    $arResult['ERRORS'][] = 'Укажите ID инфоблока с новостями';
}

if (! isset($arParams['AUTHOR_PROPERTY_CODE'])) {
    $arResult['ERRORS'][] = 'Укажите код свойтсва автора в инфоблоке новостей';
}

if (! isset($arParams['USER_PROPERTY_CODE'])) {
    $arResult['ERRORS'][] = 'Укажите код свойства групп авторов';
}

if (count($arResult['ERRORS']) > 0) {
    foreach ($arResult['ERRORS'] as $error) {
        echo $error . '<br>';
    }
    return;
}

if ($this->StartResultCache(false)) {
    if (!Loader::includeModule('iblock')) {
        $this->abortResultCache();
        return;
    }

    if (!$USER->IsAuthorized()) {
        $this->abortResultCache();
        ShowError("Авторизируйтесь, чтобы увидеть список авторов");
        return;
    }

    $arCurUser = $USER->GetList(
        $by=false,
        $order=false,
        array('ID' => $USER->GetID()),
        array('SELECT' => array('ID', 'LOGIN', $arParams['USER_PROPERTY_CODE']), 'FIELDS' => array('ID', 'LOGIN', $arParams['USER_PROPERTY_CODE']))
    )->Fetch();

    $rsUsers = $USER->GetList(
        $by= "id",
        $order= "asc",
        array("!ID" => $arCurUser['ID'], $arParams['USER_PROPERTY_CODE'] => $arCurUser[$arParams['USER_PROPERTY_CODE']]),
        array('SELECT' => array($arParams['USER_PROPERTY_CODE']), 'FIELDS' => array('ID', 'LOGIN', $arParams['USER_PROPERTY_CODE']))
    );

    while ($arr = $rsUsers->GetNext()) {
        $arResult['USERS'][$arr['ID']] = $arr;
    }

    $rsNews = CIBlockElement::GetList(
        array(),
        array(
            'IBLOCK_ID' => $arParams['NEWS_IBLOCK_ID'],
            'PROPERTY_' . $arParams['AUTHOR_PROPERTY_CODE'] => array_keys($arResult['USERS']),
        ),
        false,
        false,
        array('ID', 'NAME', 'ACTIVE_FROM', 'PROPERTY_' . $arParams['AUTHOR_PROPERTY_CODE'])
    );

    $arResult['COUNT'] = $rsNews->SelectedRowsCount();

    while ($arr = $rsNews->GetNext()) {
        if(in_array($arCurUser['ID'], $arr['PROPERTY_' . $arParams['AUTHOR_PROPERTY_CODE'] . '_VALUE']) == false) {
            foreach ($arr['PROPERTY_' . $arParams['AUTHOR_PROPERTY_CODE'] . '_VALUE'] as $authorID) {
                if (in_array($authorID, array_keys($arResult['USERS']))) {
                    $arResult['USERS'][$authorID]['ITEMS'][$arr['ID']] = $arr;
                }
            }
        }
    }

    $this->setResultCacheKeys(array(
        'USERS',
        'COUNT'
    ));
    $this->IncludeComponentTemplate();
}

$title = 'Выбранных новостей: ' . $arResult['COUNT'];

$APPLICATION->SetTitle($title);


