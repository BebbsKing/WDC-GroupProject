document.addEventListener('DOMContentLoaded', function() {

    $(document).ready(function(){

        $(function () {
            $('#datetimepicker3').datetimepicker({
                format: 'LT'
            });
        });

        $(function () {
            $('#datetimepicker4').datetimepicker({
                format: 'L'
            });
        });

        $('#one').click(function(){
            $('#people').val('1');
        });

        $('#two').click(function(){
            $('#people').val('2');
        });

        $('#three').click(function(){
            $('#people').val('3');
        });

        $('#four').click(function(){
            $('#people').val('4');
        });

        $('#five').click(function(){
            $('#people').val('5');
        });

        $('#six').click(function(){
            $('#people').val('6');
        });

        $('#seven').click(function(){
            $('#people').val('7');
        });

        $('#eight').click(function(){
            $('#people').val('8');
        });

    });

    $(function () {
        $('#datetimepicker3').datetimepicker({
            format: 'LT'
        });
    });

    $(function () {
        $('#datetimepicker4').datetimepicker({
            format: 'L'
        });
    });

    // console.log('local js loaded');

    //TODO: Implement AJAX responsive webpages

    // $('#details').click(function(){
    //     console.log('getting account details');
    //     // Create new AJAX request
    //     var xhttp = new XMLHttpRequest();
    //     // Define function that runs on response
    //     xhttp.onreadystatechange = function () {
    //         if (this.readyState == 4 && this.status == 200) {
    //             console.log('account details received');
    //             document.getElementById("account-main").innerHTML = this.responseText;
    //         }
    //     };
    //     // Open connection
    //     xhttp.open("GET", "/account/details", true);
    //     // Send request
    //     xhttp.send();
    // });

    // fix jquery linter issue
    /*jslint browser: true*/ /*global  $*/
    /*jslint browser: true*/ /*global  document*/

    // $('#sandbox-container input').datepicker({
    // });
    //
    // $(function() {
    //     $('#test').datepicker();
    // });

});
