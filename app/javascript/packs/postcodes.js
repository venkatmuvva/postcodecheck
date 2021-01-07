$(function() {

    $('#postcodeForm').find('#validate').on('click', function (event) {
        event.preventDefault();
        if (validPostcode()) {
            $('#successMessage').hide();
            $('#errorMessage').hide();
            var token = $('meta[name=csrf-token]').attr('content');
            var postcode = $('#postcode').val().trim();
            $.ajax({
                url: "/validate",
                headers: {
                    'X-CSRF-Token': token
                },
                data: {
                    postcode: postcode,
                },
                success: function (response) {
                    $('#successMessage').show();
                    $('#successMessage').text("Entered postcode is accepted");
                },
                error: function (response) {
                    $('#errorMessage').show();
                    if (response.status ==  404) {
                        $('#errorMessage').text("Postcode is not accepted");
                    } else {
                        $('#errorMessage').text("Service unavailable");
                    }
                }
            })
        }
    });

    function validPostcode() {
        var postcode = $('#postcode').val().trim();
        if (typeof postcode != 'undefined' && postcode) {
            $('#errorMessage').hide();
            return true;
        } else {
            $('#errorMessage').show();
            $('#errorMessage').text("Enter valid postcode");
            return false;
        }
    }

});