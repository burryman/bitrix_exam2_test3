<?
define(PRODUCTS_IBLOCK_ID, 2);
define(META_IBLOCK_ID, 6);
define(MANAGER_GROUP_ID, 5);
define(SERVICES_IBLOCK_ID, 3);

AddEventHandler("iblock", "OnBeforeIBlockElementUpdate", "CheckViewsCounterBeforeDeactivate");

function CheckViewsCounterBeforeDeactivate(&$arFields)
{
    global $APPLICATION;

    if ($arFields['ACTIVE'] == "N" && $arFields['IBLOCK_ID'] == PRODUCTS_IBLOCK_ID) {
        $arElement = CIBlockElement::GetList(
            array(),
            array(
                'IBLOCK_ID' => $arFields['IBLOCK_ID'],
                'ID' => $arFields['ID']
            ),
            false,
            false,
            array("SHOW_COUNTER")
        )->Fetch();

        if ((intval($arElement['SHOW_COUNTER'])) > 2) {
            $APPLICATION->throwException("Товар невозможно деактивировать, у него " .
                $arElement['SHOW_COUNTER'] . " просмотров");
            return false;
        }
    }
}

AddEventHandler("iblock", "OnAfterIBlockElementUpdate", Array("ElementUpdateHandler", "clearSimpleComp3Cache"));

function clearSimpleComp3Cache(&$arFields) {
    if (intval($arFields['IBLOCK_ID']) == SERVICES_IBLOCK_ID) {
        BXClearCache(true, "/s1/intaro/simplecomp2/");
    }
}


AddEventHandler("main", "OnBeforeEventAdd", array("FeedBack", "OnBeforeFeedBackSend"));

class FeedBack
{
    function OnBeforeFeedBackSend(&$event, &$lid, &$arFields)
    {
        global $USER;

        if ($event == "FEEDBACK_FORM") {
            if ($USER->IsAuthorized()) {
                $curUser = CUser::GetByID(CUser::GetID())->GetNext();
                $arFields['AUTHOR'] = "«Пользователь авторизован: " . $curUser['ID'] .
                    "(" . $curUser['LOGIN'] . ")" . $curUser['NAME'] .
                    ", данные из формы: " . $arFields['AUTHOR'];
            } else {
                $arFields['AUTHOR'] = "Пользователь не авторизован, данные из формы: " . $arFields['AUTHOR'];
            }
            CEventLog::Add(array(
                "SEVERITY" => "SECURITY",
                "AUDIT_TYPE_ID" => "FEEDBACK",
                "MODULE_ID" => "main",
                "ITEM_ID" => $lid,
                "DESCRIPTION" => "Замена данных в отсылаемом письме – " . $arFields['AUTHOR'],
            ));
        }
    }
}

AddEventHandler("main", "OnBuildGlobalMenu", "RemoveExtraButtons");

function RemoveExtraButtons(&$aGlobalMenu, &$aModuleMenu) {
    if (CSite::InGroup(array(MANAGER_GROUP_ID))) {
        unset(
            $aGlobalMenu['global_menu_desktop']
        );
        $aModuleMenu = [$aModuleMenu[1]];
    }
}

AddEventHandler("main", "OnEpilog", "SuperSEOTool");

function SuperSEOTool(){
    global $APPLICATION;

    if (!CModule::IncludeModule('iblock')) {
        return;
    }

    $rsMeta = CIBlockElement::GetList(
        array(),
        array(
            'IBLOCK_ID' => META_IBLOCK_ID,
            'NAME' => $APPLICATION->GetCurDir(),
        ),
        false,
        false,
        array('NAME', 'PROPERTY_TITLE', 'PROPERTY_DESCRIPTION')
    );

    if ($arr = $rsMeta->Fetch()) {
        $APPLICATION->SetPageProperty('title', $arr['PROPERTY_TITLE_VALUE']);
        $APPLICATION->SetPageProperty('description', $arr['PROPERTY_DESCRIPTION_VALUE']);
    }
}
