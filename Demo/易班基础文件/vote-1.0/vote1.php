<?php
/**
 * Created by PhpStorm.
 * User: fan
 * Date: 2015/11/1
 * Time: 10:33
 */
require_once 'connect.php';
$email =htmlspecialchars($_GET['邮箱']);

$sql ="SELECT studentID FROM vote_student WHERE email='$email'";
$rs = $mysqli ->query($sql);
$s = $rs->fetch_assoc();
$studentID =$s['studentID'];

$sql_1 ="SELECT vote_name,vote_votes FROM vote_user";
$re_1 = $mysqli->query($sql_1);
$fields = $re_1->fetch_all(MYSQLI_ASSOC);

?>
<!DOCTYPE html>
<html lang="en">
<head>
        <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
        <title>toupiao</title>

        <link href="css/style1.css" rel="stylesheet" type="text/css" />

        <script type="text/javascript" src="js/jquery1.js"></script>
        <script type="text/javascript" src="js/script1.js"></script>
        <script type="text/javascript" src="data/config.js"></script>
        <script type="text/javascript" src="images/js/jquery.min.js"></script>
        <script type="text/javascript" src="images/js/css.js"></script>
        <script type="text/javascript" src="images/js/common.js"></script>
        <script type="text/javascript" src="images/js/login.js"></script>
        <script type="text/javascript" src="images/js/validator.js"></script>
        <script type="text/javascript">
        window.onload = function(){
            var _forbidcheckselects = document.getElementsByName("votedata"),banNums = 5;
            for(var i in _forbidcheckselects){
                _forbidcheckselects[i].onclick= function(){
                    var
                    _forbidcheckselects = document.getElementsByName("votedata"),selectNum = 0;
                    for(var i in _forbidcheckselects){
                        if(i == "length")break;
                        if( _forbidcheckselects[i].checked){
                            selectNum++;
                        }
                        }
                        if(selectNum > banNums){
                            this.checked = false;
                        }
                    }
                }
            }
        </script>
        <script type="text/javascript">
        <!--
        function showvote(id){
            var newid=parseInt(id);
            vote_xmlhttp('include/showvoteconte.php?id='+id+"&"+Math.round(Math.random()*10000))
        }
        function vote_xmlhttp(url){
            var xmlhttp=null;
            if (window.XMLHttpRequest){xmlhttp = new XMLHttpRequest();}
            if (!xmlhttp&&window.ActiveXObject){
                try{xmlhttp = new ActiveXObject("Msxml2.XMLHTTP.5.0")}
                catch(e){try{xmlhttp = new ActiveXObject("Msxml2.XMLHTTP.4.0")}
                catch(e){
                    try{new ActiveXObject("Msxml2.XMLHTTP")}
                    catch(e){try{new ActiveXObject("Microsoft.XMLHTTP")}catch(e){}}}}}
            if(!xmlhttp){alert('您的浏览器不支持该操作!');
            }else{
                xmlhttp.open("GET",url,true);
                xmlhttp.setRequestHeader("Content-Type","application/x-www-form-urlencoded; charset=utf-8");
                xmlhttp.send(null);
                xmlhttp.onreadystatechange=function(){
                    if(xmlhttp.readyState==4){
                        if(xmlhttp.status==200){;
                            var baseText = null;
                            var rs=xmlhttp.responseText;

                            var popUp = document.getElementById("popupcontent");
                            popUp.innerHTML=rs;
                            if (baseText == null) baseText = popUp.innerHTML;
                            popUp.innerHTML = baseText + "<div id=\"statusbar\"><button onclick=\"hidePopup();\">关闭本窗口</button></div>";
                            popUp.style.visibility = "visible";
                        }else{alert('您的浏览器不支持该操作--!');}
                    }
                }
         }
        }
        function hidePopup(){
            var popUp = document.getElementById("popupcontent");
            popUp.style.visibility = "hidden";}
        //-->
        </script>
        <style type="text/css">
        </style>
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
        .nav{width:985px;margin:0 auto; text-align:center;font:normal 16px/34px "微软雅黑";color:#fff;height:34px;background: #FF4040; /* for non-css3 browsers */
            filter: progid:DXImageTransform.Microsoft.gradient(startColorstr='#ef400a', endColorstr='#9a0c58'); /* for IE */
            background: -webkit-gradient(linear, left top, left bottom, from(#ef400a), to(#9a0c58)); /* for webkit browsers */
                background: -moz-linear-gradient(top, #ef400a, #9a0c58); /* for firefox 3.6+ */
        }
        .nav a{font:bold 14px/34px "宋体";color:#fff;margin:0 35px;}
        #cleft{
            float:left;
            width:750px;
            background:#FFF;
            padding:10px;}
        #cleft ul{ width:750px; float:left; margin:10px 0;}
        h3{color:#fff;font-weight:bold;height:22px;line-height:22px;padding:0 10px;
            background: #FF4040; /* for non-css3 browsers */
            filter: progid:DXImageTransform.Microsoft.gradient(gradientType=1,startColorstr='#028317', endColorstr='#02bc21'); /* for IE */
            background: -webkit-gradient(linear, left top, right top, from(#028317), to(#02bc21)); /* for webkit browsers */
            background: -moz-linear-gradient(left_right, #028317, #02bc21); /* for firefox 3.6+ */}
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
            color: #FF4040;
        }
        .r_a a{color:#b70000;}
        .r_a img{margin:5px 0;}
        .user_info{width:600px; float:left; clear:both; padding-left:80px;}
        .user_info i{ font-style:normal; }
        </style>
</head>
<body style="background-color:#DEF0FC">
<div style="background-color:#FFF;margin:0 auto;height:35px; line-height:35px;">
<div style="width:1000px;margin:0 auto; background-color:#FFF; list-style-type:none;height:35px; line-height:35px;">
<span style="list-style:none; padding-bottom:20px;"><a href="#" target="_blank">第16届理想与成才报告团</a>|<a href="#" target="_blank">第15届理想与成才报告团</a>|<a href="#" target="_blank">第14届理想与成才报告团</a>|<a href="#" target="_blank">第13届理想与成才报告团</a>|<a href="#" target="_blank">第12届理想与成才报告团</a>|<a href="#" target="_blank">第11届理想与成才报告团</a></span>
</div></div>
<div style="margin:0 auto; text-align:center; width:980px;">
<img src="images/16.jpg">
</div><div style="clear:both"></div>
<div class="nav" ><a href="zuixin.html">第16届评选首页</a>|<a href="jieshao.html">活动介绍</a>|<a href="huigu.html">往期回顾</a>|<a href="index.html">理想与成才报告团专题网站首页</a></div>
<div style="width:180px;border:1px solid #c6c3c3;padding:5px;margin-right:185px; float:right; background:#fff;display:inline; overflow:hidden;line-height:200%;">
    <h3>投票规则：</h3>
    <b style="display:block;line-height:26px;">欢迎<?php echo $studentID ?> 同学投票</b>　　11月1日10时—12月1日21时，为期30天。 <b style="display:block;line-height:26px;">2.投票范围 </b>　　主办单位公布的候选人，候选人按姓氏笔画排序。 <b style="display:block;line-height:26px;">3.投票方式 </b> <b style="display:block;line-height:26px;"><font color="#FF0000">务请注意：网络投票与微信投票每人每次最多选择4名入围候选人 。</font><br \>（一）网络投票： </b>　　点击入围候选人照片下方的投票框，严禁利用任何不正当的手段刷票或者投票，一经查实违规行为将扣除存疑票数。 <br \>
<b style="display:block;line-height:26px;">（二）微信页面： </b>　　通过“东师易班”微信公众平台进行投票；<br \>
<strong>具体如下</strong>：<br \>
　　1)请在微信中关注“东师易班”微信公众号（可扫二维码添加）<br \> 　　2)关注“东师易班”后，请以留言方式投票，格式如下：<br \>
　　本人真实姓名+投票+候选人编号（可多选）+本人学号。
<br \>　　例如：如果投票人真实姓名为“刘某”，手机号码为“123456789”，想为第01、03、07、13号候选人投票，则留言内容为：“刘某+投票+01、03、07、13+123456789”
<br \>　　3)微信投票请属真实姓名和学号，否则投票无效。
<br \>
<h3>指导单位：</h3>
<div class="r_a"> <a href="#">东北师范大学</a> <a href="#">学生处</a></div>
<h3>主办单位：</h3>
</div>
<form action="doAction.php" method="post" id="voteform1061"  style="border:none;" >
    <div class="itagBox">
        <ul class="artist_l">
            <li sn="0001" class="tag1">
                <div class="votetext">
                    <div class="tag_txt">
                        <img src="images/img/张明新.jpg">
                    </div>
                    <a style="position:absolute;left:0px;top:0px; overflow-y: auto;  line-height:20px;text-align:center;padding-top:5px;display:block;color:#FFF;width:100%;height:145px; filter:alpha(opacity=95);background:#000;opacity:0.95;  background:#000;"href="16-zhangmx.html">
                        <?php echo $fields['0']['vote_name']?>
                    </a>
                </div>
                <div class="votedo">
                    <div class="cvotenum"><b><?php echo $fields['0']['vote_votes']?></b>票</div>
                    <div class="cvote"><input type="checkbox" id="0001" name="votedata" value="0001"   require="true" datatype="group" msgid="err1062" msg="请选择 1 - 5 个选项" min="1" max="4"  /><a href="16-zhangmx.html" target="_blank">张明新</a><input type="hidden" name="typename[0001]" value="张明新" /></div>
                </div>
            </li>
            <li sn="0002" class="tag1 ">
                <div class="votetext">
                    <div class="tag_txt">
                        <img src="images/img/牟平.jpg">
                    </div>
                    <a style="position:absolute;left:0px;top:0px; overflow-y: auto;  line-height:20px;text-align:center;padding-top:5px;display:block;color:#FFF;width:100%;height:145px; filter:alpha(opacity=95);background:#000;opacity:0.95;  background:#000;"href="16-zhangmx.html">
                        <?php echo $fields['1']['vote_name']?>
                    </a>
                </div> <div class="votedo">
                    <div class="cvotenum"><b><?php echo $fields['1']['vote_votes']?></b>票</div>
                    <div class="cvote"><input type="checkbox" id="0002" name="votedata" value="0002"   require="true" datatype="group" msgid="err1062" msg="请选择 1 - 5 个选项" min="1" max="4"  /><a href="16-zhangmx.html" target="_blank">牟  平</a><input type="hidden" name="typename[0002]" value="牟  平" /></div>
                </div>
            </li>
            <li  sn="0003" class="tag1"> <div class="votetext">
                    <div class="tag_txt">
                        <img src="images/img/李新月.jpg">
                    </div>
                    <a style="position:absolute;left:0px;top:0px; overflow-y: auto;  line-height:20px;text-align:center;padding-top:5px;display:block;color:#FFF;width:100%;height:145px; filter:alpha(opacity=95);background:#000;opacity:0.95;  background:#000;"href="16-zhangmx.html"> <?php echo $fields['2']['vote_name']?></a>
                </div>
                <div class="votedo">
                    <div class="cvotenum"><b><?php echo $fields['2']['vote_votes']?></b>票</div>
                    <div class="cvote"><input type="checkbox" id="0003" name="votedata" value="0003"   require="true" datatype="group" msgid="err1062" msg="请选择 1 - 5 个选项" min="1" max="4"  /><a href="16-zhangmx.html" target="_blank">李新月</a><input type="hidden" name="typename[0003]" value="李新月" /></div>
                </div>
            </li>
            <li sn="0004" class="tag1 "> <div class="votetext">
                    <div class="tag_txt">
                        <img src="images/img/徐菲.jpg">
                    </div>
                    <a style="position:absolute;left:0px;top:0px; overflow-y: auto;  line-height:20px;text-align:center;padding-top:5px;display:block;color:#FFF;width:100%;height:145px; filter:alpha(opacity=95);background:#000;opacity:0.95;  background:#000;"href="16-zhangmx.html"> <?php echo $fields['3']['vote_name']?></a>
                </div> <div class="votedo">
                    <div class="cvotenum"><b><?php echo $fields['3']['vote_votes']?></b>票</div>
                    <div class="cvote"><input type="checkbox" id="0004" name="votedata" value="0004"   require="true" datatype="group" msgid="err1062" msg="请选择 1 - 5 个选项" min="1" max="4"  /><a href="16-zhangmx.html" target="_blank">徐 菲</a><input type="hidden" name="typename[0004]" value="徐 菲" /></div>
                </div>
            </li>
            <li sn="0005" class="tag1"> <div class="votetext">
                    <div class="tag_txt">
                        <img src="images/img/刘佳玉.png">
                    </div>
                    <a style="position:absolute;left:0px;top:0px; overflow-y: auto;  line-height:20px;text-align:center;padding-top:5px;display:block;color:#FFF;width:100%;height:145px; filter:alpha(opacity=95);background:#000;opacity:0.95;  background:#000;"href="16-zhangmx.html"> <?php echo $fields['4']['vote_name']?></a>
                </div> <div class="votedo">
                    <div class="cvotenum"><b><?php echo $fields['4']['vote_votes']?></b>票</div>
                    <div class="cvote"><input type="checkbox" id="0005" name="votedata" value="0005"   require="true" datatype="group" msgid="err1062" msg="请选择 1 - 5 个选项" min="1" max="4"  /><a href="16-zhangmx.html" target="_blank">刘佳玉</a><input type="hidden" name="typename[0005]" value="刘佳玉" /></div>
                </div>
            </li>
            <li sn="0006" class="tag1"> <div class="votetext">
                    <div class="tag_txt">
                        <img src="images/img/李一聪.jpg">
                    </div>
                    <a style="position:absolute;left:0px;top:0px; overflow-y: auto;  line-height:20px;text-align:center;padding-top:5px;display:block;color:#FFF;width:100%;height:145px; filter:alpha(opacity=95);background:#000;opacity:0.95;  background:#000;"href="16-zhangmx.html"> <?php echo $fields['5']['vote_name']?></a>
                </div> <div class="votedo">
                    <div class="cvotenum"><b><?php echo $fields['5']['vote_votes']?></b>票</div>
                    <div class="cvote"><input type="checkbox" id="0006" name="votedata" value="0006"   require="true" datatype="group" msgid="err1062" msg="请选择 1 - 5 个选项" min="1" max="4"  /><a href="16-zhangmx.html" target="_blank">李一聪</a><input type="hidden" name="typename[0006]" value="李一聪" /></div>
                </div>
            </li>
            <li sn="0007" class="tag1"> <div class="votetext">
                    <div class="tag_txt">
                        <img src="images/img/赵娜娜.jpg">
                    </div>
                    <a style="position:absolute;left:0px;top:0px; overflow-y: auto;  line-height:20px;text-align:center;padding-top:5px;display:block;color:#FFF;width:100%;height:145px; filter:alpha(opacity=95);background:#000;opacity:0.95;  background:#000;"href="16-zhangmx.html"><?php echo $fields['6']['vote_name']?></a>
                </div> <div class="votedo">
                    <div class="cvotenum"><b><?php echo $fields['6']['vote_votes']?></b>票</div>
                    <div class="cvote"><input type="checkbox" id="0007" name="votedata" value="0007"   require="true" datatype="group" msgid="err1062" msg="请选择 1 - 5 个选项" min="1" max="4"  /><a href="16-zhangmx.html" target="_blank">赵娜娜</a><input type="hidden" name="typename[0007]" value="赵娜娜" /></div>
                </div>
            </li>
            <li sn="0008" class="tag1 "> <div class="votetext">
                    <div class="tag_txt">
                        <img src="images/img/徐浩.jpg">
                    </div>
                    <a style="position:absolute;left:0px;top:0px; overflow-y: auto;  line-height:20px;text-align:center;padding-top:5px;display:block;color:#FFF;width:100%;height:145px; filter:alpha(opacity=95);background:#000;opacity:0.95;  background:#000;"href="16-zhangmx.html"> <?php echo $fields['7']['vote_name']?></a>
                </div> <div class="votedo">
                    <div class="cvotenum"><b><?php echo $fields['7']['vote_votes']?></b>票</div>
                    <div class="cvote"><input type="checkbox" id="0008" name="votedata" value="0008"   require="true" datatype="group" msgid="err1062" msg="请选择 1 - 5 个选项" min="1" max="4"  /><a href="16-zhangmx.html" target="_blank">徐 浩</a><input type="hidden" name="typename[0008]" value="徐 浩" /></div>
                </div>
            </li>
            <li sn="0009" class="tag1"> <div class="votetext">
                    <div class="tag_txt">
                        <img src="images/img/李娜.jpg">
                    </div>
                    <a style="position:absolute;left:0px;top:0px; overflow-y: auto;  line-height:20px;text-align:center;padding-top:5px;display:block;color:#FFF;width:100%;height:145px; filter:alpha(opacity=95);background:#000;opacity:0.95;  background:#000;"href="16-zhangmx.html"> <?php echo $fields['8']['vote_name']?></a>
                </div> <div class="votedo">
                    <div class="cvotenum"><b><?php echo $fields['8']['vote_votes']?></b>票</div>
                    <div class="cvote"><input type="checkbox" id="0009" name="votedata" value="0009"   require="true" datatype="group" msgid="err1062" msg="请选择 1 - 5 个选项" min="1" max="4"  /><a href="16-zhangmx.html" target="_blank">李  娜</a><input type="hidden" name="typename[0009]" value="李  娜" /></div>
                </div>
            </li>
            <li sn="0010" class="tag1 "> <div class="votetext">
                    <div class="tag_txt">
                        <img src="images/img/孙亚荣.jpg">
                    </div>
                    <a style="position:absolute;left:0px;top:0px; overflow-y: auto;  line-height:20px;text-align:center;padding-top:5px;display:block;color:#FFF;width:100%;height:145px; filter:alpha(opacity=95);background:#000;opacity:0.95;  background:#000;"href="16-zhangmx.html"> <?php echo $fields['9']['vote_name']?></a>
                </div> <div class="votedo">
                    <div class="cvotenum"><b><?php echo $fields['9']['vote_votes']?></b>票</div>
                    <div class="cvote"><input type="checkbox" id="0010" name="votedata" value="0010"   require="true" datatype="group" msgid="err1062" msg="请选择 1 - 5 个选项" min="1" max="4"  /><a href="16-zhangmx.html" target="_blank">孙亚荣</a><input type="hidden" name="typename[0010]" value="孙亚荣" /></div>
                </div>
            </li>
            <li sn="0011" class="tag1 "> <div class="votetext">
                    <div class="tag_txt">
                        <img src="images/img/章芯卉.jpg">
                    </div>
                    <a style="position:absolute;left:0px;top:0px; overflow-y: auto;  line-height:20px;text-align:center;padding-top:5px;display:block;color:#FFF;width:100%;height:145px; filter:alpha(opacity=95);background:#000;opacity:0.95;  background:#000;"href="16-zhangmx.html"> <?php echo $fields['10']['vote_name']?></a>
                </div> <div class="votedo">
                    <div class="cvotenum"><b><?php echo $fields['10']['vote_votes']?></b>票</div>
                    <div class="cvote"><input type="checkbox" id="0011" name="votedata" value="0011"   require="true" datatype="group" msgid="err1062" msg="请选择 1 - 5 个选项" min="1" max="4"  /><a href="16-zhangmx.html" target="_blank">章芯卉</a><input type="hidden" name="typename[0011]" value="章芯卉" /></div>
                </div>
            </li>
            <li sn="0012" class="tag1 "> <div class="votetext">
                    <div class="tag_txt">
                        <img src="images/img/王煌.jpg">
                    </div>
                    <a style="position:absolute;left:0px;top:0px; overflow-y: auto;  line-height:20px;text-align:center;padding-top:5px;display:block;color:#FFF;width:100%;height:145px; filter:alpha(opacity=95);background:#000;opacity:0.95;  background:#000;"href="16-zhangmx.html"> <?php echo $fields['11']['vote_name']?></a>
                </div> <div class="votedo">
                    <div class="cvotenum"><b><?php echo $fields['11']['vote_votes']?></b>票</div>
                    <div class="cvote"><input type="checkbox" id="0012" name="votedata" value="0012"   require="true" datatype="group" msgid="err1062" msg="请选择 1 - 5 个选项" min="1" max="4"  /><a href="16-zhangmx.html" target="_blank">王  煌</a><input type="hidden" name="typename[0012]" value="王  煌" /></div>
                </div>
            </li>
            <li sn="0013" class="tag1 "> <div class="votetext">
                    <div class="tag_txt">
                        <img src="images/img/贾丙渊.jpg">
                    </div>
                    <a style="position:absolute;left:0px;top:0px; overflow-y: auto;  line-height:20px;text-align:center;padding-top:5px;display:block;color:#FFF;width:100%;height:145px; filter:alpha(opacity=95);background:#000;opacity:0.95;  background:#000;"href="16-zhangmx.html"> <?php echo $fields['12']['vote_name']?></a>
                </div> <div class="votedo">
                    <div class="cvotenum"><b><?php echo $fields['12']['vote_votes']?></b>票</div>
                    <div class="cvote"><input type="checkbox" id="0013" name="votedata" value="0013"   require="true" datatype="group" msgid="err1062" msg="请选择 1 - 5 个选项" min="1" max="4"  /><a href="16-zhangmx.html" target="_blank">贾丙渊</a><input type="hidden" name="typename[0013]" value="贾丙渊" /></div>
                </div>
            </li>
            <li sn="0014" class="tag1 "> <div class="votetext">
                    <div class="tag_txt">
                        <img src="images/img/傅琛洁.jpg">
                    </div>
                    <a style="position:absolute;left:0px;top:0px; overflow-y: auto;  line-height:20px;text-align:center;padding-top:5px;display:block;color:#FFF;width:100%;height:145px; filter:alpha(opacity=95);background:#000;opacity:0.95;  background:#000;"href="16-zhangmx.html"> <?php echo $fields['13']['vote_name']?></a>
                </div> <div class="votedo">
                    <div class="cvotenum"><b><?php echo $fields['13']['vote_votes']?></b>票</div>
                    <div class="cvote"><input type="checkbox" id="0014" name="votedata" value="0014"   require="true" datatype="group" msgid="err1062" msg="请选择 1 - 5 个选项" min="1" max="4"  /><a href="16-zhangmx.html" target="_blank">傅琛洁</a><input type="hidden" name="typename[0014]" value="傅琛洁" /></div>
                </div>
            </li>
            <li sn="0015" class="tag1 "> <div class="votetext">
                    <div class="tag_txt">
                        <img src="images/img/刘玉婷.jpg">
                    </div>
                    <a style="position:absolute;left:0px;top:0px; overflow-y: auto;  line-height:20px;text-align:center;padding-top:5px;display:block;color:#FFF;width:100%;height:145px; filter:alpha(opacity=95);background:#000;opacity:0.95;  background:#000;"href="16-zhangmx.html"><?php echo $fields['14']['vote_name']?></a>
                </div> <div class="votedo">
                    <div class="cvotenum"><b><?php echo $fields['14']['vote_votes']?></b>票</div>
                    <div class="cvote"><input type="checkbox" id="0015" name="votedata" value="0015"   require="true" datatype="group" msgid="err1062" msg="请选择 1 - 5 个选项" min="1" max="4"  /><a href="16-zhangmx.html" target="_blank">刘玉婷</a><input type="hidden" name="typename[0015]" value="刘玉婷" /></div>
                </div>
            </li>
        </ul>
    </div>
    <input type="submit" name="submit" value="提交">
</form>
<script>

    var sn;
    var name;
    var color="#B9DFF9" ;

    $(".optionpic").click(function(){
        sn=$(this).attr("sn");
        $("#"+sn).click();
        var s=$(this).find("input[type=radio]").attr("name");
        $("input[name="+s+"]").parent().css({"background-color":""});
        $(this).css({"background-color":color});
    });
    mode =0 ;
    $("#voteform1061").checkForm(0);
</script>
</body>
</html>