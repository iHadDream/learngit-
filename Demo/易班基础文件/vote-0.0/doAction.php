<?php
/**
 * Created by PhpStorm.
 * User: fan
 * Date: 2015/10/26
 * Time: 13:21
 */
require_once 'connect.php';
require_once 'ip.php';
const N =4;

$voter_ip =$_GET['voter_ip'];
$vote_id =$_GET['vote_id'];

$flag =checkip($voter_ip);
if($flag){
    $sql ="select id from vote_vote WHERE voter_ip ='$voter_ip'";
    $rs =$mysqli->query($sql);
    $num =$rs->num_rows;

    $sql_0 ="select id from vote_vote WHERE voter_ip='$voter_ip'&&vote_id='$vote_id'";
    $rs_0 =$mysqli->query($sql_0);
    $num_0 = $rs_0->num_rows;

    if($num<N){
//        $sql_2 ="insert into vote_vote(vote_id,voter_ip) VALUES ('$vote_id','$voter_ip')";
//        $mysqli->query($sql_2);

        if($num_0<1){
            $sql_1 ="update vote_user set vote_votes=vote_votes+1  WHERE vote_id=$vote_id";
            $mysqli->query($sql_1);
        }else{
            $html =<<<EOT
        <html>
           <head>
              <meta http-equiv="refresh" content="1;url=vote.php">
           </head>
           <body>
           <h1>你已经投过他的票了，请不要重复投！</h1>
           正在跳转.......
           </body>
        </html>
EOT;
            echo $html;
            exit;
        }
        $sql_2 ="insert into vote_vote(vote_id,voter_ip) VALUES ('$vote_id','$voter_ip')";
        $mysqli->query($sql_2);


    }else{
        $html =<<<EOT
        <html>
           <head>
              <meta http-equiv="refresh" content="1;url=index.html">
           </head>
           <body>
           <h1>你已经投过4票了，最多只能投4票！</h1>
           正在跳转到首页.......
           </body>
        </html>
EOT;
        echo $html;
        exit;

    }




//        $sql_1 ="update vote_user set vote_votes=vote_votes+1  WHERE vote_id=$vote_id";
//        $mysqli->query($sql_1);

//        $sql_2 ="insert into vote_vote(vote_id,voter_ip) VALUES ('$vote_id','$voter_ip')";
//        $mysqli->query($sql_2);


    $mysqli->close();
}else{
    $html =<<<EOT
        <html>
           <head>
              <meta http-equiv="refresh" content="2;url=vote.php">
           </head>
           <body>
           <h1>少年，诚实投票呀，这么聪明，用错地方了！</h1>
           正在跳转到首页.......
           </body>
        </html>
EOT;
    echo $html;
    exit;
}



?>
<html>
<head>
    <meta http-equiv="refresh" content="2;url=vote.php">
</head>
<body>
<h1>投票成功！</h1>
正在跳转.......
</body>
</html>