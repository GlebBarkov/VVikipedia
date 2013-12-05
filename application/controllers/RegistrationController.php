<?php

/**
 * IndexController
 *
 * Главный контроллер сайта
 *
 * @author Александр Махомет aka San для http://zendframework.ru
 */
class RegistrationController extends Zend_Controller_Action
{

    /**
     * Отображает главную страницу
     */
    public function indexAction()
    {
        //$this->view->content = '<h1>I LOVE ZEND FRAMEWORK!</h1>';
    }

    /**
     * Страница из меню
     */
    public function saveAction()
    {

        $this->view->content = '<h1>SAVE USER</h1>';

    }

}