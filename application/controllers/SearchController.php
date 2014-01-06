<?php

class SearchController extends Zend_Controller_Action
{

    public function indexAction()
    {

    }

    public function saveAction()
    {
        // Получение параметра пришедшего от пользователя
        $login = $this->_getParam('search');



        // Создание объекта модели, благодаря autoload нам нет необходимости подключать класс через require
        $modelSearch = new Search();

        // Выполнения метода модели по получению информации о статье
        $modelSearch->setUser($search);

        //var_dump($articleId);die;
        //return $articleId;
        //$this->view->content = $articleId;
    }

}