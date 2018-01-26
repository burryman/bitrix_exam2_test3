<?
if (!defined("B_PROLOG_INCLUDED") || B_PROLOG_INCLUDED!==true) die();?>

Фильтр: <a href="<?= $APPLICATION->GetCurDir() . '?F=Y' ?>"><?= $APPLICATION->GetCurDir() . '?F=Y' ?></a>

<br>
<b>Каталог:</b>
<br>

<ul>
<? foreach ($arResult['COMPANIES'] as $company): ?>
    <li><?= '<b>' . $company['NAME'] . '</b>' ?></li>

    <ul>
        <? foreach ($company['ITEMS'] as $item): ?>
            <?
            $this->AddEditAction($company['ID'] . '_' . $item['ID'], $item['EDIT_LINK'], CIBlock::GetArrayByID($item["IBLOCK_ID"], "ELEMENT_EDIT"));
            $this->AddDeleteAction($company['ID'] . '_' . $item['ID'], $item['DELETE_LINK'], CIBlock::GetArrayByID($item["IBLOCK_ID"], "ELEMENT_DELETE"), array("CONFIRM" => GetMessage('CT_BNL_ELEMENT_DELETE_CONFIRM')));

            $itemProps = implode(' - ', array(
                $item['PROPERTY_PRICE_VALUE'],
                $item['PROPERTY_MATERIAL_VALUE']
            ));
            ?>
            <li id="<?=$this->GetEditAreaId($company['ID'] . '_' . $item['ID']);?>"><?= $item['NAME'] . ' - ' . $itemProps . ' (' . $item['DETAIL_PAGE_URL'] . ')' ?></li>
        <? endforeach ?>
    </ul>
<? endforeach ?>
</ul>

<? $this->SetViewTarget('exam') ?>
    <div style="color:red; margin: 34px 15px 35px 15px">
        <?= 'Максимальная цена: ' . $arResult['MAX_PRICE'] ?> <br>
        <?= 'Минимальная цена: ' . $arResult['MIN_PRICE'] ?>
    </div>
<? $this->EndViewTarget('exam') ?>
