<?php

abstract class PageService_Base extends Yaf_Controller_Abstract {

    protected function _returnJson(array $arrRet) {
        $ret = json_encode($arrRet);
        echo $ret;
        return false;
    }

    protected function _render($template, $arrOutput) {
        echo $this->getView()->render($template, array('pageData' => $arrOutput));
        return false;
    }

}
