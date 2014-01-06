<?php
require_once 'Zend/Controller/Action.php';
require_once 'Zend/Auth.php';
require_once 'Zend/Auth/Adapter/DbTable.php';
class UserController extends Zend_Controller_Action
{
    public function indexAction()
    {
        $request = $this->getRequest();
        $auth		= Zend_Auth::getInstance();
        if(!$auth->hasIdentity()){
            $this->_redirect('/user/loginform');
        }else{
            $this->_redirect('/user/userpage');
        }
    }

    public function loginformAction()
    {
        $request = $this->getRequest();
        $auth		= Zend_Auth::getInstance();
        if($auth->hasIdentity()){
            $this->_redirect('/user/userpage');
        }
    }

  public function authAction(){
      $request 	= $this->getRequest();
      $registry 	= Zend_Registry::getInstance();
      $auth		= Zend_Auth::getInstance();
      $DB = $registry['db'];

      $authAdapter = new Zend_Auth_Adapter_DbTable($DB);
      $authAdapter->setTableName('users')
          ->setIdentityColumn('username')
          ->setCredentialColumn('password');

      // Set the input credential values
      $uname = $request->getParam('username');
      $paswd = $request->getParam('password');
      $authAdapter->setIdentity($uname);
      $authAdapter->setCredential(md5($paswd));

      // Perform the authentication query, saving the result
      $result = $auth->authenticate($authAdapter);

      if($result->isValid()){
          //print_r($result);
          $data = $authAdapter->getResultRowObject(null,'password');
          $auth->getStorage()->write($data);
          $this->_redirect('/user/userpage');
      }else{
          return json_encode(false);
      }
  }
  public function nameAction()
  {
    $request = $this->getRequest();

    $this->view->assign('name', $request->getParam('username'));
    $this->view->assign('gender', $request->getParam('gender'));
    $this->view->assign('title', 'User Name');
  }

    public function articleAction()
    {
        $request = $this->getRequest();
        $auth		= Zend_Auth::getInstance();
        if(!$auth->hasIdentity()){
            $this->_redirect('/user/loginform');
        }
    }

    public function addarticleAction()
    {
        $auth		= Zend_Auth::getInstance();
        $username	= $auth->getIdentity()->username;
        // Получение параметра пришедшего от пользователя
        $registrationModel = new Registration();
        $userid = $registrationModel->getId($username);
        $userid = $userid['id'];
        $author_id = $userid;
        $title = $this->_getParam('title');
        $text = $this->_getParam('text');
        $date = date("Y.m.d");


        // Создание объекта модели, благодаря autoload нам нет необходимости подключать класс через require
        $modelAddArticle = new AddArticle();

        // Выполнения метода модели по получению информации о статье
        $modelAddArticle->setUser($author_id,$title,$text,$date);

        //var_dump($articleId);die;
        //return $articleId;
        //$this->view->content = $articleId;
    }

    public function myarticleAction() {

        $auth		= Zend_Auth::getInstance();
        $username	= $auth->getIdentity()->username;
        // Получение параметра пришедшего от пользователя
        $registrationModel = new Registration();
        $userid = $registrationModel->getId($username);
        $userid = $userid['id'];

        $articleModel = new Articles();
        $myarticles = $articleModel->getmyArticles((int)$userid);

        $this->view->content = $myarticles;
    }

  public function registerAction()
  {
    $request = $this->getRequest();

    $this->view->assign('action',"process");
    $this->view->assign('title','Member Registration');
    $this->view->assign('label_fname','First Name');
    $this->view->assign('label_lname','Last Name');
    $this->view->assign('label_uname','User Name');
    $this->view->assign('label_pass','Password');
    $this->view->assign('label_submit','Register');
    $this->view->assign('description','Please enter this form completely:');
  }
  public function editAction()
  {
    $registry = Zend_Registry::getInstance();
    $db = $registry['db'];
    $request = $this->getRequest();
    $id      = $request->getParam("id");
    $sql = "SELECT * FROM `user` WHERE id='".$id."'";
    $result = $db->fetchRow($sql);

    $this->view->assign('data',$result);
    $this->view->assign('action', $request->getBaseURL()."/user/processedit");
    $this->view->assign('title','Member Editing');
    $this->view->assign('label_fname','First Name');
    $this->view->assign('label_lname','Last Name');
    $this->view->assign('label_uname','User Name');
    $this->view->assign('label_pass','Password');
    $this->view->assign('label_submit','Edit');
    $this->view->assign('description','Please update this form completely:');
  }



  public function processAction()
  {
    $registry = Zend_Registry::getInstance();
    $db = $registry['db'];
    $request = $this->getRequest();
    $data = array('first_name' => $request->getParam('first_name'),

                  'last_name' => $request->getParam('last_name'),

                  'user_name' => $request->getParam('user_name'),

                  'password' => md5($request->getParam('password'))
                  );

    $db->insert('user', $data);
    $this->view->assign('title','Registration Process');
    $this->view->assign('description','Registration succes');
  }



  public function listAction()
  {
    $registry = Zend_Registry::getInstance();
    $db = $registry['db'];
    $sql = "SELECT * FROM `user` ORDER BY user_name ASC";
    $result = $db->fetchAssoc($sql);

    $this->view->assign('title','Member List');
    $this->view->assign('description','Below, our members:');
    $this->view->assign('datas',$result);
  }



  public function processeditAction()
  {
    $registry = Zend_Registry::getInstance();
    $db = $registry['db'];
    $request = $this->getRequest();
    $data = array('first_name' => $request->getParam('first_name'),
                  'last_name' => $request->getParam('last_name'),
                  'user_name' => $request->getParam('user_name'),
                  'password' => md5($request->getParam('password'))
                  );

    $db->update('user', $data,'id = '.$request->getParam('id'));

    $this->view->assign('title','Editing Process');
    $this->view->assign('description','Editing succes');
  }



  public function delAction()
  {
    $registry = Zend_Registry::getInstance();
    $db = $registry['db'];
   $request = $this->getRequest();
    $db->delete('user', 'id = '.$request->getParam('id'));

    $this->view->assign('title','Delete Data');
    $this->view->assign('description','Deleting succes');
    $this->view->assign('list',$request->getBaseURL()."/user/list");
  }

    public function userpageAction(){
        $auth		= Zend_Auth::getInstance();

        if(!$auth->hasIdentity()){
            $this->_redirect('/user/loginform');
            $isLogin = false;
        } else {
            $isLogin = true;
        }

        $request = $this->getRequest();
        $user		= $auth->getIdentity();
        $real_name	= $user->real_name;
        $username	= $user->username;
        $logoutUrl  = $request->getBaseURL().'/user/logout';

        $this->view->assign('username', $username);
        $this->view->assign('real_name', $real_name);
        $this->view->assign('urllogout',$logoutUrl);
        return $isLogin;
    }
    public function logoutAction()
    {
        $auth = Zend_Auth::getInstance();
        $auth->clearIdentity();
        $this->_redirect('/user');
    }
}
?>
