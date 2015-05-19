var SideBarNavList = require("./sidebar_navlist");
var NavListLink = require("./navlistlink");
var AdminSideBarNavList = React.createClass({

	render: function(){
		
		return (
			<SideBarNavList>
				<NavListLink text= "Dashboard Reports" linkPath= {this.props.dashboardPath} classes= "active" />
				<NavListLink text= "Manage Partners" linkPath= "#" />
				<NavListLink text= "Add New Partner" linkPath= "#" /> 
			</SideBarNavList>
		)

	}
});

window.AdminSideBarNavList = AdminSideBarNavList;
module.exports = AdminSideBarNavList;