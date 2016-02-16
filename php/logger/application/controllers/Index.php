<?php
/**
 * @name IndexController
 * @author cooltime(fan.bai@changba.com)
 * @desc 默认控制器
 * @see http://www.php.net/manual/en/class.yaf-controller-abstract.php
 */
class IndexController extends PageService_Base {
    const BASE_DIR = "/home/opdir/logs/";

	public function indexAction() {

		$arrInput = $this->getRequest()->getQuery();
        $arrOuput = array();

        isset($arrInput['app']) ? $arrOutput['app'] = $arrInput['app'] : null;
        isset($arrInput['host']) ? $arrOutput['host'] = $arrInput['host'] : null;

        $startTime = strtotime(date('Y-m-d H:00:00'));
        if (isset($arrInput['ts'])) {
            $rawTime = intval($arrInput['ts']);
            if (!preg_match("/\d{10}/", $rawTime)) {
                return self::_returnJson(array(
                    'errno' => 1,
                    'errmsg' => 'invalid params',
                ));
            }

            $year = intval($rawTime / 1000000);
            $rawTime -= $year * 1000000;
            $month = intval($rawTime /10000);
            $rawTime -= $month * 10000;
            $date = intval($rawTime / 100);
            $rawTime -= $date * 100;
            $hour = intval($rawTime);

            if ($month < 1 || $month > 12 || $date < 1 || $date > 31 || 
                $hour < 1 || $hour > 23) {
                return self::_returnJson(array(
                    'errno' => 1,
                    'errmsg' => 'invalid params',
                ));
            }

            $timeStr = "$year-$month-$date $hour:00:00";
            $startTime = strtotime($timeStr);
        }

        $endTime = strtotime("+1 hour", $startTime);
        $arrOutput['startTime'] = date('Y-m-d H:i:s', $startTime);
        $arrOutput['endTime'] = date('Y-m-d H:i:s', $endTime);
        
        return self::_render('index/index.html', $arrOutput);
	}

    public function getAction() {
		$arrInput = $this->getRequest()->getQuery();
        $arrOuput = array();

        if (!isset($arrInput['app']) || !isset($arrInput['host']) || 
              !isset($arrInput['startTime']) || !isset($arrInput['endTime'])) {
            return self::_returnJson(array(
                'errno' => 1,
                'errmsg' => 'invalid params',
            ));
        }

        $tmpDate = intval(strtotime($arrInput['startTime']) / 3600) * 3600;
        $endDate = strtotime($arrInput['endTime']);
        $arrTs = array();
        do {
            array_push($arrTs, date('YmdH', $tmpDate));
            $tmpDate = strtotime("+1 hour", $tmpDate);
        } while ($tmpDate < $endDate);

        $app = $arrInput['app'];
        $host = strstr($arrInput['host'], 'host') ? 
            substr($arrInput['host'], 4) : $arrInput['host'];

        $arrContents = array();
        foreach ($arrTs as $ts) {
            $path = self::BASE_DIR . $app . "/" . $ts . "/" . $host;
            if (!file_exists($path)) {
                continue;
            }
            $arrContents = array_merge($arrContents, file($path));
        }

        return self::_returnJson(array(
            'errno' => 0,
            'data' => $arrContents,
        ));
    }
}
