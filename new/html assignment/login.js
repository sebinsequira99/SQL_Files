//login component
var LogIn = (function(){
	var 
	_config,
	_login_templ = '<div class="panel panel-info" id="panel1">'+
					  '<div class="panel-heading">'+
					  '		<h3 class="panel-title">Log in</h3>'+
					  '</div>'+
					  '<div class="panel-body">'+
					  '     <form  role="form" id="login_form">'+
					  '			<div class="form-group">'+
					  '				<label for="">Username</label>'+
					  '				<input type="text" class="form-control" id="user_name" name="user_name" placeholder="Input field">'+
					  '			</div>'+
					  '			<div class="form-group">'+
					  '				<label for="">Password</label>'+
		   			  '			<input type="password" class="form-control" id="password" name="password" placeholder="Input field">'+
					  '			</div>'+
					  '			<button type="submit" class="btn btn-primary" id="login_submit">Submit</button>'+
					  '		</form>'+
					  '</div>'+
				      '</div>';
	//public
	return {
		init:function(_conf){
			_config = _conf;
			this.events();
		},
		build_html:function(){
			$(_config.show_div).html(_login_templ);
			this.login_events();
		},
		login_events:function(){
			var self= this;
			$("#login_form").submit(function(e){
				e.preventDefault();
				if(!self.validate()){
					alert("Please Enter valid date");
					return;
				}
				self.save_date();
			});
		},
		save_date:function(){
			$.ajax({
				url:'login.php',
				method:'post',
				data: $("#login_form").serialize(),
				success:function(){
					alert("Success");
				}
			})
		},
		validate:function(){
			var 
			user_name = $("#user_name"),
			password  = $("#password");
			if(user_name.val().length < 3){
				return false;
			}
			if(password.val().length <3){
				return false;
			}
			return true;
		},
		events:function(){
			var self= this;
			$(_config.button_id).on('click',function(){
				self.build_html();
			});
		}
	}
}());




$(function(){
	LogIn.init({
		button_id:"#login_btn",
		show_div:"#login_area"
	});
});

	// SS.init({
	// 	display_div:'#display_div',
	// 	data :[
	// 		{title:'Title!', img:"img/img1.jpg"}
	// 		{title:'Title!', img:"img/img1.jpg"}
	// 		{title:'Title!', img:"img/img1.jpg"}
	// 		{title:'Title!', img:"img/img1.jpg"}
	// 	]
	// })





