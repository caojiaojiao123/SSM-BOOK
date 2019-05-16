function getXMLHttpRequest() {
	try {
		return new XMLHttpRequest();
	} catch (e) {
		try {
			return new AcitiveXObject("Microsoft.XMLHTTP");
		} catch (e) {
			try {
				return new AcitiveXObject("Msxml2.XMLHTTP");
			} catch (e) {
				throw e;
			}
		}
	}
}

function ajax(opt) {
	// 1.得到对象
	var xmlhttp = getXMLHttpRequest();
	// 2.打开连接
	if (!opt.method) {
		opt.method = "GET";
	}
	if (opt.ansy == undefined) {
		opt.ansy = true;
	}
	xmlhttp.open(opt.method, opt.url, opt.ansy);
	// 3.发送请求
	if (opt.method == "POST") {
		xmlhttp.setRequestHeader("Content-type","application/x-www-form-urlencoded");
		}
	xmlhttp.send(opt.params);
	// 4.监听请求响应的变化
	xmlhttp.onreadystatechange = function() {
		
		if (xmlhttp.readyState == 4 && xmlhttp.status == 200) {
			
			var data;
			
			if (!opt.type) {
				
				data = xmlhttp.responseText;
				
			} else if (opt.type == "text") {
			
				
				data = xmlhttp.responseText;
				
				//alert(typeof data);
				
			} else if (opt.type == "xml") {
				
				data = xmlhttp.responseXML;
				
			} else if (opt.type == "json") {
				
				var content = xmlhttp.responseText;
				data = eval("(" + content + ")");
			}
			   
			// 交给success方法来处理
			opt.success(data);
			
		}
	}
}
