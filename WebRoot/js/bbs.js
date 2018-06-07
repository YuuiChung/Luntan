

$(function () {

	//个人中心
	$('#header .member').hover(function () {
		$('#header .member_ul').show().animate({
			mul : {
				o : 100,
				h : 100
			}
		});
	}, function () {
		$('#header .member_ul').animate({
			mul : {
				o : 0,
				h : 0
			},
			fn : function () {
				$('#header .member_ul').hide();
			}
		});
	});
	
	//滑动导航
	$('#nav .about li').hover(function () {
		var target = $(this).first().offsetLeft;
		$('#nav .nav_bg').animate({
			attr : 'x',
			target : target + 20,
			fn : function () {
				$('#nav .white').animate({
					attr : 'x',
					target : -target
				});
			}
		});
	}, function () {
		$('#nav .nav_bg').animate({
			attr : 'x',
			target : 20,
			fn : function () {
				$('#nav .white').animate({
					attr : 'x',
					target : 0
				});
			}
		});
	});
	
	//轮播器初始化
	$('#banner img').opacity(0);
	$('#banner img').getElement(0).opacity(100);
	$('#banner ul li').getElement(0).css('color', '#333');
	
	//轮播器计数器
	var banner_index = 1;
	
	//轮播器的种类
	var banner_type = 1; 		//1表示透明度，2表示上下滚动
	
	//自动轮播器
	var banner_timer = setInterval(banner_fn, 3000);
	
	//手动轮播器
	$('#banner ul li').hover(function () {
		clearInterval(banner_timer);
		if ($(this).css('color') != 'rgb(51, 51, 51)' && $(this).css('color') != '#333') {
			banner(this, banner_index == 0 ? $('#banner ul li').length() - 1 : banner_index - 1);
		}
	}, function () {
		banner_index = $(this).index() + 1;
		banner_timer = setInterval(banner_fn, 3000);
	});
	
	function banner(obj, prev) {
		$('#banner ul li').css('color', '#999');
		$(obj).css('color', '#333');
		$('#banner strong').html($('#banner img').getElement($(obj).index()).attr('alt'));
		
		if (banner_type == 1) {
			$('#banner img').getElement(prev).animate({
				attr : 'o',
				target : 0
			}).css('zIndex', 1);
			$('#banner img').getElement($(obj).index()).animate({
				attr : 'o',
				target : 100
			}).css('zIndex', 2);
		} else if (banner_type == 2) {
			$('#banner img').getElement(prev).animate({
				attr : 'y',
				target : 150
			}).css('zIndex', 1).opacity(100);
			$('#banner img').getElement($(obj).index()).animate({
				attr : 'y',
				target : 0
			}).css('top', '-150px').css('zIndex', 2).opacity(100);
		}
		
	}
	
	function banner_fn() {
		if (banner_index >= $('#banner ul li').length()) banner_index = 0;
		banner($('#banner ul li').getElement(banner_index).first(), banner_index == 0 ? $('#banner ul li').length() - 1 : banner_index - 1);
		banner_index++;
	}
	
	
	//遮罩画布
	var screen = $('#screen');
	
	//换肤
	var skin = $("#skin");
	skin.center(650,360).resize(function (){
		if (skin.css("display") == "block")
		{
			screen.lock();
		}
	});

	$("#skin_a").click(function (){
		skin.show().center(650,360);
		screen.lock().animate({
			"attr" : "o",
			"target" : 30
		});
				$("#skin .skin_bg").html(html).opacity(0).animate({
					"attr" : "o",
					"target" : 100
				});
	});
	
				$("#skin .skin_bg dl dt img").click(function (){
					$("body").css("background",$(this).attr("bg_color")+ " " + "url(" + $(this).attr("big_bg") + ') repeat-x');
								$("#success").show().center(200,40);
								$("#success p").html("皮肤更换成功...");
								setTimeout(function (){
									$("#success").hide();
								},1500);
					});

	$("#skin .close").click(function (){
		$("#skin").hide();
		screen.animate({
			"attr" : "o",
			"target" : 0,
			"fn" : function (){
				screen.unlock();
			}
		});
	});

	skin.drag($("#skin h2").last());

	function check(fieldName,UseName,RemName,len){
	    if(fieldName.value.length>len){
	        fieldName.value=(fieldName.value).substring(0,len);
	        alert("最多可只允许输入 "+len+" 个字符！");
	        return false;
	    }
	    else{
	        UseName.value=eval(fieldName.value.length);
	        RemName.value=len-UseName.value;
	        return true;
	    }
	}

	function doText(ob,text) {
		ob.value+=text
		ob.focus();
	}

	function bold(ob) {
		inTxt=prompt("加粗文字！","请输入要加粗的文字！");     
		if (inTxt!=null) {           
			bTxt="[b]"+inTxt+"[/b]";
			doText(ob,bTxt);
		}
	}

	function italic(ob) {
		inTxt=prompt("倾斜文字.","请输入要倾斜的文字！");     
		if (inTxt!=null) {           
			iTxt="[i]"+inTxt+"[/i]";
			doText(ob,iTxt);
		}
	}

	function line(ob) {
		inTxt=prompt("加下化线.","请输入要下化线的文字！");     
		if (inTxt!=null) {           
			lTxt="[u]"+inTxt+"[/u]";
			doText(ob,lTxt);
		}
	}

	function showface(ob,face) {
		inTxt=prompt("设置字体样式为："+face,"请输入要设置样式的文字！"); 
		if (inTxt!=null) { 
			fTxt="[Fface="+face+"]"+inTxt+"[/font]";
			doText(ob,fTxt);
		}
	}

	function showsize(ob,size) {
		inTxt=prompt("设置字体大小为："+size,"请输入要设置大小的文字！"); 
		if (inTxt!=null) { 
			sTxt="[Fstyle=font-size:"+size+"]"+inTxt+"[/font]";
			doText(ob,sTxt);
		}
	}

	function showcolor(ob,color) {
		inTxt=prompt("设置字体颜色！","请输入要设置颜色的文字！"); 
		if(inTxt!=null){
			cTxt="[Fcolor="+color+"]"+inTxt+"[/font]"; 
			doText(ob,cTxt);
		}	
	}

	function showHead(ico){
		document.images['head'].src="images/face/user/"+ico;
	}
});
