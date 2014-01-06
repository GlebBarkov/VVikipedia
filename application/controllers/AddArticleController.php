<?php

/**
 * IndexController
 *
 * Главный контроллер сайта
 *
 * @author Александр Махомет aka San для http://zendframework.ru
 */
class AddArticleController extends Zend_Controller_Action
{

    /**
     * Отображает главную страницу
     */
    public function indexAction()
    {

        //$this->view->content = '<h1></h1>';
    }

    /**
     * Страница из меню
     */
    public function saveAction()
    {
        // Получение параметра пришедшего от пользователя
        $id = null;
        $author_id = $this->_getParam('author_id');
        $title = $this->_getParam('title');
        $text = $this->_getParam('text');
        $date = date("Y.m.d");


        // Создание объекта модели, благодаря autoload нам нет необходимости подключать класс через require
        $modelAddArticle = new AddArticle();

        // Выполнения метода модели по получению информации о статье
        $modelAddArticle->setUser($id,$author_id,$title,$text,$date);

        //var_dump($articleId);die;
        //return $articleId;
        //$this->view->content = $articleId;
    }

}