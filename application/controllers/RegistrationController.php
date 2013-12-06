<?php

class RegistrationController extends Zend_Controller_Action
{

    /**
     * Отображает главную страницу
     */
    public function indexAction()
    {
        //$this->view->content = '<h1></h1>';
    }


    public function saveAction()
    {
        // Получение параметра пришедшего от пользователя
        $name = $this->_getParam('name');
        $real_name = $this->_getParam('real_name');
        $email = $this->_getParam('email');
        $pass = $this->_getParam('pass');
        // Создание объекта модели, благодаря autoload нам нет необходимости подключать класс через require
        $modelRegistration = new Registration();


        $modelRegistration->setUser($real_name,$email,$pass,$name);


    }

}