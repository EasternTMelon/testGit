<!DOCTYPE HTML>
<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ include file="/html/ML/jsp/CheckBrowser.jsp"%>
<%@ include file="/html/CM/msgDisplayer.jsp"%>
<%@ include file="/html/CM/header.jsp"%>
<html>
<head>
<title></title>
<%-- [設置IE兼容模式]什麼版本IE 就用什麼版本的標準模式 --%>
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta charset="UTF-8" />
<!--第三方-->
<link rel="stylesheet"
	href="${htmlBase}/ML/css/bootstrap/bootstrap-4.3.1.css">
<link rel="stylesheet" href="${htmlBase}/ML/css/fontawesome/all.css">
<link rel="stylesheet"
	href="${htmlBase}/ML/css/backend/checkbox-style.css">
<!--Cathay-->
<link rel="stylesheet" href="${htmlBase}/ML/css/backend/style.css">
<link rel="stylesheet" href="${htmlBase}/ML/css/backend/ui/TableUI.css">
<%--指定TableUI.css--%>

<!--第三方-->
<script src="${htmlBase}/ML/js/jquery/jquery-3.4.1.js"></script>
<!--Cathay-->
<script src="${htmlBase}/ML/js/ajax/CSRUtil.js"></script>
<script src="${htmlBase}/ML/js/ui/TableUI.js"></script>
<script src="${htmlBase}/ML/js/backend/ui/PageUI.js"></script>
<script src="${htmlBase}/CM/js/calendar.js"></script>
<script src="${htmlBase}/CM/js/date.js"></script>
<script src="${htmlBase}/CM/js/Validator.js"></script>
<script src="${htmlBase}/CM/js/ui/popupWin.js"></script>
<script src="${htmlBase}/ML/js/LimitUtil.js"></script>
<style>
	input[type=radio]{
		width :25px;
		height :25px;
	}
</style>

<script type="text/javascript">
	function TEST_1000() {
		var buttons = {
			//測試方法
			doAdd: function () {
				ajaxRequest.post('test', {
					'info': JSON.stringify(actions.getReqMap())
				}, function (resp) {
					actions.resetCtrlStatus();
					alert('新增成功');
					console.log('test');
					actions.doQuery();
				});
			},
			//新增
			doAdd : function() {
				//清空檢核
				validator.clear();
				validator.errHandler.clear();

				ajaxRequest.post('add', {
					'info' : JSON.stringify(actions.getReqMap())
				}, function(resp) {
					actions.resetCtrlStatus();
					alert('新增成功');
					actions.doQuery();
				});
			},

			//修改
			doModify : function() {
				var result = confirm('是否確定修改？');
				if (result) {
					ajaxRequest.post('modify', {
						'info' : JSON.stringify(actions.getReqMap()),
					}, function(resp) {
						actions.resetCtrlStatus();
						alert('修改成功');
						actions.doQuery();
					});
				}
			},

			//刪除
			doDelete : function() {
				var result = confirm('是否確定刪除？');
				if (result) {
					ajaxRequest.post('delete', {
						'info' : JSON.stringify(actions.getReqMap())
					}, function(resp) {
						actions.resetCtrlStatus();
						alert('刪除成功');
						actions.doQuery();
					});
				}
			},
			//-查詢
			doQuery : function() {
				let nowPage =  tableUI.pageCtrl.getRecordsInfo().pageNo;
				ajaxRequest.post('doQuery', {
					'info' : JSON.stringify(actions.getReqMap())
				}, function(resp) {
					if (resp.dataList) {
						if (STATE == "ADD") {
							tableUI.load(JSON.parse(resp.dataList)||'[]');
							tableUI.pageCtrl.loadLast();	
						} else {
							tableUI.load(JSON.parse(resp.dataList)||'[]');
							tableUI.pageCtrl.loadPage(nowPage);
						}
					}
				}, function(resp) {
					tableUI.clear();
				});
			}

		};


	}

</script>

</head>
<body>

</body>
</html>