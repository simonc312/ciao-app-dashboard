/** $jsx React.DOM */
var React = require('react');
var ReactDateRangePicker = require('react-bootstrap-daterangepicker');
var DateRangePicker = React.createClass({
    render: function () {
        return (
        		<div>Hello World
	        		<ReactDateRangePicker startDate="4/1/2015" endDate="5/1/2015" maxDate="5/11/2015">
	        			<div>Click to Pick Dates </div>
	        		</ReactDateRangePicker>
        		</div>
        );
    }
});
window.DateRangePicker = DateRangePicker;
module.exports = DateRangePicker;