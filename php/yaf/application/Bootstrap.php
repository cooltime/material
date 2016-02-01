<?php

/**
 * @name Bootstrap
 * @author Allan Maia Fernandes
 */

use Illuminate\Database\Capsule\Manager as Capsule;

class Bootstrap extends Yaf\Bootstrap_Abstract
{

    /**
     * Storing config into Yaf\Registry
     *
     * @param Yaf_Dispatcher $dispatcher
     */
    protected function _initConfig(Yaf\Dispatcher $dispatcher)
    {
        Yaf\Registry::set('config', Yaf\Application::app()->getConfig());
    }

    /**
     * Using whoops as error handling
     *
     * @param Yaf_Dispatcher $dispatcher
     */
    protected function _initWhoops(Yaf\Dispatcher $dispatcher)
    {
        $whoops = new \Whoops\Run;

        $whoops->pushHandler(new \Whoops\Handler\PrettyPageHandler);
        $whoops->register();
    }

    /**
     * Using twig as templating engine
     *
     * @param Yaf_Dispatcher $dispatcher
     */
    protected function _initView(Yaf\Dispatcher $dispatcher)
    {
        $view = new Cooltime\View\Twig(APPLICATION_PATH . "/application/views", 
            Yaf\Application::app()->getConfig()->twig->toArray());
        $dispatcher->setView($view);
    }

    /**
     * Initialize illuminate/database
     *
     * @param Yaf\Dispatcher $dispatcher
     */
    protected function _initORM(Yaf\Dispatcher $dispatcher)
    {
        $dbConfig = Yaf\Application::app()->getConfig()->database->toArray();

        $db = new Capsule();
        $db->addConnection($dbConfig);

        $db->bootEloquent();

        Yaf\Registry::set('db', $db->getConnection());
    }

    protected function _initLogger(Yaf\Dispatcher $dispatcher) {
        $logConfig = Yaf\Application::app()->getConfig->logger->toArray();


    }

}
