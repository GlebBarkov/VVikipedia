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
        $username = $this->_getParam('username');
        $real_name = $this->_getParam('real_name');
        $email = $this->_getParam('email');
        $password = md5($this->_getParam('password'));
        // Создание объекта модели, благодаря autoload нам нет необходимости подключать класс через require
        $modelRegistration = new Registration();


        $modelRegistration->setUser($real_name,$email,$password,$username);


    }

}