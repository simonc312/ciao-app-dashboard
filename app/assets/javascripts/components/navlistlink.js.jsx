
var NavListLink = React.createClass({
    render: function () {
        return (
	        		<li className={this.props.classes}>
	        			<a href={this.props.linkPath}>{this.props.text}</a>
	        		</li>
        );
    }
});
window.NavListLink = NavListLink;
module.exports = NavListLink;