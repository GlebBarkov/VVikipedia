<?php

/**
 * Articles
 *
 * Работа с статьями
 *
 * @author Александр Махомет aka San для http://zendframework.ru
 */
class Registration extends Zend_Db_Table_Abstract
{

    /**
     * Имя таблицы
     * @var string
     */
    protected $_name = 'users';


    /**
     * Получить все статьи или одну
     *
     * @param int $articleId Идентификатор статьи
     * @return array
     */
    public function setUser($real_name,$email,$password,$username)
    {
        $table = new Registration();
        $data = array(
            'username' => $username,
            'real_name' => $real_name,
            'password' => $password,
            'email' => $email,
        );
        $table->insert($data);


    }

}