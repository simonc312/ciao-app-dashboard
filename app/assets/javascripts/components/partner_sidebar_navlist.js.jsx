var SideBarNavList = require("./sidebar_navlist");
var NavListLink = require("./navlistlink");
var PartnerSideBarNavList = React.createClass({

	render: function(){
		
		return (
			<SideBarNavList>
				<NavListLink text= "Dashboard Reports" linkPath= "#" classes= "active" />
				<NavListLink text= "Manage Customers" linkPath= "#" />
			</SideBarNavList>
		)

	}
});

window.PartnerSideBarNavList = PartnerSideBarNavList;
module.exports = PartnerSideBarNavList;