$(document).on('turbolinks:load', function() {
  var c_search = $("#category");
  function appedMselect() {
    var html =
    `<div class="select-wrap" id="add-Mcat">
      <select name="item[maincategory_id]" id="m_category" class="select-default">
        <option value>---</option>
      </select>
      <i class="fa fa-angle-down icon icon-arrow-bottom"></i>
    </div>`
    c_search.append(html)
  }

  function appedSselect() {
    var html =
    `<div class="select-wrap" id="add-Scat">
      <select name="item[maincategory_id]" id="s_category" class="select-default">
        <option value>---</option>
      </select>
      <i class="fa fa-angle-down icon icon-arrow-bottom"></i>
    </div>`
    c_search.append(html)
  }

  function appendMcat(m_cat){
    $("#m_category").append(
      $("<option>")
      .val($(m_cat).attr('id'))
      .text($(m_cat).attr('name'))
    );
  };

  function appendScat(s_cat){
    $("#s_category").append(
      $("<option>")
      .val($(s_cat).attr('id'))
      .text($(s_cat).attr('name'))
    );
  };

  $("#l_category").on('change', function(){
    l_cat = $(this).val();
    console.log(l_cat);
    $("#add-Mcat, #add-Scat").remove();

    $.ajax({
      type: "GET",
      url: "/items/search",
      data: {l_cat: l_cat},
      dataType: 'json'
    })
    .done(function(m_cat){
      appedMselect();
      m_cat.forEach(function(m_cat){
        appendMcat(m_cat);
      })
    })
  })

  $(document).on('change', '#m_category', function(){
      m_cat = $(this).val();
      $("#add-Scat").remove()

      $.ajax({
        type: "GET",
        url: "/items/search",
        data: {m_cat: m_cat},
        dataType: 'json'
      })
      .done(function(s_cat){
        appedSselect();
        s_cat.forEach(function(s_cat){
          appendScat(s_cat);
      })
    })
  })
});
