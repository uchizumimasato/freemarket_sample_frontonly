$(function(){

  // 画像のプレビューの関数
  function image(reader, file, img_count) {
    reader.onload = (function(file) {
    return function(e) {
      $('.productForm__field--top').append(`<img id=img-${img_count}>`)
      $(`#img-${img_count}`).attr("src", e.target.result)
      $(`#img-${img_count}`).css({"margin-left": "12px",
                                  "height": "224px",
                                  "width": "21%",
                                  "border": "1px dashed #ccc"});
    }
  })(file)
  reader.readAsDataURL(file)
  }

  $('.new_item').on('change', 'input[type="file"]', function(e) {
    var file = e.target.files[0]
    var reader = new FileReader()
    var img_count = $('.productForm__field--top img').length + 1
    var persent = 100 - ('25' * img_count)
    $('.formUploader').css('width', persent + '%')

    image(reader, file, img_count)

    $(`#${img_count}`).hide()
    var label = `<label id=${img_count + 1}>
                   <input class="avatar" multiple="multiple" type="file" name='item[images][]'>
                   <div class='uploadInfo'>
                     <p>ドラッグアンドドロップ</p>
                     <span>またはクリックしてアップロード</span>
                   </div>
                 </label>`
    $('.formUploader').append(label)
  })

  // カテゴリー
  // メンズかどうかを判断する関数
  function mans(id, name, child) {
    var id = $('#inputField__select--category option:selected').text() == 'メンズ' ? parseInt(id) + 10 : id
    $(`#inputField__select--category${child}`).append(`<option value=${id}>${name}</option>`)
  }
  // 子カテゴリーの選択
  $('#inputField__select--category').on('change', function() {
    var child_categories = {2: 'トップス', 3: 'ジャケット/アウター'}
    var select = `<select class="inputField inputField__select" id="inputField__select--category--child" name=item[category_id] >
                    <option>---</option>
                  </select>`
    var select_category_child = $('#inputField__select--category--child')
    $(select_category_child).remove()

    if ($('#inputField__select--category').val() != "") {
      $('#inputField__select--category').after(select)
      $.each(child_categories, function(id, name) {
        mans(id, name, '--child')
      })
    }
  })
  // 孫カテゴリーの選択
  $('.productForm__field--category').on('change', '#inputField__select--category--child', function() {
    var grandchild_categories= {4: 'Tシャツ/カットソー(半袖/袖なし)', 5: 'Tシャツ/カットソー(七分/長袖)', 6: 'その他', 7: 'テーラードジャケット', 8: 'ノーカラージャケット', 9: 'Gジャン/デニムジャケット', 10: 'その他'}
    var category_child_text = $('#inputField__select--category--child option:selected').text()
    var select_category_grandchild = $('#inputField__select--category--grandchild')
    var select = `<select class='inputField inputField__select' id='inputField__select--category--grandchild' name=item[category_id] >
                  <option>---</option>
                </select>`
    $(select_category_grandchild).remove()

    if ($('#inputField__select--category--child').val() != '---') {
      $('#inputField__select--category--child').after(select)
      $.each(grandchild_categories, function(id, name) {
        if (category_child_text == 'トップス' && id <= 6) {
          mans(id, name, '--grandchild')
        } else if (category_child_text == 'ジャケット/アウター' && id >= 7) {
          mans(id, name, '--grandchild')
        }
      })
    }
  })

  $('.productBtn').on('submit', function() {})

  // 配送の関数
  $('#inputField__select--fee').on('change', function() {
    $('.delivery_method').remove()
    var val = $('#inputField__select--fee').val() == "" ? 3 : $('#inputField__select--fee').val()
    if (val == 0) {
      var select = `<div class='productForm__field delivery_method'>
                     <label>配送の方法</label>
                     <span class='formRequired'>必須</span>
                     <br>
                     <select class='inputField inputField__select' name='item[delivery_method]'>
                       <option>---</option>
                       <option value=0>未定</option>
                       <option value=1>らくらくメルカリ便</option>
                       <option value=2>ゆうメール</option>
                       <option value=3>レターパック</option>
                       <option value=4>普通郵便</option>
                       <option value=5>クロネコヤマト</option>
                       <option value=6>ゆうパック</option>
                       <option value=7>クリックポスト</option>
                       <option value=8>ゆうパケット</option>
                     </select>
                   </div>`
      $('.inputDelivery_fee').after(select)
    } else if (val == 1) {
      var select = `<div class='productForm__field delivery_method' name='item[delivery_method'>
                     <label>配送の方法</label>
                     <span class='formRequired'>1</span>
                     <br>
                     <select class='inputField inputField__select'>
                       <option>---</option>
                       <option value=0>未定</option>
                       <option value=5>クロネコヤマト</option>
                       <option value=6>ゆうパック</option>
                       <option value=2>ゆうメール</option>
                     </select>
                   </div>`
      $('.inputDelivery_fee').after(select)
    } else {
      $('contentRight .delivery_method').remove()
    }
  });

  $('.inputField__price').on('input', function() {
    var val = $('.inputField__price').val()

    if (val != '') {
      var persent = val / 10
      var price = val - persent

      $('.profitholder .profitholder--persent li')[1].remove()
      $('.profitholder .profitholder--output li')[1].remove()

      var persent = `<li class='persent'>￥${persent}</li>`
      var price = `<li>￥${price}</li>`

      $('.profitholder .profitholder--persent').append(persent)
      $('.profitholder .profitholder--output').append(price)
    } else {
      $('.profitholder .profitholder--persent li')[1].remove()
      $('.profitholder .profitholder--output li')[1].remove()

      $('.profitholder .profitholder--persent').append(`<li>-</li>`)
      $('.profitholder .profitholder--output').append(`<li>-</li>`)
    }
  })
});

