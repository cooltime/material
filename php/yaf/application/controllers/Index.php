<?php
/**
 * @name IndexController
 * @author cooltime(fan.bai@changba.com)
 * @desc 默认控制器
 * @see http://www.php.net/manual/en/class.yaf-controller-abstract.php
 */
class IndexController extends PageService_Base {

	public function indexAction() {

		$arrInput = $this->getRequest()->getQuery();
        $arrOuput = array();

        return self::_render('index/index.html', $arrOutput);
	}

    public function getAction() {
		$arrInput = $this->getRequest()->getQuery();
        $arrOuput = array();

        return self::_returnJson(array(
            'errno' => 0,
            'data' => $arrOutput,
        ));
    }
}
