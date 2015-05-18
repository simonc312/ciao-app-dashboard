var SideBarNavList = require("./sidebar_navlist");
var NavListLink = require("./navlistlink");
var AdminSideBarNavList = React.createClass({

	render: function(){
		
		return (
			<SideBarNavList>
				<NavListLink text= "Dashboard Reports" linkPath= {Routes.admin_dashboard_path()} classes= "active" />
				<NavListLink text= "Manage Partners" linkPath= "#" />
				<NavListLink text= "Add New Partner" linkPath= "#" /> 
			</SideBarNavList>
		)

	}
});

window.AdminSideBarNavList = AdminSideBarNavList;
modules.exports = AdminSideBarNavList;