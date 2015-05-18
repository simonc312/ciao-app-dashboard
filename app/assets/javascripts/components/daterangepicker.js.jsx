/** $jsx React.DOM */
var ReactDateRangePicker = require('react-bootstrap-daterangepicker');
alert(ReactDateRangePicker);
var datePickerComponent = (
	<ReactDateRangePicker startDate="4/1/2015" endDate="5/1/2015" maxDate="5/11/2015">
		<div>Click to Pick Dates </div>
	</ReactDateRangePicker>
);
var DateRangePicker = React.createClass({
    render: function () {
        return (
        		<div>Hello World
	        		{datePickerComponent}
        		</div>
        );
    }
});
window.DateRangePicker = DateRangePicker;
module.exports = DateRangePicker;