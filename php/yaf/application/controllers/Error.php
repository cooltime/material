<?php

/**
 * @name ErrorController
 * @author Allan Maia Fernandes
 */

class ErrorController extends Yaf\Controller_Abstract
{

    public function errorAction($exception)
    {
        // Throw for we can see using Whoops
        throw new \Exception($exception);
    }
}
