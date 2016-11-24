<?php
/**
 * Created by PhpStorm.
 * User: fan
 * Date: 2015/11/6
 * Time: 23:29
 */
header('content-type=text/html;charset=utf-8');

$mysqli = new mysqli('localhost','root','','lxycc');

if($mysqli->connect_errno){
    echo '数据库连接错误！';
    exit;
}

$mysqli->set_charset('utf8');

