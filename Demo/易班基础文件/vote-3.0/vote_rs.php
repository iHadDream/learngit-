<?php
/**
 * Created by PhpStorm.
 * User: fan
 * Date: 2015/11/7
 * Time: 4:19
 */
header('content-type:text/html;charset=utf-8');
require_once 'connect.php';

$sql_1 ="SELECT vote_id,vote_name,vote_votes FROM vote_user";
$rs_1 = $mysqli->query($sql_1);
$filed = $rs_1->fetch_all(MYSQLI_ASSOC);

?>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>toupiao</title>

    <link href="css/style3.css" rel="stylesheet" type="text/css" />

    <script type="text/javascript" src="js/jquery1.js"></script>
    <script type="text/javascript" src="js/script1.js"></script>
    <style>
        #popupcontent{position: absolute;visibility: hidden;overflow:auto;border:1px solid #CCC;background-color:#F9F9F9;border:1px solid #333;padding:5px; z-index:1000; width:500px; height:0px;
            left:50%;/*FF IE7*/
            top: 50%;/*FF IE7*/

            margin-left:-250px!important;/*FF IE7 该值为本身宽的一半 */
            margin-top:-250px!important;/*FF IE7 该值为本身高的一半*/

            margin-top:0px;

            position:fixed!important;/*FF IE7*/
            position:absolute;/*IE6*/

            _top:expression(eval(document.compatMode &&document.compatMode=='CSS1Compat')?
documentElement.scrollTop + (document.documentElement.clientHeight-this.offsetHeight)/2 :/*IE6*/document.body.scrollTop + (document.body.clientHeight - this.clientHeight)/2);/*IE5 IE5.5*/


        }
        body,td,th {
            font-size: 10pt;
        }
        .nav{width:985px;margin:0 auto; text-align:center;font:normal 16px/34px "微软雅黑";color:#fff;height:34px;background:#31708f; /* for non-css3 browsers */
        }
        .nav a{font:bold 14px/34px "宋体";color:#fff;margin:0 35px;}
        #cleft{
            float:left;
            width:750px;
            background:#FFF;
            padding:10px;}
        #cleft ul{ width:750px; float:left; margin:10px 0;}
        h3{color:#fff;font-weight:bold;height:22px;line-height:22px;padding:0 10px;
            background: #31708f; /* for non-css3 browsers */}
        .img_a{clear:both;}
        .img_a li{ height:190px;width:105px;text-align:center; float:left;color:#333;font-weight:bold;margin:15px 8px 0 8px;line-height:17px; display:inline; overflow:hidden;font-size:12px;}
        .img_a li img{border:1px solid #ccc;margin-bottom:3px;padding:2px;}
        .img_a li input{ vertical-align:middle;}
        .img_a li span{ display:block;}
        .img_a li span img{border:none;margin-top:3px;}
        h3{font-size:14px;}
        h1,h2,h3,h4,h5,h6{font:normal 12px/180% "宋体"; text-align:left;font-weight:bolder;}
        .r_a{
            font-size: 16px;
            font-weight: bold;
            color: #7E7C7C;
        }
        .r_a a{color:#222222;}
        .r_a img{margin:5px 0;}
        .user_info{width:600px; float:left; clear:both; padding-left:80px;}
        .user_info i{ font-style:normal; }
    </style>
</head>
<body style="background-color:#DEF0FC">
<div style="background-color:#FFF;margin:0 auto;height:35px; line-height:35px;">
    <div style="width:1000px;margin:0 auto; background-color:#FFF; list-style-type:none;height:35px; line-height:35px;">
    </div></div>
<div style="margin:0 auto; text-align:center; width:980px;">
    <img src="images/16.jpg">
</div><div style="clear:both"></div>
<div class="nav" ><a href="vote.php">最新投票</a>|<a href="huigu.html">往期回顾</a></div>
<div style="width:180px;border:1px solid #c6c3c3;padding:5px;margin-top:40px;margin-right:185px; float:right; background:#fff;display:inline; overflow:hidden;line-height:200%;">
    <h3>欢迎:&nbsp;&nbsp;同学</h3>
    <div class="r_a">请遵守投票规则，如有发现刷票行为，学生处有权取消该同学资格！</div>
    <h3>投票规则：</h3>
    <b style="display:block;line-height:26px;">1.投票时间 </b>11月9日8时—11月13日24时，为期5天。 <b style="display:block;line-height:26px;">2.投票范围 </b>主办单位公布的候选人，候选人按姓氏笔画排序。 <b style="display:block;line-height:26px;">3.投票方式 </b> <b style="display:block;line-height:26px;"><font color="#FF0000">务请注意：网络投票每人每次最多选择10名入围候选人 。</font></b>点击入围候选人照片下方的投票框，严禁利用任何不正当的手段刷票或者投票，一经查实违规行为将扣除存疑票数。 <br \>
    <h3>主办单位：</h3>
    <div class="r_a"> <p><a href="#">东北师范大学</a></p>
        <p><a href="#">党委学生工作部学生处</a></p></div>
</div>
<div class="itagBox">
    <ul class="artist_l">
        <li class="tag1">
            <div class="votetext">
                <div class="tag_txt">
                    <img src="images/img/zmx.jpg">
                </div>
                <a style="position:absolute;left:0px;top:0px; overflow-y: auto;  line-height:20px;text-align:center;padding-top:5px;display:block;color:#000;width:100%;height:145px; filter:alpha(opacity=50);background:#FFF;opacity:0.5;  background:#FFF;"href="16-zhangmx.html">
                    <?php echo $filed['0']['vote_name']?>
                </a>
            </div>
            <div class="votedo">
                <div class="cvotenum"><b><?php echo $filed['0']['vote_votes']?></b>票</div>
            </div>
        </li>
        <li class="tag1 ">
            <div class="votetext">
                <div class="tag_txt">
                    <img src="images/img/mp.jpg">
                </div>
                <a style="position:absolute;left:0px;top:0px; overflow-y: auto;  line-height:20px;text-align:center;padding-top:5px;display:block;color:#000;width:100%;height:145px; filter:alpha(opacity=50);background:#FFF;opacity:0.5;  background:#FFF;"href="16-zhangmx.html">
                    <?php echo $filed['1']['vote_name']?>
                </a>
            </div> <div class="votedo">
                <div class="cvotenum"><b><?php echo $filed['1']['vote_votes']?></b>票</div>
            </div>
        </li>
        <li class="tag1"> <div class="votetext">
                <div class="tag_txt">
                    <img src="images/img/lxy.jpg">
                </div>
                <a style="position:absolute;left:0px;top:0px; overflow-y: auto;  line-height:20px;text-align:center;padding-top:5px;display:block;color:#000;width:100%;height:145px; filter:alpha(opacity=50);background:#FFF;opacity:0.5;  background:#FFF;"href="16-zhangmx.html"> <?php echo $filed['2']['vote_name']?></a>
            </div>
            <div class="votedo">
                <div class="cvotenum"><b><?php echo $filed['2']['vote_votes']?></b>票</div>
            </div>
        </li>
        <li class="tag1 "> <div class="votetext">
                <div class="tag_txt">
                    <img src="images/img/xf.jpg">
                </div>
                <a style="position:absolute;left:0px;top:0px; overflow-y: auto;  line-height:20px;text-align:center;padding-top:5px;display:block;color:#000;width:100%;height:145px; filter:alpha(opacity=50);background:#FFF;opacity:0.5;  background:#FFF;"href="16-zhangmx.html">  <?php echo $filed['3']['vote_name']?></a>
            </div> <div class="votedo">
                <div class="cvotenum"><b><?php echo $filed['3']['vote_votes']?></b>票</div>
            </div>
        </li>
        <li class="tag1"> <div class="votetext">
                <div class="tag_txt">
                    <img src="images/img/ljy.png">
                </div>
                <a style="position:absolute;left:0px;top:0px; overflow-y: auto;  line-height:20px;text-align:center;padding-top:5px;display:block;color:#000;width:100%;height:145px; filter:alpha(opacity=50);background:#FFF;opacity:0.5;  background:#FFF;"href="16-zhangmx.html">  <?php echo $filed['4']['vote_name']?></a>
            </div> <div class="votedo">
                <div class="cvotenum"><b><?php echo $filed['4']['vote_votes']?></b>票</div>
            </div>
        </li>
        <li class="tag1"> <div class="votetext">
                <div class="tag_txt">
                    <img src="images/img/lyc.jpg">
                </div>
                <a style="position:absolute;left:0px;top:0px; overflow-y: auto;  line-height:20px;text-align:center;padding-top:5px;display:block;color:#000;width:100%;height:145px; filter:alpha(opacity=50);background:#FFF;opacity:0.5;  background:#FFF;"href="16-zhangmx.html">  <?php echo $filed['5']['vote_name']?></a>
            </div> <div class="votedo">
                <div class="cvotenum"><b><?php echo $filed['5']['vote_votes']?></b>票</div>
            </div>
        </li>
        <li class="tag1"> <div class="votetext">
                <div class="tag_txt">
                    <img src="images/img/znn.jpg">
                </div>
                <a style="position:absolute;left:0px;top:0px; overflow-y: auto;  line-height:20px;text-align:center;padding-top:5px;display:block;color:#000;width:100%;height:145px; filter:alpha(opacity=50);background:#FFF;opacity:0.5;  background:#FFF;"href="16-zhangmx.html"> <?php echo $filed['6']['vote_name']?></a>
            </div> <div class="votedo">
                <div class="cvotenum"><b><?php echo $filed['6']['vote_votes']?></b>票</div>
            </div>
        </li>
        <li class="tag1 "> <div class="votetext">
                <div class="tag_txt">
                    <img src="images/img/xh.jpg">
                </div>
                <a style="position:absolute;left:0px;top:0px; overflow-y: auto;  line-height:20px;text-align:center;padding-top:5px;display:block;color:#000;width:100%;height:145px; filter:alpha(opacity=50);background:#FFF;opacity:0.5;  background:#FFF;"href="16-zhangmx.html"> <?php echo $filed['7']['vote_name']?></a>
            </div> <div class="votedo">
                <div class="cvotenum"><b><?php echo $filed['7']['vote_votes']?></b>票</div>
            </div>
        </li>
        <li class="tag1"> <div class="votetext">
                <div class="tag_txt">
                    <img src="images/img/ln.jpg">
                </div>
                <a style="position:absolute;left:0px;top:0px; overflow-y: auto;  line-height:20px;text-align:center;padding-top:5px;display:block;color:#000;width:100%;height:145px; filter:alpha(opacity=50);background:#FFF;opacity:0.5;  background:#FFF;"href="16-zhangmx.html">  <?php echo $filed['8']['vote_name']?></a>
            </div> <div class="votedo">
                <div class="cvotenum"><b><?php echo $filed['8']['vote_votes']?></b>票</div>
            </div>
        </li>
        <li class="tag1 "> <div class="votetext">
                <div class="tag_txt">
                    <img src="images/img/syr.jpg">
                </div>
                <a style="position:absolute;left:0px;top:0px; overflow-y: auto;  line-height:20px;text-align:center;padding-top:5px;display:block;color:#000;width:100%;height:145px; filter:alpha(opacity=50);background:#FFF;opacity:0.5;  background:#FFF;"href="16-zhangmx.html">  <?php echo $filed['9']['vote_name']?></a>
            </div> <div class="votedo">
                <div class="cvotenum"><b><?php echo $filed['9']['vote_votes']?></b>票</div>
            </div>
        </li>
        <li class="tag1 "> <div class="votetext">
                <div class="tag_txt">
                    <img src="images/img/zxh.jpg">
                </div>
                <a style="position:absolute;left:0px;top:0px; overflow-y: auto;  line-height:20px;text-align:center;padding-top:5px;display:block;color:#000;width:100%;height:145px; filter:alpha(opacity=50);background:#FFF;opacity:0.5;  background:#FFF;"href="16-zhangmx.html">  <?php echo $filed['10']['vote_name']?></a>
            </div> <div class="votedo">
                <div class="cvotenum"><b><?php echo $filed['10']['vote_votes']?></b>票</div>
            </div>
        </li>
        <li class="tag1 "> <div class="votetext">
                <div class="tag_txt">
                    <img src="images/img/wh.jpg">
                </div>
                <a style="position:absolute;left:0px;top:0px; overflow-y: auto;  line-height:20px;text-align:center;padding-top:5px;display:block;color:#000;width:100%;height:145px; filter:alpha(opacity=50);background:#FFF;opacity:0.5;  background:#FFF;"href="16-zhangmx.html">  <?php echo $filed['11']['vote_name']?></a>
            </div> <div class="votedo">
                <div class="cvotenum"><b><?php echo $filed['11']['vote_votes']?></b>票</div>
            </div>
        </li>
        <li class="tag1 "> <div class="votetext">
                <div class="tag_txt">
                    <img src="images/img/jby.jpg">
                </div>
                <a style="position:absolute;left:0px;top:0px; overflow-y: auto;  line-height:20px;text-align:center;padding-top:5px;display:block;color:#000;width:100%;height:145px; filter:alpha(opacity=50);background:#FFF;opacity:0.5;  background:#FFF;"href="16-zhangmx.html">  <?php echo $filed['12']['vote_name']?></a>
            </div> <div class="votedo">
                <div class="cvotenum"><b><?php echo $filed['12']['vote_votes']?></b>票</div>
            </div>
        </li>
        <li class="tag1 "> <div class="votetext">
                <div class="tag_txt">
                    <img src="images/img/fsj.jpg">
                </div>
                <a style="position:absolute;left:0px;top:0px; overflow-y: auto;  line-height:20px;text-align:center;padding-top:5px;display:block;color:#000;width:100%;height:145px; filter:alpha(opacity=50);background:#FFF;opacity:0.5;  background:#FFF;"href="16-zhangmx.html"> <?php echo $filed['13']['vote_name']?></a>
            </div> <div class="votedo">
                <div class="cvotenum"><b><?php echo $filed['13']['vote_votes']?></b>票</div>
            </div>
        </li>
        <li class="tag1 "> <div class="votetext">
                <div class="tag_txt">
                    <img src="images/img/lyt.jpg">
                </div>
                <a style="position:absolute;left:0px;top:0px; overflow-y: auto;  line-height:20px;text-align:center;padding-top:5px;display:block;color:#000;width:100%;height:145px; filter:alpha(opacity=50);background:#FFF;opacity:0.5;  background:#FFF;"href="16-zhangmx.html">  <?php echo $filed['14']['vote_name']?></a>
            </div> <div class="votedo">
                <div class="cvotenum"><b><?php echo $filed['14']['vote_votes']?></b>票</div>
            </div>
        </li>
        <li class="tag1 "> <div class="votetext">
                <div class="tag_txt">
                    <img src="images/img/lyt.jpg">
                </div>
                <a style="position:absolute;left:0px;top:0px; overflow-y: auto;  line-height:20px;text-align:center;padding-top:5px;display:block;color:#000;width:100%;height:145px; filter:alpha(opacity=50);background:#FFF;opacity:0.5;  background:#FFF;"href="16-zhangmx.html">  <?php echo $filed['15']['vote_name']?></a>
            </div> <div class="votedo">
                <div class="cvotenum"><b><?php echo $filed['15']['vote_votes']?></b>票</div>
            </div>
        </li>
        <li class="tag1 "> <div class="votetext">
                <div class="tag_txt">
                    <img src="images/img/lyt.jpg">
                </div>
                <a style="position:absolute;left:0px;top:0px; overflow-y: auto;  line-height:20px;text-align:center;padding-top:5px;display:block;color:#000;width:100%;height:145px; filter:alpha(opacity=50);background:#FFF;opacity:0.5;  background:#FFF;"href="16-zhangmx.html">  <?php echo $filed['16']['vote_name']?></a>
            </div> <div class="votedo">
                <div class="cvotenum"><b><?php echo $filed['16']['vote_votes']?></b>票</div>
            </div>
        </li>
        <li class="tag1 "> <div class="votetext">
                <div class="tag_txt">
                    <img src="images/img/lyt.jpg">
                </div>
                <a style="position:absolute;left:0px;top:0px; overflow-y: auto;  line-height:20px;text-align:center;padding-top:5px;display:block;color:#000;width:100%;height:145px; filter:alpha(opacity=50);background:#FFF;opacity:0.5;  background:#FFF;"href="16-zhangmx.html">  <?php echo $filed['17']['vote_name']?></a>
            </div> <div class="votedo">
                <div class="cvotenum"><b><?php echo $filed['17']['vote_votes']?></b>票</div>
            </div>
        </li>
        <li class="tag1 "> <div class="votetext">
                <div class="tag_txt">
                    <img src="images/img/lyt.jpg">
                </div>
                <a style="position:absolute;left:0px;top:0px; overflow-y: auto;  line-height:20px;text-align:center;padding-top:5px;display:block;color:#000;width:100%;height:145px; filter:alpha(opacity=50);background:#FFF;opacity:0.5;  background:#FFF;"href="16-zhangmx.html"> <?php echo $filed['18']['vote_name']?></a>
            </div> <div class="votedo">
                <div class="cvotenum"><b><?php echo $filed['18']['vote_votes']?></b>票</div>
            </div>
        </li>
        <li class="tag1 "> <div class="votetext">
                <div class="tag_txt">
                    <img src="images/img/lyt.jpg">
                </div>
                <a style="position:absolute;left:0px;top:0px; overflow-y: auto;  line-height:20px;text-align:center;padding-top:5px;display:block;color:#000;width:100%;height:145px; filter:alpha(opacity=50);background:#FFF;opacity:0.5;  background:#FFF;"href="16-zhangmx.html">  <?php echo $filed['19']['vote_name']?></a>
            </div> <div class="votedo">
                <div class="cvotenum"><b><?php echo $filed['19']['vote_votes']?></b>票</div>
            </div>
        </li>
    </ul>
</div>
</body>
</html>
