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
