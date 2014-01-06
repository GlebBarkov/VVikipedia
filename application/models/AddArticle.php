<?php

/**
 * Articles
 *
 * Работа с статьями
 *
 * @author Александр Махомет aka San для http://zendframework.ru
 */
class AddArticle extends Zend_Db_Table_Abstract
{

    /**
     * Имя таблицы
     * @var string
     */
    protected $_name = 'articles';

    /**
     * Получить все статьи или одну
     *
     * @param int $articleId Идентификатор статьи
     * @return array
     */
    public function setUser($id,$author_id,$title,$text,$date)
    {
        $table = new AddArticle();
        $data = array(
            'id' => $id,
            'author_id' => $author_id,
            'title' => $title,
            'text' => $text,
            'date' => $date
        );
        $table->insert($data);


    }

}