<?php
/**
 * Created by PhpStorm.
 * User: fan
 * Date: 2015/10/31
 * Time: 13:37
 */
header('content-type:text/html;charset=utf-8');
require_once './connect.php';


$getEmail = htmlspecialchars($_GET['email']);
preg_match_all('/\w+(?=@nenu.edu.cn)/',$getEmail,$arr);
$studentID = htmlspecialchars($_GET['studentID']);


if(!empty($arr[0])){
    if($email = $arr['0']['0']){
        $sql = "SELECT id FROM vote_student WHERE studentID='$studentID' AND email='$email'";
        $rs = $mysqli->query($sql);

        if($rs->num_rows){
            $t =base64_encode($email);
            $html =<<<EOT
        <html>
           <head>
              <meta http-equiv="refresh" content="1;url=vote.php?EIOP90HA8Ge34WQ56INE7D=$t">
           </head>
           <body>
           <h1>正在登录.......</h1>

           </body>
        </html>
EOT;
            echo $html;
            exit;
        }else{
            $html =<<<EOT
        <html>
           <head>
              <meta http-equiv="refresh" content="1;url=login.html">
           </head>
           <body>
           <h1><p>你输入的信息有错误，请重新登录。</p><p>账户名为师大的邮箱（要加@nenu.edu.cn），密码为对应学号</p></h1>
           请重新登录.......
           </body>
        </html>
EOT;
            echo $html;
            exit;

        }
    }else{
        $html =<<<EOT
        <html>
           <head>
              <meta http-equiv="refresh" content="2;url=login.html">
           </head>
           <body>
           <h1><p>你输入的信息有错误，请重新登录。</p><p>账户名为师大的邮箱（要加@nenu.edu.cn），密码为对应学号</p></h1>
           请重新登录.......
           </body>
        </html>
EOT;
        echo $html;
        exit;
    }
}else{

    $html =<<<EOT
        <html>
           <head>
              <meta http-equiv="refresh" content="2;url=login.html">
           </head>
           <body>
           <h1><p>你输入的信息有错误，请重新登录。</p><p>账户名为师大的邮箱（要加@nenu.edu.cn），密码为对应学号</p></h1>
           请重新登录.......
           </body>
        </html>
EOT;
    echo $html;
    exit;
}









