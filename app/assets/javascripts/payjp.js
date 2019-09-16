//$(document).on('turbolinks:load', function() {
  $(function() {
    var form = $("#card-form");
      number = form.find('input[name="number"]'),
      cvc = form.find('input[name="cvc"]'),
      exp_month = form.find('input[name="exp_month"]'),
      exp_year = form.find('input[name="exp_year"]');

    $("#card-save").on("click", function(e) {
      e.preventDefault();
      console.log(1)
      form.find("input[type=submit]").prop("disabled", true);

      var card = {
          number: $("#payment_card_no").val(),
          cvc: $("#payment_card_security_code").val(),
          exp_month: $("#payment_card_expire_mm").val(),
          exp_year: $("#payment_card_expire_yy").val()
      };

      Payjp.createToken(card, function(s, response) {
        if (response.error) {
          console.log('false')
          form.find('button').prop('disabled', false);
        }
        else {
          console.log('true')
          $(".number").removeAttr("name");
          $(".cvc").removeAttr("name");
          $(".exp_month").removeAttr("name");
          $(".exp_year").removeAttr("name");
          var token = response.id;
          console.log(token)
          $("#card-form").append(`<input type="hidden" name="pay_id" class="payjp-token" value=${token} />`)
          $("#card-form").get(0).submit();
        }
      });
    });
  })
//});
