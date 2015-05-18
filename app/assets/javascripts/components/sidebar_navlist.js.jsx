var NavListLink = require("./navlistlink");

var SideBarNavList = React.createClass({

	render: function(){
		
		return (
			<ul className="nav navbar-nav sidebar-menu" id="navlist-custom">
					{this.props.children}
			</ul>
		)

	}
});

window.SideBarNavList = SideBarNavList;
modules.exports = SideBarNavList;