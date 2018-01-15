<?
AddEventHandler("iblock", "OnBeforeIBlockElementUpdate", "CheckViewsCounterBeforeDeactivate");

function CheckViewsCounterBeforeDeactivate(&$arFields)
{
    global $APPLICATION;

    if ($arFields['ACTIVE'] == "N") {
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
